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
            <div class="view">
				<?php echo $Gallery->view($_GET['id']); ?>
            </div>
            
            <div class="buttons">
            	<?php if($config['gallery']['edit_article']){?>
   				<a href="edit.php?id=<?=$_GET['id']?>" class="button"><?=$Lang->_('Edit')?></a>
            	<?php }?>
            	<?php if($config['gallery']['delete_article']){?>
            	<a href="process.php?action=delete&id=<?=$_GET['id']?>" class="button delete-button"><?=$Lang->_('Delete')?></a>
            	<?php }?>
            </div>
            
            <?php if($config['gallery']['use_album']){ ?>
            <div class="upload-set">
            
            	<div class="uploader <?=$GalleryAlbums->limit_one?'limit-one':''?>" data-album="<?=$_GET['id']?>">
    				<a id="browse-button" href="javascript:;"><?=$Lang->_('Click or drop files here to upload')?></a>
				</div>
            
            	<ul class="upload-list sort-list <?=$GalleryAlbums->type=='image'?'image-list':'file-list'?> <?=$GalleryAlbums->limit_one?'limit-one':''?>" data-action="sort-album-item">
            		<?=$GalleryAlbums->listItem($_GET['id']);?>
            	</ul>
                
                <div class="buttons"> 
                
                	<?php if($config['gallery']['add_video']){?>
                	<a href="#" class="button add-video-button"><?=$Lang->_('Add video')?></a>
                	<?php }?>
                                      
                	<?php if($config['gallery']['edit_album']){?>
                	<a href="edit_album.php?album=<?=$_GET['id']?>" class="button"><?=$GalleryAlbums->type=='image'?$Lang->_('Image description'):$Lang->_('File description')?></a>
                	<?php }?>
                    
                </div>
            </div>
            <?php }?>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>