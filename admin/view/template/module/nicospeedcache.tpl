<?php 
global $module_name,  $autocomplete_products, $module_row, $module_name, $module_config, $config_size, $languages, $section_config, $section_text, $font_awesome_icons, $nico_theme_positions, $opencart_version, $_success;
$_success = $success;
$module_name = 'nicospeedcache';

$section_text = 'provider';
$no_module_layout = true;



$custom_tabs = 
array(
	'Speed cache' => 
	array('Cache')/*,
	'Footer' => 
	array('Contact details', 'Follow us', 'Custom columns'),*/
);

$module_config = array( 
	1 => //general options
	array(
		0 => //visibility
		array(			
	'speed_cache' => array('custom', 'speed_cache', 'Speed cache'),
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


function _nico_is_speed_cache()
{
		$index_php = file_get_contents(DIR_APPLICATION . '/../index.php');
		return (!empty($index_php) && strpos($index_php, 'nico_speed_cache.inc') !== false);
}

function _nico_is_index_writable()
{
		return is_writable(DIR_APPLICATION . '/../index.php');
}


function speed_cache($module)
{
	global $theme_name, $_clear_speed_cache, $_clear_opencart_cache, $_success;
	if ($_success) { 
	?>
		<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $_success; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } 
		if (!file_exists(DIR_APPLICATION . '/../nico_speed_cache.inc')) {?>
		<div class="alert alert-danger" role="alert">
			<h4>
				<span class="fa-stack fa-lg" class="text-danger"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-remove fa-stack-1x fa-inverse"></i></span> 
				<strong>nico_speed_cache.inc</strong> is not present in opencart root folder, you need to upload the file to use speed cache.</h4>
		</div>		
	<?php }
	if (!_nico_is_speed_cache()) 
	{
		?>
		<br/>
		
		<div class="alert alert-warning" role="alert">
			<h4>
				<span class="fa-stack fa-lg" class="text-warning"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-check fa-stack-1x fa-inverse"></i></span> 
				
				Speed cache is not installed</h4>
		</div>		

		<?php if (!_nico_is_index_writable()) {?>

		<h5 style="color:red">opencart's index.php is not writable by php</h4>

		<div class="alert alert-info" role="alert">
			<span class="fa-stack fa-lg" class="text-warning"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-info fa-stack-1x fa-inverse"></i></span> 
			Installation requires write permission (0777 or +w) for opencart's <b>index.php</b>, after install set back read only or previous permission for index.php.
		</div>
		<?php }?>

		<a class="btn btn-primary btn-lg" href="?route=module/nicospeedcache/install_speed_cache&token=<?php echo $_GET['token'];?>"><i class="fa fa-wrench"></i>&ensp;Install speed cache</a>
		
		<?php
		return;
	}
	
	$pages = glob(DIR_CACHE . 'nico_speed_cache_*');
	$objects= glob(DIR_CACHE . 'cache.*');
	$js_files = glob(DIR_CATALOG . 'view/theme/*/js/_nico_*');
	$css_files = glob(DIR_CATALOG . 'view/theme/*/css/_nico_*');
	
	$cache_stats = array();
	$total_pages = 0;
	$total_objects = 0;

	if (is_array($pages) && !empty($pages))
	foreach($pages as $page)
	{
			$page = str_replace(DIR_CACHE, '', $page);
			$page = ucfirst(str_replace('_', ' ', substr($page, strpos($page, '-') + 1)));	
			if (!$page) $page = 'Unkown';
			if (!isset($cache_stats[$page])) $cache_stats[$page] = 1; else $cache_stats[$page]++;
			$total_pages++;
	}

	if (is_array($objects) && !empty($objects))
	foreach($objects as $object)
	{
			$object = str_replace(DIR_CACHE . 'cache.', '', $object);
			$object = ucfirst(str_replace(array('nico','_', '  '), array('nico ',' ', ' '), substr($object, 0, strpos($object, '.'))));	
			if (!$object) $object = 'Unkown';
			if (!isset($object_stats[$object])) $object_stats[$object] = 1; else $object_stats[$object]++;
			$total_objects++;
	}
	//$pages
	
	?>
	<div class="well" style="line-height:24px;">
		<div class="alert" role="alert">
			<h4>
				<span class="fa-stack fa-lg" class="text-info"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-check fa-stack-1x fa-inverse"></i></span> 
				Speed cache is installed
			</h4>
		<hr style="border-color:#ccc"/>
		<table>
			<tr>
				<td style="vertical-align:top;padding:0px 20px;">
		Total cached pages: <strong><?php echo $total_pages;?></strong><br/>
		<ul>
			<?php 
			arsort($cache_stats);
			foreach($cache_stats as $cache => $count) {?>
			<li>
			<?php echo $cache;?>: <strong><?php echo $count;?></strong>
			</li>
			<?php }?>
		</ul>
		</td>
		<td style="vertical-align:top;padding:0px 20px;">
		Opencart cached objects: <strong><?php echo $total_objects;?></strong><br/>
		<ul>
			<?php 
			arsort($object_stats);
			foreach($object_stats as $object => $count) {?>
			<li>
			<?php echo $object;?>: <strong><?php echo $count;?></strong>
			</li>
			<?php }?>
		</ul>
		</td>
		<td style="vertical-align:top;padding:0px 20px;">
		Javascript cached files: <br/>
		<ul>
			<?php 
			if (is_array($js_files) && !empty($js_files))
			foreach($js_files as $file) {?>
			<li>
			<?php echo str_replace(DIR_CATALOG . 'view/theme/','',  $file);?>
			</li>
			<?php }?>
		</ul>
		Css cached files: <br/>
		<ul>
			<?php 
			if (is_array($css_files) && !empty($css_files))
			foreach($css_files as $file) {?>
			<li>
			<?php echo str_replace(DIR_CATALOG . 'view/theme/','', $file);?>
			</li>
			<?php }?>
		</ul>
		</td>
		</tr>
		</ul>
		</table>
		Cache timeout: <strong><?php include(DIR_APPLICATION . '/../nico_speed_cache.inc'); echo gmdate("H:i:s", NICO_PAGE_CACHE_TIMEOUT);?></strong> (h:m:s), total seconds: <?php echo NICO_PAGE_CACHE_TIMEOUT;?><br/>
		Cache strip space (html minify): <strong><?php echo NICO_PAGE_CACHE_STRIP_EXTRA_SPACE?'true':'false';?></strong><br/>
		Cache ignore: <strong><?php echo NICO_PAGE_CACHE_IGNORE;?></strong><br/>
		<i>Note: To change above variables edit <?php echo str_replace('/admin', '', DIR_APPLICATION) . '/nico_speed_cache.inc';?></i>
		</div>
	</div>

	<a href="?route=module/nicospeedcache/clear_speed_cache&token=<?php echo $_GET['token'];?>" class="btn btn-primary" name="clear_speed_cache" value="clear_speed_cache"><i class="fa fa-refresh"></i>&ensp;Clear speed cache</a>
	<a href="?route=module/nicospeedcache/clear_opencart_cache&token=<?php echo $_GET['token'];?>" class="btn btn-default" name="clear_speed_cache" value="clear_speed_cache"><i class="fa fa-recycle"></i>&ensp;Clear opencart cache</a>
	<a href="?route=module/nicospeedcache/clear_javascript_cache&token=<?php echo $_GET['token'];?>" class="btn btn-default" name="clear_speed_cache" value="clear_speed_cache"><i class="fa fa-recycle"></i>&ensp;Clear javascript cache</a>
	<a href="?route=module/nicospeedcache/clear_css_cache&token=<?php echo $_GET['token'];?>" class="btn btn-default" name="clear_speed_cache" value="clear_speed_cache"><i class="fa fa-recycle"></i>&ensp;Clear css cache</a>
	<br/>
	<br/>
	<div class="alert alert-info" role="alert">
		<span class="fa-stack fa-lg" class="text-info"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-info fa-stack-1x fa-inverse"></i></span> 
		Cache is automatically cleared after adding a product/category or editing a module if speed cache ocmod/vqmod is installed.
	</div>

	<hr/>
	<a class="btn btn-danger" href="?route=module/nicospeedcache/uninstall_speed_cache&token=<?php echo $_GET['token'];?>"><i class="fa fa-trash"></i>&ensp; Uninstall speed cache</a><span></span>
	<?php
}
?>
<style>
#form-html > .form-group {display:none}
</style>
