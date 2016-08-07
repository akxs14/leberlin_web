<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $section_config, $section_text, $font_awesome_icons, $nico_theme_positions, $opencart_version;

$module_name = 'nicopopup';
$section_text = 'slide';


$module_config = array(
	'resize_method'=>array('select', 
					array('0' => 'Opencart default',
						  '1' => 'Crop and resize',
						  '2' => 'Width',
						  '3' => 'Height',
						  ),
					'Background image resize method'
				),
	'image_width'=>array('input',null,'Image width', 1200),
	'image_height'=>array('input',null,'Image Height', 300),

	'background_image'=>array('image',null, 'Background image'),
	

	'overlay_opacity'=>array('input',null,'Overlay opacity <span class="help help-block">(value between 0 for full transparent and 1 for opaque, recommended 0.3)</span>', '0.3'),
	'overlay_color'=>array('colorpicker',null, 'Overlay color','#333',15),

	
	'youtube_id'=>array('input',null,'Video background youtube id  <span class="help help-block">(for optional video background)</span>', ''),
	'vimeo_id'=>array('input',null,'Video background vimeo id <span class="help help-block">(for optional video background)</span>', ''),

	'close_button_text'=>array('multilanguage',null,'Close Button text', '0', 20),				
	'checkbox_text'=>array('multilanguage',null,'Do not show this again', '0', 20),				

	'popup_type'=>array('select', 
					array('block' => 'Block',
						  'modal' => 'Modal popup',
						  'button' => 'Button modal popup (open on click)',
						  'content' => 'Content with button modal popup (open on click)',
						  ),
					'Popup Type'
				),

	'visibility'=>array('select', 
					array('always' => 'Always visible',
						  'checkbox' => 'Visible with never show again checkbox',
						  'first' => 'Only on first visit',
						  'close' => 'Show until close button is clicked',
						  ),
					'Popup visibility'
				),


	'type'=>array('select', 
					array('text' => 'Text',
						  'module' => 'Module (render another module inside ex newsletter)',
						  'button' => 'Button (open on click)',
						  ),
					'Content Type'
				),


	'_module'=>array('module',$extensions,'Module instance', '0', 20, 'type_module_content'),				
	
	'content'=>array('multilanguage_html',null,'Content', '0', 20, 'type_text_content'),				

	'open_button_text'=>array('multilanguage',null,'Open Button text', '0', 20, 'type_button_content'),				
);

if ($opencart_version >= 2010) 
{?>
	<style>
	.type_module_content, .type_text_content, .type_button_content
	{
		display:none;	
	}
		
	.type_module .type_module_content, .type_text .type_text_content, .type_button .type_button_content
	{
		display:block;
	}	
	</style>
<?php
	require('nicomodule2010.tpl');
} else
if ($opencart_version >= 2000) 
{
	require('nicomodule2.tpl');
} else
{?>
	<style>
	.type_module_content, .type_text_content, .type_button_content
	{
		display:none;	
	}
		
	.type_module .type_module_content, .type_text .type_text_content, .type_button .type_button_content
	{
		display:table-row;
	}	
	</style>
<?php
	require('nicomodule.tpl');
}
