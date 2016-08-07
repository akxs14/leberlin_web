<?php 
$opencart_version = (int)str_replace('.','',VERSION);
if (isset($this->registry)) $registry = $this->registry;
$_config =  $registry->get('config');
if (!isset($theme_name))
{
	if (!($theme_name = $_config->get('config_template')))
	{
		$theme_name = $_config->get('config_theme');
	}
}
if (!isset($theme_directory))
{
	$theme_directory = $theme_name;
}
//$theme_directory = DIR_TEMPLATE . '/' . $theme_directory . '/';
//require_once(DIR_TEMPLATE . $theme_directory . '/nico_theme_editor/common.inc');


$seq_module_id = 'seq_' . $module_id;
?><!--cols:<?php if (isset($grid_cols) && $grid_cols) echo $grid_cols + $grid_offset;else echo 12;?>   -->
<div class="sequence-theme <?php if ($hide_on_mobile == 'true') {?>hide_on_mobile<?php }?> <?php if (isset($grid_cols) &&$grid_cols) {?>col-md-<?php echo $grid_cols;}?> <?php if (isset($grid_offset) && $grid_offset) {?>col-md-offset-<?php echo $grid_offset;}?> <?php if (isset($grid_padding) && $grid_padding) {?>no_padding<?php if (isset($grid_padding) && $grid_padding == 2) echo 'left';else if (isset($grid_padding) && $grid_padding == 3) echo 'right'; }?>">
    <div class="sequence" id="sequence-<?php echo $seq_module_id;?>">
	<ul class="controls">
		<li class="sequence-prev"></li>
		<li class="sequence-next"></li>
	</ul>

	<ul class="sequence-canvas">
		<?php $first = true;foreach ($section as $slide) {?>
		<li class="align-<?php echo $slide['text_align']; /*if ($first) {$first=false; echo ' animate-in';}*/?>" <?php /* if($slide['background']) {?>style="background-image:url('<?php echo $slide['background']; ?>')"<?php }*/?>>
		    <?php /* if($slide['background']) {?><img class="background" src="<?php echo $slide['background']; ?>" alt="<?php echo $slide['title']; ?>" /><?php } */?>
		    <div class="container">
				<div class="container-row">
					<?php if (isset($slide['image']) &&  $slide['text_align'] == 'left') {?>
					<div class="slide-img in-from-<?php echo $slide['image_slide'];?> slow delay1">
						<img class="img-responsive" src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>">
					</div>		   
					<?php }?>
					<div class="message-slide">
						<div>
						<?php if (isset($slide['title']) && !empty($slide['title'])) {?><h3 class="title in-from-left fast"><?php echo $slide['title']; ?></h3><div class="line"></div><?php }?>
						<?php if (isset($slide['subtitle']) && !empty($slide['subtitle'])) {?><h2 class="title in-from-right fast"><?php echo $slide['subtitle']; ?></h2><?php }?>
						<?php if (isset($slide['text']) && !empty($slide['text'])) {?><p class="in-from-bottom fast delay2"><?php echo html_entity_decode($slide['text']);?></p><?php }?>
						</div><br/>
						<?php if (isset($slide['button']) && !empty($slide['button'])) {?><a class="in-from-bottom fast delay2 button" href="<?php echo $slide['url']; ?>"><?php echo $slide['button'];?></a><?php }?>
					</div>
					<?php if (isset($slide['image']) &&  $slide['text_align'] == 'right') {?>
					<div class="slide-img in-from-<?php echo $slide['image_slide'];?> slow delay1">
						<img class="img-responsive" src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['title']; ?>">
					</div>		   
					<?php }?>
				</div> 
		    </div> 
		    <?php 
		    if (isset($slide['section_type'])) 
		    switch ($slide['section_type'])
		    {
				case 'image':
				if($slide['background']) {?>
					<div class="background" style="background-image:url('<?php echo $slide['background']; ?>')"></div><?php } 
				break;
				case 'youtube':
				if($slide['youtube_id']) {?>
					<iframe class="background youtube" src="//www.youtube.com/embed/<?php echo $slide['youtube_id'];?>?enablejsapi=1&amp;html5=1&amp;rel=0&amp;controls=0&amp;modestbranding=1&amp;showinfo=0&amp;theme=light"  allowfullscreen></iframe><?php }
				break;
				case 'vimeo':
				if($slide['vimeo_id']) {?>
					<iframe class="background vimeo"  src="http://player.vimeo.com/video/<?php echo $slide['vimeo_id'];?>?title=0&amp;byline=0&amp;portrait=0" allowfullscreen></iframe><?php } 
				break;
			}
			?>
		    
		    <?php /*if($slide['background']) {?><img class="background" src="<?php echo $slide['background']; ?>" /><?php } */?>
		</li>
		<?php } ?>
	</ul>

	<!-- ul class="sequence-pagination">
		<li><img src="images/tn-model1.png" alt="Model 1" /></li>
		<li><img src="images/tn-model2.png" alt="Model 2" /></li>
		<li><img src="images/tn-model3.png" alt="Model 3" /></li>
	</ul -->

</div>
</div>

<?php 
$autoplay = ($autoplay == 'true' || $autoplay == 1)?'true':'false';
$autoplay_interval = (int)$autoplay_interval;
$_sequence_js = "nico_sequence_slider('$seq_module_id', $autoplay, $autoplay_interval)";
nico_add_style('catalog/view/theme/' . $theme_directory . '/css/sequencejs.css');
nico_add_script('catalog/view/theme/' . $theme_directory . '/js/jquery.sequence.js');
if ($height_style == '1') $_sequence_js .= 'sequence_height();$(window).load(sequence_height);$(window).resize(sequence_height);';
nico_add_js($_sequence_js);

if ($height_style != '1') {
$height = round($background_image_height/2);
$height_half = round($height/2);
$_sequence_css = <<<CSS
@media(min-width:767px)
{
#sequence-$seq_module_id 
{
	    min-height:{$background_image_height}px;
}

}

@media(max-width:767px)
{
    #sequence-$seq_module_id
    {
		height:{$height}px;
    }

	#sequence-$seq_module_id.sequence .sequence-prev, #sequence-$seq_module_id.sequence .sequence-next
	{
		margin-top:{$height_half}px;
    }
}

body
{
	position:static;
}

#container > div:first-child, .grid_wrap {
	-webkit-perspective: none;
	perspective: none;
}

.row {
	position: static;
	-webkit-transition: none;
	transition: none;
	-webkit-transform-style: flat;
	transform-style: flat;
}

CSS;
nico_add_css($_sequence_css);
}
