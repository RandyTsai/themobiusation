<aside id="aside">
	<?php if($config['gallery']['use_category']){?>
    <div class="aside-set">
	<h3><?=$Lang->_('Category')?></h3>
	<?=$GalleryCategory->output(0, array(
									'show_count' => true,
									'detail_page' => 'index.php',
									'show_all' => $config['gallery']['show_all'] ? $Lang->_('Show all') : false,
									'show_uncategory' => $config['gallery']['show_uncategory'] ? $Lang->_('Uncategory') : false
									))?>
    	<?php if($config['gallery']['add_category'] || $config['gallery']['edit_category'] || $config['gallery']['delete_category']){?>
        <a href="category.php" class="button"><?=$Lang->_('Category management')?></a>
		<?php }?>
    </div>
	<?php }?>
</aside>