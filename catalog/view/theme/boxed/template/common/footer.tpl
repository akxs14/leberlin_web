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
require_once(DIR_TEMPLATE . $theme_directory . '/nico_theme_editor/common.inc');

if (strpos($_SERVER['REQUEST_URI'],'ajax=true') == false) {?>


<div class="content">
	<div>
	</div>
	<span class="loading sk-spinner sk-spinner-rotating-plane"></span>
	<span class="close-content"></span>
</div>

</div>

<div id="social_band">
	<div class="container">
	<div class="row">
	<?php 
		$social_col = 0;
		$about_text = nico_get_config('about_text');
		$about_text = isset($about_text[$_config->get('config_language')])?htmlspecialchars_decode($about_text[$_config->get('config_language')]):$about_text['en'];

		$about_heading = nico_get_config('about_heading');
		$about_heading = isset($about_heading[$_config->get('config_language')])?htmlspecialchars_decode($about_heading[$_config->get('config_language')]):$about_heading['en'];

		$fb_profile_id = nico_get_config('fb_profile_id');
		$twitter_profile_id = nico_get_config('twitter_profile_id');
		if (!empty($about_text)) $social_col++;
		if (!empty($fb_profile_id)) $social_col++;
		if (!empty($twitter_profile_id)) $social_col++;
		if ($social_col > 0) $scols = 12 / $social_col;
	?>		
	<?php if (!empty($about_text)) {?>
	<div id="social_about" class="col-md-<?php echo $scols;?>">
		<h3><?php  if (isset($about_heading) && !empty($about_heading)) echo $about_heading; else echo 'About';?></h3>
		<div>
			<?php  if (isset($about_text) && !empty($about_text)) echo str_replace("\n",'<br/>',$about_text); else echo 'You can change this text from the Control Panel Social band > About text<br/><br/>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';?>
		</div>
	</div>
	<?php }?>
	<?php 
	if (!empty($twitter_profile_id)) {
		$twitter_count = nico_get_config('twitter_count');
		if (empty($twitter_count)) $twitter_count = 2;
	?>
	<div id="social_twitter" class="col-md-<?php echo $scols;?>">
		<h3>Twitter</h3>
		<!-- 
		<div id="twitter_update_list">
			<ul><li>Twitter feed loading</li></ul>			
			<?php /*		
				nico_add_script('catalog/view/theme/' . $theme_directory . '/js/twitterFetcher.js', 'common');
				$_twitter_js = 'twitterFetcher.fetch({"id":' . $twitter_profile_id .',  "domId":"twitter_update_list", "maxTweets": ' . $twitter_count . ',  "enableLinks": true});';
				nico_add_js($_twitter_js, 'common');
				* */
			?>
		</div>
			-->
		
		<a class="twitter-timeline" data-dnt="true" data-chrome="nofooter noborders noscrollbar noheader transparent" href="https://twitter.com/twitterapi" data-widget-id="<?php echo $twitter_profile_id;?>"></a>
		<?php  nico_add_js('!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");');?>
		
	</div>
	<?php }?>
	<?php if (!empty($fb_profile_id)) {
	$fb_width = nico_get_config('fb_width');
	$fb_height = nico_get_config('fb_height');
	
	$fb_small_header = nico_get_config('fb_small_header');
	$fb_hide_cover = nico_get_config('fb_hide_cover');
	$fb_show_facepile = nico_get_config('fb_show_facepile');
	$fb_show_posts = nico_get_config('fb_show_posts');
	$fb_hide_cta = nico_get_config('fb_hide_cta');
	?>
	<div id="social_facebook" class="col-md-<?php echo $scols;?>">
		<h3>Facebook</h3>
		<div>
		<div class="fb-root-footer">
<?php		
$_facebook_js = <<<FJS
(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
  if (!d.getElementById(id))
  {
		  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4";
		  fjs.parentNode.insertBefore(js, fjs);
  }
  
  
  jQuery(".fb-root-footer iframe").ready(function() 
  {
	  var fb_footer_interval = setInterval(function ()
	  {
	    width = jQuery(".fb-root-footer iframe").width();
	    if (width > 0)
	    {
			jQuery(".fb-root-footer").width(width - 2);
			clearInterval(fb_footer_interval);
		}
	  }, 1000);
  });
}(document, 'script', 'facebook-jssdk'))
FJS;
nico_add_js($_facebook_js, 'common');?>
			<div class="fb-page" data-href="https://www.facebook.com/<?php if (isset($fb_profile_id) && !empty($fb_profile_id)) echo $fb_profile_id; else echo '201498429982413';?>" data-width="<?php if (isset($fb_width) && !empty($fb_width)) echo $fb_width; else echo '300';?>" data-height="<?php if (isset($fb_height) && !empty($fb_height)) echo $fb_height; else echo '250';?>" data-show-facepile="<?php echo $fb_show_facepile;?>" data-small-header="<?php echo $fb_small_header;?>" data-hide-cover="<?php echo $fb_hide_cover;?>" data-hide-cta="<?php echo $fb_hide_cta;?>" data-show-posts="<?php echo $fb_show_posts;?>" data-adapt-container-width="false"></div>
		</div>		
		</div>		
	</div>
	<?php }?>
