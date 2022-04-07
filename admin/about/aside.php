<aside id="aside">
	<?php if($config['about']['use_category']){?>
    <div class="aside-set">
	<h3><?=$Lang->_('Page')?></h3>
	<?=$AboutCategory->output(0, array(
									'show_count' => true,
									'detail_page' => 'index.php',
									'show_all' => $config['about']['show_all'] ? $Lang->_('Show all') : false,
									'show_uncategory' => $config['about']['show_uncategory'] ? $Lang->_('Uncategory') : false,
									'fill_empty' => false
									))?>
    	<?php if($config['about']['add_category'] || $config['about']['edit_category'] || $config['about']['delete_category']){?>
        <a href="category.php" class="button"><?=$Lang->_('Page management')?></a>
		<?php }?>
    </div>
	<?php }?>

</aside>