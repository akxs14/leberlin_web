<?php
global $opencart_version;
?>
<div id="header">
  <div class="">
	<div class="">
		<div id="logo">
		  <?php if ($logo) { ?>
		  <a href="<?php echo $home; ?>" id="image-logo">
			<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"/>
		  </a>
		  <?php } ?>
		  <h1 id="text-logo"><a href="<?php echo $home; ?>"><?php echo str_replace(' ','&nbsp;&nbsp;',$name);if (strlen($name) % 2 == 1) {?>&ensp;<?php }?></a></h1>
		  <span id="text_under_logo"><?php $text_under_logo = nico_get_config('text_under_logo');echo $text_under_logo[$_config->get('config_language')];?></span>
		</div>
	

	<!--	  
	  </div>
	  <div class="col-sm-3"> -->
	  </div>
	  
	 	<?php 
	 	$outside = '';
	 	$menu = nico_get_modules('menu');if($menu) foreach ($menu as $module) 
	 	{
			$outside_start = strpos($module, '<!-- outside -->');
			$outside_end = strpos($module, '<!-- end outside -->');
			if ($outside_start !== false) 
			{
				$outside .= substr($module, $outside_start, $outside_end - $outside_start);
				echo substr_replace($module, '', $outside_start, $outside_end - $outside_start);
			} else
			echo $module;
		}?>


		<!-- div class="social-icons">
			<i class="fa fa-facebook"></i>
			<i class="fa fa-twitter"></i>
			<i class="fa fa-search"></i>
		</div -->

	  
	</div>
</div>
