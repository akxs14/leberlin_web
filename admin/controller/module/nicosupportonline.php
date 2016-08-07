<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicosupportonline';

class ControllerModuleNicosupportonline extends NicoModule 
{
	private $error = array(); 
	
	public function index() {   
		$data = array();
		
		$this->init($data);
		$this->categories($data);
		$this->manufacturers($data);
				
		if ($data['opencart_version'] > 1564)
		{
			$this->response->setOutput($this->load->view('module/nicosupportonline.tpl', $data));
		} else
		{
			$this->template = 'module/nicosupportonline.tpl';
			$this->data = $data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nicosupportonline')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicosupportonline extends ControllerModuleNicosupportonline {}; 
