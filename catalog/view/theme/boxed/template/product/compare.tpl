<?php 
global $_config, $opencart_version;
$opencart_version = (int)str_replace('.','',VERSION);

$nico_include_path = __DIR__. '/../../';
//vqmod changes paths and the above path fails, check other paths
if (!file_exists($nico_include_path . 'nico_theme_editor/common.inc')) 
{
	$_config =  $this->registry->get('config');
	$nico_include_path = DIR_TEMPLATE . '/' . $_config->get('config_template') . '/';
	
	if (!file_exists($nico_include_path . '/nico_theme_editor/common.inc')) $nico_include_path = dirname(__FILE__) . '/../../';
}

if (file_exists($nico_include_path . 'nico_theme_editor/common.inc')) require_once($nico_include_path . 'nico_theme_editor/common.inc');
echo $header; 
?>
<div class="container">
	        
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

			</div>
		</div>
		
		
	<div class="row">
	<?php if (!empty($column_left)) { 
		$cols = 9;
		?> 
		<?php echo $column_left; ?> 
		<div class="col-md-9">
	<?php } else {
		$cols = 12;?>
		<div class="col-md-12">
	<?php } ?>
		<div class="row">
			<div class="col-md-12">
			<div class="registerbox">
			<?php if ($products) { ?>
			  <table class="compare-info">
				<thead>
				  <tr>
					<td class="compare-product" colspan="<?php echo count($products) + 1; ?>"><?php echo $text_product; ?></td>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td><?php echo $text_name; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td class="name"><a href="<?php echo $prod['href']; ?>"><?php echo $prod['name']; ?></a></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_image; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td><?php if ($prod['thumb']) { ?>
					  <img src="<?php echo $prod['thumb']; ?>" alt="<?php echo $prod['name']; ?>" />
					  <?php } ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_price; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td><?php if ($prod['price']) { ?>
					  <?php if (!$prod['special']) { ?>
					  <?php echo $prod['price']; ?>
					  <?php } else { ?>
					  <span class="price-old"><?php echo $prod['price']; ?></span> <span class="price-new"><?php echo $prod['special']; ?></span>
					  <?php } ?>
					  <?php } ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_model; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td><?php echo $prod['model']; ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_manufacturer; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td><?php echo $prod['manufacturer']; ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_availability; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td><?php echo $prod['availability']; ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_rating; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td>
					  <?php for ($i = 1; $i <= 5; $i++) { ?>
					  <?php if ($prod['rating'] < $i) { ?>
					  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
					  <?php } else { ?>
					  <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
					  <?php } ?>
					  <?php } ?><br />
					  <?php echo $prod['reviews']; ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_summary; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td class="description"><?php echo $prod['description']; ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_weight; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td><?php echo $prod['weight']; ?></td>
					<?php } ?>
				  </tr>
				  <tr>
					<td><?php echo $text_dimension; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<td><?php echo $prod['length']; ?> x <?php echo $prod['width']; ?> x <?php echo $prod['height']; ?></td>
					<?php } ?>
				  </tr>
				</tbody>
				<?php foreach ($attribute_groups as $attribute_group) { ?>
				<thead>
				  <tr>
					<td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></td>
				  </tr>
				</thead>
				<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
				<tbody>
				  <tr>
					<td><?php echo $attribute['name']; ?></td>
					<?php foreach ($products as $product) { if ($opencart_version < 2100) $prod = $products[$product['product_id']]; else $prod = $product;?>
					<?php if (isset($prod['attribute'][$key])) { ?>
					<td><?php echo $prod['attribute'][$key]; ?></td>
					<?php } else { ?>
					<td></td>
					<?php } ?>
					<?php } ?>
				  </tr>
				</tbody>
				<?php } ?>
				<?php } ?>
				<tr>
				  <td></td>
				  <?php foreach ($products as $product) { ?>
				  <td><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></td>
				  <?php } ?>
				</tr>
				<tr>
				  <td></td>
				  <?php foreach ($products as $product) { ?>
				  <td class="remove"><a href="<?php echo $product['remove']; ?>" class="button btn btn-primary"><?php echo $button_remove; ?></a></td>
				  <?php } ?>
				</tr>
			  </table>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php } else { ?>
			  <div class="content"><?php echo $text_empty; ?></div>
			  <div class="buttons">
				<div class="right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
			  </div>
			  <?php } ?>
			</div>
			</div>
		</div>	
	</div>	
	</div>	
</div>
<?php echo $footer; ?>
