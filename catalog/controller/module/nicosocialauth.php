<?php
include_once(DIR_APPLICATION . '/controller/module/nicomodule.inc');
class ControllerModuleNicoSocialAuth extends NicoModule
{
    private $_config = array();
    private $_redirect;

    public function process() 
    {
		require_once( DIR_SYSTEM . "/library/Hybrid/Auth.php" );
		require_once( DIR_SYSTEM . "/library/Hybrid/Endpoint.php" ); 

		Hybrid_Endpoint::process();
	}		
	
	
    public function index() {
        
        $this->_prepare();
        $opencart_version = (int)str_replace('.','',VERSION);

        // Check if Logged
        if ($this->customer->isLogged()) {
            if ($opencart_version > 2000) $this->response->redirect($this->_redirect); else $this->redirect($this->_redirect);
        }


        // Dependencies
        $this->language->load('module/nicosocialauth');
        require_once(DIR_SYSTEM . 'library/Hybrid/Auth.php');
        $this->load->model('module/nicosocialauth');

        // Load Config
        $this->_config['base_url']   = $this->url->link('module/nicosocialauth/process');
        $this->_config['debug_file'] = DIR_SYSTEM . 'logs/hybridauth.txt';
        $this->_config['debug_mode'] = (bool) $this->config->get('hybrid_auth_debug');


		if (!$settings = $this->config->get('nicosocialauth')) 
		if ($settings = $this->config->get('nicosocialauth_module')) 
		{
			$settings = $settings[1];
		}

        $settings = $settings['section'];

        if (isset($this->request->get['provider'])) {
            $provider = $this->request->get['provider'];
        }

        foreach ($settings as $config) {
			if ($provider == $config['provider'])
            $this->_config['providers'][$config['provider']] = array('enabled' => (bool) $config['enabled'],
                                                                     'keys'    => array('id'     => $config['key'],
                                                                                        'key'    => $config['key'],
                                                                                        'secret' => $config['secret'],
                                                                                        'scope'  => $config['scope']));
        }

        try {
            // Authentication Begin
            $auth = new Hybrid_Auth($this->_config);
            $adapter = $auth->authenticate($provider);
            $user_profile = $adapter->getUserProfile();

            // 1 - check if user already have authenticated using this provider before
            $customer_id = $this->model_module_nicosocialauth->findCustomerByIdentifier($provider, $user_profile->identifier);

            if ($customer_id) {
                // 1.1 Login
                $this->model_module_nicosocialauth->login($customer_id);

                // 1.2 Redirect to Refer Page
                if ($opencart_version > 2000) $this->response->redirect($this->_redirect); else $this->redirect($this->_redirect);
            }

            // 2 - else, here lets check if the user email we got from the provider already exists in our database ( for this example the email is UNIQUE for each user )
            // if authentication does not exist, but the email address returned  by the provider does exist in database,
            // then we tell the user that the email  is already in use
            // but, its up to you if you want to associate the authentication with the user having the address email in the database
            if ($user_profile->email){
                $customer_id = $this->model_module_nicosocialauth->findCustomerByEmail($user_profile->email);

                if ($customer_id) {
                    $this->session->data['success'] = sprintf($this->language->get('text_provider_email_already_exists'), $provider, $user_profile->email);
                    if ($opencart_version > 2000) $this->response->redirect($this->_redirect); else $this->redirect($this->_redirect);
                }
            }

            // 3 - if authentication does not exist and email is not in use, then we create a new user
            $user_address = array();

            if (!empty($user_profile->address)) {
                $user_address[] = $user_profile->address;
            }

            if (!empty($user_profile->region)) {
                $user_address[] = $user_profile->region;
            }

            if (!empty($user_profile->country)) {
                $user_address[] = $user_profile->country;
            }

            // 3.1 - create new customer
            $customer_id = $this->model_module_nicosocialauth->addCustomer(
                array('email'      => $user_profile->email,
                      'firstname'  => $user_profile->firstName,
                      'lastname'   => $user_profile->lastName,
                      'telephone'  => $user_profile->phone,
                      'fax'        => false,
                      'newsletter' => true,
                      'company'    => false,
                      'address_1'  => ($user_address ? implode(', ', $user_address) : false),
                      'address_2'  => false,
                      'city'       => $user_profile->city,
                      'postcode'   => $user_profile->zip,
                      'country_id' => $this->model_module_nicosocialauth->findCountry($user_profile->country),
                      'zone_id'    => $this->model_module_nicosocialauth->findZone($user_profile->region),
                      'password'   => substr(rand().microtime(), 0, 6)));

            // 3.2 - create a new authentication for him
            $this->model_module_nicosocialauth->addAuthentication(
                array('customer_id' => (int) $customer_id,
                    'provider' => $provider,
                    'identifier' => $user_profile->identifier,
                    'web_site_url' => $user_profile->webSiteURL,
                    'profile_url' => $user_profile->profileURL,
                    'photo_url' => $user_profile->photoURL,
                    'display_name' => $user_profile->displayName,
                    'description' => $user_profile->description,
                    'first_name' => $user_profile->firstName,
                    'last_name' => $user_profile->lastName,
                    'gender' => $user_profile->gender,
                    'language' => $user_profile->language,
                    'age' => $user_profile->age,
                    'birth_day' => $user_profile->birthDay,
                    'birth_month' => $user_profile->birthMonth,
                    'birth_year' => $user_profile->birthYear,
                    'email' => $user_profile->email,
                    'email_verified' => $user_profile->emailVerified,
                    'phone' => $user_profile->phone,
                    'address' => $user_profile->address,
                    'country' => $user_profile->country,
                    'region' => $user_profile->region,
                    'city' => $user_profile->city,
                    'zip' => $user_profile->zip));

            // 3.3 - login
            $this->model_module_nicosocialauth->login($customer_id);
            setcookie('_npc_cust',true,0,'/');

            // 3.4 - redirect to Refer Page
            if ($opencart_version > 2000) $this->response->redirect($this->_redirect); else $this->redirect($this->_redirect);

       } catch (Exception $e) 
       {
            // Error Descriptions
            switch ($e->getCode()){
                case 0 : $error = "Unspecified error."; break;
                case 1 : $error = "Hybriauth configuration error."; break;
                case 2 : $error = "Provider not properly configured."; break;
                case 3 : $error = "Unknown or disabled provider."; break;
                case 4 : $error = "Missing provider application credentials."; break;
                case 5 : $error = "Authentication failed. The user has canceled the authentication or the provider refused the connection."; break;
                case 6 : $error = "User profile request failed. Most likely the user is not connected to the provider and he should to authenticate again.";
                         $adapter->logout();
                         break;
                case 7 : $error = "User not connected to the provider.";
                         $adapter->logout();
                         break;
            }

            $error .= "\n\nHybridAuth Error: " . $e->getMessage();
            $error .= "\n\nTrace:\n " . $e->getTraceAsString();
            $this->log->write($error);
		}
    }
    
    
    private function _prepare() {

        // Some API returns encoded URL
        if (isset($this->request->get) && isset($_GET)) {

            // Prepare for OpenCart
            foreach ($this->request->get as $key => $value) {
                $this->request->get[str_replace('amp;', '', $key)] = $value;
            }

            // Prepare for Library
            foreach ($_GET as $key => $value) {
                $_GET[str_replace('amp;', '', $key)] = $value;
            }
        }

        // Base64 URL Decode
        if (isset($this->request->get['redirect'])) {
            $this->_redirect = base64_decode($this->request->get['redirect']);
        } else {
            $this->_redirect = $this->url->link('account/login');
        }
    }
    
}
