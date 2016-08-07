<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicogooglemaps';

class ControllerModuleNicogooglemaps extends NicoModule 
{
	private $error = array(); 
	
	public function index() {   
		$data = array();
		
		$this->init($data);
		$this->categories($data);
		$this->manufacturers($data);
				
		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicogooglemaps', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicogooglemaps.tpl', $data));
		} else
		{
			$this->template = 'module/nicogooglemaps.tpl';
			$this->data = $data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nicogooglemaps')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicogooglemaps extends ControllerModuleNicogooglemaps {}; 
