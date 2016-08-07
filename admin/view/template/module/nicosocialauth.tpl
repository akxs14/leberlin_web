<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $section_config, $section_text, $font_awesome_icons, $nico_theme_positions, $opencart_version;
$module_name = 'nicosocialauth';

$section_text = 'provider';
$no_module_layout = true;

$module_config = array(
			
	'social_auth_debug'=> array('select', 
					array(
						0 => 'Disabled',
						1 => 'Enabled'
						),
					'Debug <br/><a target="_blank" href="http://hybridauth.sourceforge.net/support.html">Documentation and help</a>'
				),
	'text'=>array('multilanguage',null,'Login text', 'Login with', 15),
	'section' => array('section'),
	'layout_id'=>array('hidden',null,'Layout id', '0',15),
);

$section_config = array(
	'provider'=>array('select',$providers_list,
					'Provider'
				),

	'enabled'=> array('select', 
					array(
						1 => 'Enabled',
						0 => 'Disabled'
						),
					'Enabled'
				),

	'key'=>array('input',null,'Key', '',15),
	'secret'=>array('input',null,'Secret', '',15),
	'scope'=>array('input',null,'Flags (optional)', '', 5),
	'sort_order'=>array('input',null,'Sort order', '', 5),
);				

if ($opencart_version >= 2010) 
{
	require('nicomodule2010.tpl');
} else
if ($opencart_version >= 2000) 
{
	require('nicomodule2.tpl');
} else
{
	require('nicomodule.tpl');
}
