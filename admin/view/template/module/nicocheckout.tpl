<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $section_config, $section_text, $font_awesome_icons, $nico_theme_positions, $opencart_version;
$module_name = 'nicocheckout';

$section_text = 'provider';
$no_module_layout = true;

$custom_tabs = 
array(
	'Checkout options' => 
	array('Visibility', 'Options')/*,
	'Footer' => 
	array('Contact details', 'Follow us', 'Custom columns'),*/
);

$module_config = array( 
	1 => //general options
	array(
		0 => //visibility
		array(
		/*
			array('0' => 'Opencart default',
				  '1' => 'One page quick checkout'),
			'Checkout'
		),*/

		'checkout_hide_fax'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Fax input <span class="help help-block">one page checkout</span>'
		),

		'checkout_hide_tax_id'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Tax id input <span class="help help-block">one page checkout</span>'
		),

		'checkout_hide_company_id'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Company id input <span class="help help-block">one page checkout</span>'
		),

		'checkout_hide_company'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Company input <span class="help help-block">one page checkout</span>'
		),

		'checkout_hide_address_2'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Address 2 input <span class="help help-block">one page checkout</span>'
		),

		'checkout_hide_country'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Country select <span class="help help-block">one page checkout</span>'
		),

		'checkout_hide_zone'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Region select <span class="help help-block">one page checkout</span>'
		),
		
		'checkout_hide_city'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'City input <span class="help help-block">one page checkout</span>'
		),

		'checkout_hide_postcode'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Postcode input <span class="help help-block">one page checkout</span>'
		),
		
		'checkout_hide_gift'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Gift voucher <span class="help help-block">one page checkout</span>'
		),
		'checkout_hide_coupon'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Coupon code <span class="help help-block">one page checkout</span>'
		),
		'checkout_hide_points'=>array('select', 
			array('0' => 'Show',
				  '1' => 'Hide'),
			'Reward points <span class="help help-block">one page checkout</span>'
		)),
		1 => //options
		array(
		'checkout_shipping_reload_payment'=>array('select', 
			array('0' => 'No',
				  '1' => 'Yes'),
			'Reload payment methods on shipping change <span class="help help-block">Useful when payment methods depend on shipping </span>'
		),
		'checkout_payment_auto_cofirm'=>array('select', 
			array('0' => 'Yes',
				  '1' => 'No'),
			'Automatically confirm order <span class="help help-block">Avoid second click for confirm order after checkout button is pressed, useful if the payment method module does not require additional input</span>'
		),

	'layout_id'=>array('hidden',null,'Layout id', '0',15),
)));

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
?>
<style>
#form-html > .form-group:first-child,#form-html > .form-group:nth-child(2) {display:none}
</style>
