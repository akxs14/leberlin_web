<?php
include_once(DIR_APPLICATION . '/controller/module/nicomodule.inc');
class ControllerModuleNicopopup  extends NicoModule
{
	public function index($setting) 
	{
		if (!$this->is_filter_ok($setting)) return false;
		$this->load->model('tool/image');
		$opencart_version = (int)str_replace('.','',VERSION);
		$data = $setting;		

		$lang_code = isset($this->session->data['language'])?$this->session->data['language']:$this->language->get('code');
		
		if (!$lang_code || is_object($lang_code)) $lang_code = $lang_code->get('code');
		
		$lang_code = strtolower($lang_code);

		$default_lang = 'en';

		if ($opencart_version >= 2200)
		{
			$default_lang = 'en-gb';
		}

		global $_nico_module_counter;
		if (isset($_nico_module_counter['nicopopup'])) $_nico_module_counter['nicopopup']++; else $_nico_module_counter['nicopopup'] = 0;
		$data['module_id'] = $_nico_module_counter['nicopopup'];

		if (isset($data['close_button_text'][$lang_code])) $data['close_button_text']= $data['close_button_text'][$lang_code];else if (isset($data['close_button_text'][$default_lang])) $data['close_button_text'] = $data['close_button_text'][$default_lang];else $data['close_button_text'] = '';
		if (isset($data['checkbox_text'][$lang_code])) $data['checkbox_text']= $data['checkbox_text'][$lang_code];else if (isset($data['checkbox_text'][$default_lang])) $data['checkbox_text'] = $data['checkbox_text'][$default_lang];else $data['checkbox_text'] = '';

		if (isset($data['background_image']) && $setting['background_image'])
		{
			$resize_method = 0;
			if (isset($setting['resize_method']))
			{
				$resize_method = (int)$data['resize_method'];
			}
			
			if (isset($data['background_image']) && $data['background_image'])
			switch($resize_method)
			{
				case 1:
				$data['background_image'] = $this->model_tool_image->cropsize($data['background_image'], $data['image_width'], $data['image_height']);
				break;
				case 2:
				$data['background_image'] = $this->model_tool_image->resizewidth($data['background_image'], $data['image_width'], $data['image_height']);
				break;
				case 3:
				$data['background_image'] = $this->model_tool_image->resizeheight($data['background_image'], $data['image_width'], $data['image_height']);
				break;
				default:
				$data['background_image'] = $this->model_tool_image->resize/*keep*/($data['background_image'], $data['image_width'], $data['image_height']);
			}
		}
		
		
		switch($data['type'])
		{
			case 'module':
				if ($opencart_version > 2000)
				{
						
					$part = explode('.', $data['_module']);
					
					if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
						$data['content'] = $this->load->controller('module/' . $part[0]);
					}
					
					if (isset($part[1])) {
						$setting_info = $this->model_extension_module->getModule($part[1]);
						
						if ($setting_info && $setting_info['status']) {
							$data['content'] = $this->load->controller('module/' . $part[0], $setting_info);
						}
					}
				} else 
				{
					$part = explode('.', $data['_module']);
					
					$modules = $this->config->get($part[0] . '_module');

					if ($modules) {
						$i = 0;
						foreach ($modules as $module) 
						{
							$i++;
							if ($i == $part[1]) 
							{
								$data['content'] = $this->getChild('module/' . $part[0], $module);
								break;
							}
						}
					}				
				}
			break;
			case 'text':
				$data['content'] = isset($setting['content'][$lang_code])?html_entity_decode($setting['content'][$lang_code]):'';
			break;
		}
		
		return $this->_render('nicopopup', $data);
	}
}
