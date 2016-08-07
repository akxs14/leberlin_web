<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicofilter';

class ControllerModulenicofilter extends NicoModule 
{
	private $error = array(); 
	
	public function index() {   
		$data = array();
		$this->categories($data);
		$this->manufacturers($data);
		
		$this->init($data);
				
		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicofilter', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicofilter.tpl', $data));
		} else
		{
			$this->template = 'module/nicofilter.tpl';
			$this->data = $data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nicofilter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicofilter extends ControllerModuleNicofilter {}; 
