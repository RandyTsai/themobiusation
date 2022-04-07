<div id="buttons">

	<?php if(CURRENT_PAGE == 'index.php'){?>
		<?php if($config['account']['add_article']){?><a href="edit.php?action=insert" class="button"><?=$Lang->_('Add')?></a><?php }?>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'view.php'){?>
    	<a href="index.php" class="button"><?=$Lang->_('Back to list')?></a>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'edit.php'){?>
    	<a href="index.php" class="button"><?=$Lang->_('Back to list')?></a>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'category.php'){?>
    	<a href="index.php" class="button"><?=$Lang->_('Back to list')?></a>
    	<?php if($config['account']['use_category'] && $config['account']['add_category']){?><a href="category_edit.php" class="button"><?=$Lang->_('Add group')?></a><?php }?>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'category_edit.php'){?>
    	<a href="category.php" class="button"><?=$Lang->_('Back to list')?></a>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'profile_edit.php'){?>
    	<a href="profile.php" class="button"><?=$Lang->_('Go back')?></a>
    <?php }?>
</div>