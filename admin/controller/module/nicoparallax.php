<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicoparallax';

class ControllerModuleNicoparallax extends NicoModule 
{
	private $error = array(); 
	
	public function index() {   
		$data = array();
		
		$this->init($data);
		$this->categories($data);
		$this->manufacturers($data);
		$this->extensions($data);
				
		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicoparallax', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicoparallax.tpl', $data));
		} else
		{
			$this->template = 'module/nicoparallax.tpl';
			$this->data = $data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nicoparallax')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicoparallax extends ControllerModuleNicoparallax {}; 
