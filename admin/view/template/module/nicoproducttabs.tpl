<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $section_config, $section_text, $font_awesome_icons, $nico_theme_positions, $opencart_version;
if (isset($products)) $autocomplete_products = $products;

$module_name = 'nicoproducttabs';
$section_text = 'product tab';

$module_config = array(
	'section' => array('section'),
);

$section_config = array(
	'title'=>array('multilanguage',null,'Tab name'),
	'text'=>array('multilanguage_html',null,'Tab content'),
	'youtube'=>array('input',null,'Youtube video id'),
	'vimeo'=>array('input',null,'Vimeo video id'),
/*
	'section_type'=>array('select', 
					array(
						  'global' => 'All products',
						  'autocomplete' => 'Some products',
						  'category' => 'For a certain category',
						  'manufacturer' => 'For a certain manufacturer',
						  ),
					'Show for'
				),

	'global_section'=>array('section_type'),
	'autocomplete_section'=>array('section_type'),
	'product_list'=>array('autocomplete',null,'Products'),


	'category_section'=>array('section_type'),
	'category'=>array('select', $categories,
			'Category'
		),

	'manufacturer_section'=>array('section_type'),
	'manufacturer'=>array('select', $manufacturers,
			'Manufacturer'
		),*/
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