</div>
</div>
</div>



<?php 
$footer_top = nico_get_modules('footer_top');
if($footer_top) foreach ($footer_top as $module) echo $module;
$show_information_column = nico_get_config('show_information_column');
$show_extra_column  = nico_get_config('show_extra_column');
$show_extra_voucher = nico_get_config('show_extra_voucher');
$show_extra_affiliate = nico_get_config('show_extra_affiliate');
$show_service_column = nico_get_config('show_service_column');
$show_account_column = nico_get_config('show_account_column');
$show_powered = nico_get_config('show_powered');
?>


<div class="footer">
	<div class="container">
		<!-- div class="arrow"><b class="caret"></b></div -->
		<div class="row">
			
		 <?php 

		$footer_about_text = nico_get_config('footer_about_text');
		$footer_about_text = isset($footer_about_text[$_config->get('config_language')])?htmlspecialchars_decode($footer_about_text[$_config->get('config_language')]):$footer_about_text['en'];

		$footer_about_heading = nico_get_config('footer_about_heading');
		$footer_about_heading = isset($footer_about_heading[$_config->get('config_language')])?htmlspecialchars_decode($footer_about_heading[$_config->get('config_language')]):$footer_about_heading['en'];


		if ($footer_about_text) { ?>
		  <div class="col-md-2 col-sm-3">
			<div>
			<?php  if (isset($footer_about_heading) && !empty($footer_about_heading)) {?><h3><?php echo $footer_about_heading;?></h3><?php }?>
			<div>
			<?php echo $footer_about_text;?>
			</div>
			</div>
		  </div>
		  <?php } ?>
		 <?php if ($informations && $show_information_column != 1) { ?>
		  <div class="col-md-2 col-sm-3">
			<div>
			<h3><?php echo $text_information; ?></h3>
			<ul>
			  <?php foreach ($informations as $information) { ?>
			  <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
			  <?php } ?>
			</ul>
			</div>
		  </div>
		  <?php } ?>
		  
		  <?php if ($show_extra_column != 1) {?>
		  <div class="col-md-2 col-sm-3">
			<div>
			<h3><?php echo $text_extra; ?></h3>
			<ul>
			  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
			  <?php if ($show_extra_voucher != 1) {?><li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li><?php } ?>
			  <?php if ($show_extra_affiliate != 1) {?><li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li><?php } ?>
			  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
			</ul>
			</div>
		  </div>
		  <?php } ?>
		  
		  <?php if ($show_service_column != 1) {?>
		  <div class="col-md-2 col-sm-3">
			<div>
			<h3><?php echo $text_service; ?></h3>
			<ul>
			  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
			  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
			  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
			</ul>
			</div>
		  </div>
		 <?php } ?>

		  <?php if ($show_account_column != 1) {?>
		  <div class="col-md-2 col-sm-3">
			<div>
			<h3><?php echo $text_account; ?></h3>
			<ul>
			  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
			  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
			  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
			  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
			</ul>
			</div>
		  </div>
		  <?php } ?>

		  <div class="col-md-2 social">
				<?php if ($show_powered != 1) {?><div class="copy"><?php echo $powered; ?></div><?php } ?>
				<ul class="social-network">
					<?php $wordpress_url = nico_get_config('wordpress_url');if (isset($wordpress_url) && !empty($wordpress_url))  { ?>
					<li><a href="<?php echo $wordpress_url;?>"><i class="fa fa-wordpress"></i></a></li>
					<?php } ?>
					<?php $fb_profile_id = nico_get_config('fb_profile_id');if (isset($fb_profile_id) && !empty($fb_profile_id))  { ?>
					<li><a href="http://www.facebook.com/<?php echo $fb_profile_id;?>"><i class="fa fa-facebook"></i></a></li>
					<?php } ?>
					<?php $pinterest_url = nico_get_config('pinterest_url');if (isset($pinterest_url) && !empty($pinterest_url))  { ?>
					<li><a href="<?php echo $pinterest_url;?>"><i class="fa fa-pinterest"></i></a></li>
					<?php } ?>
					<?php $instagram_url = nico_get_config('instagram_url');if (isset($instagram_url) && !empty($instagram_url))  { ?>
					<li><a href="<?php echo $instagram_url;?>"><i class="fa fa-instagram"></i></a></li>
					<?php } ?>
					<?php $github_url = nico_get_config('github_url');if (isset($github_url) && !empty($github_url))  { ?>
					<li><a href="<?php echo $github_url;?>"><i class="fa fa-github"></i></a></li>
					<?php } ?>
					<?php $twitter_url = nico_get_config('twitter_url');if (isset($twitter_url) && !empty($twitter_url))  { ?>
					<li><a href="<?php echo $twitter_url;?>"><i class="fa fa-twitter"></i></a></li>
					<?php } ?>
					<?php $rss_url = nico_get_config('rss_url');if (isset($rss_url) && !empty($rss_url))  { ?>
					<li><a href="<?php echo $rss_url;?>"><i class="fa fa-rss"></i></a></li>
					<?php } ?>
					<?php $linkedin_url = nico_get_config('linkedin_url');if (isset($linkedin_url) && !empty($linkedin_url))  { ?>
					<li><a href="<?php echo $linkedin_url;?>"><i class="fa fa-linkedin"></i></a></li>
					<?php } ?>
					<?php $google_url = nico_get_config('google_url');if (isset($google_url) && !empty($google_url))  { ?>
					<li><a href="<?php echo $google_url;?>"><i class="fa fa-google-plus"></i></a></li>
					<?php } ?>
					<?php $tumblr_url = nico_get_config('tumblr_url');if (isset($tumblr_url) && !empty($tumblr_url))  { ?>
					<li><a href="<?php echo $tumblr_url;?>"><i class="fa fa-tumblr"></i></a></li>
					<?php } ?>
				</ul>
			</div>

   </div>	
