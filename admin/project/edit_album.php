<?php include_once('top.php'); ?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
</head>

<body>
	<div id="container">
    	<?php include_once('../header.php'); ?>        
		<?php include_once('../nav.php'); ?>
        <?php include_once('../toolbar.php'); ?>
        <?php include_once('aside.php'); ?>
        <div id="content">
        	<div id="banner">
        		<?php include_once('buttons.php'); ?>
        		<?php include_once('../lang.php'); ?>
            </div>
            
            <?php if($config['project']['use_album'] && $ProjectAlbums->getItemNum($_GET['album']) > 0){?>
            <form action="process.php?action=edit-album-item&album=<?=$_GET['album']?>" method="post">
            
            	<ul class="edit-album-list <?=$ProjectAlbums->type=='image'?'edit-image-list':'edit-file-list'?>">
            		<?=$ProjectAlbums->listItemForm($_GET['album']);?>
            	</ul>
                
                <div class="buttons">
            		<input type="submit" value="<?=$Lang->_('Save')?>" class="button"/>
                </div>
            </form>
            <?php }?>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>