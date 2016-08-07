<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $section_config, $section_text, $_modules, $nico_theme_positions, $_clear_speed_cache, $_clear_opencart_cache;
$_modules = $modules;
if (isset($clear_speed_cache)) $_clear_speed_cache = $clear_speed_cache; else $_clear_speed_cache = NULL;
if (isset($clear_opencart_cache)) $_clear_opencart_cache = $clear_opencart_cache; else $_clear_opencart_cache = NULL;
$module_name = 'nicocontrolpanel';
$section_text = 'slide';
$no_module_layout = true;

$theme_config = dirname($_SERVER['SCRIPT_FILENAME']) . '/../catalog/view/theme/' . $theme_name . '/nico_theme_editor/panel_config.inc';

if (!file_exists($theme_config))
{
	echo $header;
	die('<h2 style="text-align:center;padding:30px;">Theme not installed!</h2>' . $footer);
}


include($theme_config);

if ($opencart_version >= 2010) 
{
	require('nicomodule2.tpl');
} else
if ($opencart_version >= 2000) 
{
	require('nicomodule2.tpl');
} else
{
	require('nicomodule.tpl');
}

function _nico_is_speed_cache()
{
//	return true;
		$index_php = file_get_contents(DIR_APPLICATION . '/../index.php');
		return (!empty($index_php) && strpos($index_php, 'nico_speed_cache.inc') !== false);
}
function speed_cache($module)
{
	global $theme_name, $_clear_speed_cache, $_clear_opencart_cache;
	if (($_clear_speed_cache && $_clear_speed_cache == 'clear') || ($_clear_opencart_cache && $_clear_opencart_cache == 'clear'))
	{?>
	    <div class="alert alert-information bg-success"><i class="fa fa-exclamation-circle"></i> 
			Cache cleared
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>

		<script>
			jQuery(document).ready(function() 
			{ 
				jQuery(".tab-7-section").click();
			});
		</script>
	<?php }
	if (!_nico_is_speed_cache()) 
	{
		?>
		
		<h3 style="color:red">Speed cache not installed</h3>
		<h4>To install it set write permission for opencart's index.php and use <a target="_blank" href="http://<?php echo $theme_name;?>.nicolette.ro/docs/index.html#sample">import tool</a> with only <i>speed cache option</i> checked then set back read only permission for index.php</h4>
		
		<?php
		return;
	}
	?>
	<h4 style="color:green">Speed cache installed</h4><br/>
	<a href="?route=module/nicocontrolpanel/clear_speed_cache&token=<?php echo $_GET['token'];?>#tab-section-1-7" class="btn btn-primary" name="clear_speed_cache" value="clear_speed_cache">Clear speed cache</a>
	<a href="?route=module/nicocontrolpanel/clear_opencart_cache&token=<?php echo $_GET['token'];?>#tab-section-1-7" class="btn btn-default" name="clear_speed_cache" value="clear_speed_cache">Clear opencart cache</a>
	<?php
}
