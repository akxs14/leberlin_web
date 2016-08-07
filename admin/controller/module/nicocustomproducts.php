<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicocustomproducts';

class ControllerModuleNicocustomproducts extends NicoModule 
{
	private $error = array(); 
	
	public function index() {   
		$data = array();
		
		$this->init($data);
		
		$this->products($data);
		$this->categories($data);
		$this->manufacturers($data);

		$opencart_version = (int)str_replace('.','',VERSION);
		if ($opencart_version >= 2200)
		{
			return $this->response->setOutput($this->load->view('module/nicocustomproducts', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicocustomproducts.tpl', $data));
		} else
		{
			$this->template = 'module/nicocustomproducts.tpl';
			$this->data = &$data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		$opencart_version = (int)str_replace('.','',VERSION);
		$module_path = 'module/';
		if ($opencart_version >= 2300) $module_path = 'extension/module/';
		if (!$this->user->hasPermission('modify', $module_path. 'nicocustomproducts')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		/*
		if (isset($this->request->post['image_width'])) {
			foreach ($this->request->post['nicocustomproducts_module'] as $key => $value) {
				if (!$value['image_width'] || !$value['image_height']) {
					$this->error['image'][$key] = $this->language->get('error_image');
				}
			}
		}*/
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicocustomproducts extends ControllerModuleNicocustomproducts {}; 
