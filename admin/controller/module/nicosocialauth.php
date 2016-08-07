<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicosocialauth';

class ControllerModuleNicoSocialAuth extends NicoModule 
{

    // Presets
    private $error = array();

    public function index() {

		$data = array();
		$data['no_instances'] = true;
		
		$this->init($data);

        $data['providers_list'] = array();

        if (is_dir(DIR_SYSTEM . '/library/Hybrid/Providers')) 
        {
            $providers = scandir(DIR_SYSTEM . '/library/Hybrid/Providers');

            if (count($providers)) 
            {
                foreach ($providers as $provider) 
                {
                    if ($provider != '.' && $provider != '..') 
                    {
						$prov = str_replace('.php', '', $provider);
                        $data['providers_list'][$prov] = $prov;
                    }
                }
            }
        }
        
		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicosocialauth', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicosocialauth.tpl', $data));
		} else
		{
			$this->template = 'module/nicosocialauth.tpl';
			$this->data = $data;
			$this->response->setOutput($this->render());
		}
    }

    protected function validate() {

        // Check Permissions
        if (!$this->user->hasPermission('modify', 'module/account')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}

class ControllerExtensionModuleNicosocialauth extends ControllerModuleNicosocialauth {}; 
