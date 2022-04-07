<div id="buttons">
    <?php if(CURRENT_PAGE == 'edit.php'){?>
    	<a href="index.php?page=<?=$_GET['page']?>" class="button"><?=$Lang->_('Go back')?></a>
    <?php }?>    
    <?php if(CURRENT_PAGE == 'index.php' && $_GET['page']==2){?>
    	<a href="#" class="button" id="mailing-test-button"><?=$Lang->_('Mailing test')?></a>
    <?php }?>    
</div>