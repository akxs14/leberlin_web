<?php
include('nicomodule.inc');
global $_nico_module;
$_nico_module = 'nicoflexslider';

class ControllerModuleNicoflexslider extends NicoModule 
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
			return $this->response->setOutput($this->load->view('module/nicoflexslider', $data));
		} if ($opencart_version >= 2000)
		{
			$this->response->setOutput($this->load->view('module/nicoflexslider.tpl', $data));
		} else
		{
			$this->template = 'module/nicoflexslider.tpl';
			$this->data = &$data;
			$this->response->setOutput($this->render());
		}
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/nicoflexslider')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['nicoflexslider_module'])) {
			foreach ($this->request->post['nicoflexslider_module'] as $key => $value) {
				if (!$value['image_width'] || !$value['image_height']) {
					$this->error['image'][$key] = $this->language->get('error_image');
				}
			}
		}
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}

class ControllerExtensionModuleNicoflexslider extends ControllerModuleNicoflexslider {}; 
