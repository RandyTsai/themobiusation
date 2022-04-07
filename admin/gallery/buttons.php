<div id="buttons">
    
    <?php if(CURRENT_PAGE == 'index.php'){?>
        <?php if($config['gallery']['sort_article'] && ( !$config['gallery']['use_category'] || ($config['gallery']['use_category'] && isset($_GET['category']) && $_GET['category'] != '' ) )){ ?>
        <a href="sort.php?category=<?=$_GET['category']?>" class="button"><?=$Lang->_('Sort')?></a>
        <?php }?>
    	<?php if($config['gallery']['add_article']){?><a href="edit.php" class="button"><?=$Lang->_('Add')?></a><?php }?>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'view.php'){?>
    	<a href="index.php" class="button"><?=$Lang->_('Back to list')?></a>
    <?php }?>    
    
    <?php if(CURRENT_PAGE == 'edit.php'){?>
    	<a href="index.php" class="button"><?=$Lang->_('Back to list')?></a>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'sort.php'){?>
    	<a href="index.php?category=<?=$_GET['category']?>" class="button"><?=$Lang->_('Back to list')?></a>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'category.php'){?>
    	<a href="index.php" class="button"><?=$Lang->_('Back to list')?></a>
    	<?php if($config['gallery']['use_category'] && $config['gallery']['add_category']){?><a href="category_edit.php" class="button"><?=$Lang->_('Add category')?></a><?php }?>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'category_edit.php'){?>
    	<a href="category.php" class="button"><?=$Lang->_('Go back')?></a>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'upload.php'){?>
    	<a href="view.php?id=<?=$_GET['id']?>" class="button"><?=$Lang->_('Go back')?></a>
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'edit_album.php'){?>
         <a href="index.php" class="button"><?=$Lang->_('Go back')?></a> 
    <?php }?>
    
    <?php if(CURRENT_PAGE == 'crop_image.php'){?>
         <a href="index.php" class="button"><?=$Lang->_('Go back')?></a> 
    <?php }?>
</div>