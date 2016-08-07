<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicoproducttabs';

class ControllerModuleNicoproducttabs extends NicoModule 
{
	private $error = array(); 
	
	public function index() 
	{   
		$data = array();
		
		$this->init($data);
		$this->categories($data);
		$this->manufacturers($data);
		/*
		$this->products($data);
		$this->categories($data);
		$this->manufacturers($data);*/
		
		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicoproducttabs', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicoproducttabs.tpl', $data));
		} else
		{
			$this->template = 'module/nicoproducttabs.tpl';
			$this->data = &$data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nicoproducttabs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['nicoproducttabs_module'])) {
			foreach ($this->request->post['nicoproducttabs_module'] as $key => $value) {
			}
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicoproducttabs extends ControllerModuleNicoproducttabs {}; 
