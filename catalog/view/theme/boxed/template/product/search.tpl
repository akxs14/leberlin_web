<?php /*$_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest'*/ if (!isset($_GET['ajax']) && !isset($_POST['ajax']) && !isset($_SERVER['HTTP_X_REQUESTED_WITH'])) {
$nico_include_path = __DIR__. '/../../';
//vqmod changes paths and the above path fails, check other paths
if (!file_exists($nico_include_path . 'nico_theme_editor/common.inc')) 
{
	$_config =  $this->registry->get('config');
	$nico_include_path = DIR_TEMPLATE . '/' . $_config->get('config_template') . '/';
	
	if (!file_exists($nico_include_path . '/nico_theme_editor/common.inc')) $nico_include_path = dirname(__FILE__) . '/../../';
}

//if (file_exists($nico_include_path . 'nico_theme_editor/common.inc')) require_once($nico_include_path . 'nico_theme_editor/common.inc');
//require($nico_include_path . 'nico_theme_editor/nico_config.inc');

//global $_config;
echo $header; 
?>
<div id="container" class="<?php /*echo $class;*/ ?> container-fluid vertical effect effect_fadeIn"><?php echo $content_top; ?>
	        
		<div class="row">
		    <div class="col-md-12">
			    <div class="breadcrumbs">
					
						<ul class="breadcrumb">
						<?php foreach ($breadcrumbs as $breadcrumb) { ?>
						<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
						<?php } ?>
						</ul>
				</div>
			</div>
		</div>
		
		<div class="row">
		    <div class="col-md-12">
			    <div class="cat_header">
				    <h2><?php echo $heading_title; ?></h2>
			    </div>

		
		
		<?php echo $column_left; ?> 
		<div class="well">
			  <b><?php if (isset($text_critea)) echo $text_critea; ?></b>
			  <div class="search_content">
				<p><?php echo $entry_search; ?></p>

				  <div class="form-group">
				  <?php if (isset($search) && $search) { ?>
				  <input id="search-input" type="text" name="search" placeholder="<?php if (isset($text_keyword)) echo $text_keyword; ?>" value="<?php if (isset($search)) echo $search; ?>" class="form-control"/>
				  <?php } else if (isset($search)) { ?>
				  <input id="search-input" type="text" name="search" placeholder="<?php if (isset($text_keyword)) echo $text_keyword; ?>" value="<?php if (isset($search)) echo $search; ?>"  class="form-control"/>
				  <?php } else { ?>
					  <?php if (isset($filter_name)) { ?>
					  <input id="search-input" type="text" name="filter_name" placeholder="<?php echo $filter_name; ?>" class="form-control"/>
					  <?php } else { ?>
					  <input id="search-input" type="text" name="filter_name" placeholder="" class="form-control"/>
					  <?php } ?>
				  <?php } ?>
				  </div>
				  <?php if (isset($search))	{?>
				  <select name="category_id">
					<option value="0"><?php echo $text_category; ?></option>
					<?php foreach ($categories as $category_1) { ?>
					<?php if ($category_1['category_id'] == $category_id) { ?>
					<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_1['children'] as $category_2) { ?>
					<?php if ($category_2['category_id'] == $category_id) { ?>
					<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&ensp;<?php echo $category_2['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_2['category_id']; ?>">&ensp;<?php echo $category_2['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_2['children'] as $category_3) { ?>
					<?php if ($category_3['category_id'] == $category_id) { ?>
					<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&ensp;>&ensp;<?php echo $category_3['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_3['category_id']; ?>">&ensp;>&ensp;<?php echo $category_3['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				 <?php } else { ?>
				  <select name="filter_category_id">
					<option value="0"><?php echo $text_category; ?></option>
					<?php foreach ($categories as $category_1) { ?>
					<?php if ($category_1['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_1['children'] as $category_2) { ?>
					<?php if ($category_2['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_2['category_id']; ?>" selected="selected">&ensp;<?php echo $category_2['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_2['category_id']; ?>">&ensp;<?php echo $category_2['name']; ?></option>
					<?php } ?>
					<?php foreach ($category_2['children'] as $category_3) { ?>
					<?php if ($category_3['category_id'] == $filter_category_id) { ?>
					<option value="<?php echo $category_3['category_id']; ?>" selected="selected">&ensp;&ensp;<?php echo $category_3['name']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $category_3['category_id']; ?>">&ensp;&ensp;<?php echo $category_3['name']; ?></option>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<?php } ?>
				  </select>
				  <?php } ?>
				  <?php if (isset($sub_category) && $sub_category) { ?>
				  <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
				  <?php } else if (isset($sub_category)) { ?>
				  <input type="checkbox" name="sub_category" value="1" id="sub_category" />
				  <?php } else {?>
					  <?php if (isset($filter_sub_category)) { ?>
					  <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
					  <?php } else { ?>
					  <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
					  <?php } ?>
				  <?php } ?>	
				  <label for="sub_category"><?php echo $text_sub_category; ?></label>

				<?php if (isset($description) && $description) { ?>
				<input type="checkbox" name="description" value="1" id="description" checked="checked" />
				<?php } else if (isset($description)) { ?>
				<input type="checkbox" name="description" value="1" id="description" />
				<?php } else { ?>
					<?php if (isset($filter_description)) { ?>
					<input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
					<?php } else { ?>
					<input type="checkbox" name="filter_description" value="1" id="description" />
					<?php } ?>
				<?php } ?>
				<label for="description"><?php echo $entry_description; ?></label>
			  </div>
			  <div class="buttons">
				<div class="right"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button btn btn-primary" /></div>
			  </div>
		 </div>
			
		<?php if (isset($products) && $products) { 
		  include($nico_include_path . 'template/module/nico_product.tpl');
		?>		
	
	  <div class="col-md-12">
	  <h2 class="margin-bottom"><?php echo $text_search; ?></h2>
	  </div>
	  
	 </div>
	 </div>
	  
  		<div class="grid_wrap">
		<div class="row products">

			<?php foreach ($products as $product) { ?>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 prod">
				<?php nico_product($product);?>
			</div>
			<?php }?>
			<?php } else { ?>
			<div class="well"><?php echo $text_empty; ?></div>
			<?php }	?>	
		</div>
		
		<div class="col-md-12">
			<div class="row">
			<?php if (isset($pagination)) echo $pagination; ?>
			</div>
		</div>

</div>

<script type="text/javascript"><!--

$('#search-input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});


$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');
$('#button-search').on('click', function() {
	url = 'index.php?route=product/search';
	
	if ($('#search-input').length)
    {
		var search = $('#search-input').prop('value');
	
		if (search) {
			url += '&search=' + encodeURIComponent(search);
		}

		var category_id = $('.container select[name=\'category_id\']').prop('value');
	
		if (category_id > 0) {
			url += '&category_id=' + encodeURIComponent(category_id);
		}
	
		var sub_category = $('.container input[name=\'sub_category\']:checked').prop('value');
	
		if (sub_category) {
			url += '&sub_category=true';
		}
		
		var filter_description = $('.container input[name=\'description\']:checked').prop('value');
	
		if (filter_description) {
			url += '&description=true';
		}
    } else 
	{
 
		var filter_name = $('#search-input').prop('value');
	
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}

		var filter_category_id = $('.container select[name=\'filter_category_id\']').prop('value');
	
		if (filter_category_id > 0) {
			url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
		}
	
		var filter_sub_category = $('.container input[name=\'filter_sub_category\']:checked').prop('value');
	
		if (filter_sub_category) {
			url += '&filter_sub_category=true';
		}
		
		var filter_description = $('.container input[name=\'filter_description\']:checked').prop('value');
	
		if (filter_description) {
			url += '&filter_description=true';
		} 
    }
	window.location = url;
});
--></script>
</div>
<?php echo $footer; ?>
<?php } else { echo json_encode($products); }?>