</div>

</div>	

 <ul class="sicons">
		<?php $wordpress_url = nico_get_config('wordpress_url');if (isset($wordpress_url) && !empty($wordpress_url))  { ?>
		<li><a href="<?php echo $wordpress_url;?>"><i class="fa fa-wordpress"></i></a></li>
		<?php } ?>
		<?php $twitter_url = nico_get_config('twitter_url');if (isset($twitter_url) && !empty($twitter_url))  { ?>
		<li><a href="<?php echo $twitter_url;?>"><span class="icon fa fa-twitter"></span></a></li>
		<?php } ?>
		<?php $fb_profile_id = nico_get_config('fb_profile_id');if (isset($fb_profile_id) && !empty($fb_profile_id))  { ?>
		<li><a href="http://www.facebook.com/<?php echo $fb_profile_id;?>"><span class="fa fa-facebook"></span></a></li>
		<?php } ?>
		<?php $pinterest_url = nico_get_config('pinterest_url');if (isset($pinterest_url) && !empty($pinterest_url))  { ?>
		<li><a href="<?php echo $pinterest_url;?>"><span class="fa fa-pinterest"></span></a></li>
		<?php } ?>
		<?php $instagram_url = nico_get_config('instagram_url');if (isset($instagram_url) && !empty($instagram_url))  { ?>
		<li><a href="<?php echo $instagram_url;?>"><span class="fa fa-instagram"></span></a></li>
		<?php } ?>
		<?php $github_url = nico_get_config('github_url');if (isset($github_url) && !empty($github_url))  { ?>
		<li><a href="<?php echo $github_url;?>"><span class="fa fa-github"></span></a></li>
		<?php } ?>
		<?php $rss_url = nico_get_config('rss_url');if (isset($rss_url) && !empty($rss_url))  { ?>
		<li><a href="<?php echo $rss_url;?>"><span class="fa fa-rss"></span></a></li>
		<?php } ?>
		<?php $linkedin_url = nico_get_config('linkedin_url');if (isset($linkedin_url) && !empty($linkedin_url))  { ?>
		<li><a href="<?php echo $linkedin_url;?>"><span class="fa fa-linkedin"></span></a></li>
		<?php } ?>
		<?php $google_url = nico_get_config('google_url');if (isset($google_url) && !empty($google_url))  { ?>
		<li><a href="<?php echo $google_url;?>"><span class="fa fa-google-plus"></span></a></li>
		<?php } ?>
		<?php $tumblr_url = nico_get_config('tumblr_url');if (isset($tumblr_url) && !empty($tumblr_url))  { ?>
		<li><a href="<?php echo $tumblr_url;?>"><i class="fa fa-tumblr"></i></a></li>
		<?php } ?>    
</ul>

<?php 
	$footer_bottom = nico_get_modules('footer_bottom');if($footer_bottom) foreach ($footer_bottom as $module) echo $module;
	include(DIR_TEMPLATE . $theme_directory. '/nico_theme_editor/editor.inc');
	global $opencart_version;
	if (!isset($opencart_version) && !$opencart) $opencart_version = (int)str_replace('.','',VERSION);
?>

<script>
	<?php $disable_ajax = nico_get_config('disable_ajax');if (!$disable_ajax)  {?>
	if (jQuery( '.grid_wrap' ).length)
	{
		var _grid3D = new grid3D( document.getElementById( 'page-container' ) );
	}
	<?php }?>
	var animation_delay = <?php $animation_delay = nico_get_config('animation_delay');if ($animation_delay) echo $animation_delay; else echo '150';?>;	
	var duration = <?php $duration = nico_get_config('duration');if ($duration) echo $duration; else echo '3000';?>;	
	var rand = <?php  $effect_rand = nico_get_config('effect_rand');if ($effect_rand && $effect_rand == 'true') echo 'true';else echo 'false'?>;
	var effect = "<?php  $effect = nico_get_config('effect_name');if ($effect) echo $effect;else echo 'fadeIn'?>";
	var opencart_version = <?php echo $opencart_version;?>
</script>
<div id="scroll_top_btn"><a class="fa fa-angle-up" href="#"></a></div>
</body>
</html><?php }
