<aside id="aside">
	<?php if($config['project']['use_category']){?>
    <div class="aside-set">
	<h3><?=$Lang->_('Category')?></h3>
	<?=$ProjectCategory->output(0, array(
									'show_count' => true,
									'detail_page' => 'index.php',
									'show_all' => $config['project']['show_all'] ? $Lang->_('Show all') : false,
									'show_uncategory' => $config['project']['show_uncategory'] ? $Lang->_('Uncategory') : false,
									'fill_empty' => false
									))?>
    	<?php if($config['project']['add_category'] || $config['project']['edit_category'] || $config['project']['delete_category']){?>
        <a href="category.php" class="button"><?=$Lang->_('Category management')?></a>
		<?php }?>
    </div>
	<?php }?>

</aside>