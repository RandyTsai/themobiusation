<aside id="aside">
	<?php if($config['account']['use_category'] && $adminInfo['category'] == 0){?>
    <div class="aside-set">
	<h3><?=$Lang->_('Group')?></h3>
	<?=$AdminGroup->output(0, array(
						'show_count' => true,
						'detail_page' => 'index.php',
						'show_all' => $Lang->_('Show all'),
						'show_uncategory' => $Lang->_('Administrator')
					))?>
    <?php if($config['account']['add_category'] || $config['account']['edit_category'] || $config['account']['delete_category']){?><a href="category.php" class="button"><?=$Lang->_('Group management')?></a><?php }?> 
    </div>               
	<?php }?>
</aside>