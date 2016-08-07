<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicosideblock';

class ControllerModuleNicosideblock extends NicoModule {
	private $error = array(); 
	
	public function index() 
	{   
		$data = array();
		
		$this->init($data);
		
		$this->products($data);
		$this->categories($data);
		$this->manufacturers($data);
		
		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicosideblock', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicosideblock.tpl', $data));
		} else
		{
			$this->template = 'module/nicosideblock.tpl';
			$this->data = &$data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nicosideblock')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['nicosideblock_module'])) {
			foreach ($this->request->post['nicosideblock_module'] as $key => $value) {
			}
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicosideblock extends ControllerModuleNicosideblock {}; 
