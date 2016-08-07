<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicospeedcache';

class ControllerModuleNicoSpeedCache extends NicoModule 
{

    // Presets
    private $error = array();

    public function index($success = '') {

		$data = array();
		$data['no_instances'] = true;
		
		$this->init($data);
		$data['success'] = $success?$success:'';

		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicospeedcache', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicospeedcache.tpl', $data));
		} else
		{
			$this->template = 'module/nicospeedcache.tpl';
			$this->data = $data;
			$this->response->setOutput($this->render());
		}
    }

	public function install_speed_cache() 
	{   
		//patch index.php to add page caching
		
		$index_php = file_get_contents(DIR_APPLICATION . '/../index.php');

        if (!$this->user->hasPermission('modify', 'module/nicospeedcache')) {
            return $this->index('<strong style="color:red">' . $this->language->get('error_permission') . '</strong>');
        }

		$opencart_version = (int)str_replace('.','',VERSION);
		
		if ($index_php)
		{
			if (strpos($index_php, 'nico_speed_cache.inc') == false)
			{

				$speed_cache_install_start =
				"include('nico_speed_cache.inc');\nif (NICO_PAGE_CACHE) nico_speed_cache_page_init();\n// Install";

				$index_php = str_replace('// Install', $speed_cache_install_start, $index_php);
				$index_php .= 'if (NICO_PAGE_CACHE) nico_speed_cache_page_save();';


				if (file_put_contents(DIR_APPLICATION . '/../index.php', $index_php))
				return $this->index('Speed cache sucessfully installed!');
				else 
				return $this->index('<strong style="color:red">Failed to install speed cache probably because permissions, you need to manually install it, check the docs for howto</strong>');
				
			} else return $this->index('Speed cache is already installed');
		} else return $this->index('<strong style="color:red">Error reading opencart\'s index.php, install failed</strong>');
	}

	public function uninstall_speed_cache() 
	{   
		$index_php = file_get_contents(DIR_APPLICATION . '/../index.php');

        if (!$this->user->hasPermission('modify', 'module/nicospeedcache')) {
            return $this->index('<strong style="color:red">' . $this->language->get('error_permission') . '</strong>');
        }

		$opencart_version = (int)str_replace('.','',VERSION);

		
		if ($index_php)
		{
			if (strpos($index_php, 'nico_speed_cache.inc') != false)
			{

				$speed_cache_install_start =
				'@include\(\'nico_speed_cache.inc\'\);.*// Install@ms';

				$index_php = preg_replace($speed_cache_install_start, '// Install', $index_php);

				$index_php = str_replace('if (NICO_PAGE_CACHE) nico_speed_cache_page_save();', '', $index_php);
				
				if (file_put_contents(DIR_APPLICATION . '/../index.php', $index_php))
				return $this->index('Speed cache sucessfully uninstalled!');
				else 
				return $this->index('<strong style="color:red">Failed to uninstall speed cache probably because permissions, you need to manually uninstall it, check the docs for howto</strong>');
				
			} else return $this->index('Speed cache is already uninstalled');
		} else return $this->index('<strong style="color:red">Error reading opencart\'s index.php, uninstall failed</strong>');
	}


	public function clear_speed_cache() 
	{   
        if (!$this->user->hasPermission('modify', 'module/nicospeedcache')) {
            return $this->index('<strong style="color:red">' . $this->language->get('error_permission') . '</strong>');
        }

		$files = glob(DIR_CACHE . 'nico_speed_cache_*');

		if ($files) {
			foreach ($files as $file) {
				if (file_exists($file)) {
					unlink($file);
				}
			}
		}
		
		return $this->index('Speed cache cleared!');
	}
	
	public function clear_opencart_cache() 
	{   
		
        if (!$this->user->hasPermission('modify', 'module/nicospeedcache')) {
            return $this->index('<strong style="color:red">' . $this->language->get('error_permission') . '</strong>');
        }

		$files = glob(DIR_CACHE . 'cache.*');

		if ($files) {
			foreach ($files as $file) {
				if (file_exists($file)) {
					unlink($file);
				}
			}
		}

		return $this->index('Opencart cache cleared!');
	}
	
	public function clear_javascript_cache() 
	{   
		
        if (!$this->user->hasPermission('modify', 'module/nicospeedcache')) {
            return $this->index('<strong style="color:red">' . $this->language->get('error_permission') . '</strong>');
        }

		$files = glob(DIR_CATALOG . 'view/theme/*/js/_nico_*');

		if ($files) {
			foreach ($files as $file) {
				if (file_exists($file)) {
					unlink($file);
				}
			}
		}

		return $this->index('Javascript cache cleared!');
	}
	
	public function clear_css_cache() 
	{   
		
        if (!$this->user->hasPermission('modify', 'module/nicospeedcache')) {
            return $this->index('<strong style="color:red">' . $this->language->get('error_permission') . '</strong>');
        }

		$files = glob(DIR_CATALOG . 'view/theme/*/css/_nico_*');

		if ($files) {
			foreach ($files as $file) {
				if (file_exists($file)) {
					unlink($file);
				}
			}
		}

		return $this->index('Css cache cleared!');
	}
	

    protected function validate() {

        // Check Permissions
        if (!$this->user->hasPermission('modify', 'module/nicospeedcache')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}

class ControllerExtensionModuleNicospeedcache extends ControllerModuleNicospeedcache {}; 
