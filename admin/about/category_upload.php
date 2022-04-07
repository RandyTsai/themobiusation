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
            
            <?php if($config['about']['use_category_album']){ ?>
            <div class="upload-set">
            	
                <div class="title"><?=$Lang->_('Cover image')?></div>
                
            	<div class="uploader limit-one" data-album="<?='category-'.$_GET['id']?>">
    				<a id="browse-button" href="javascript:;"><?=$Lang->_('Click or drop files here to upload')?></a>
				</div>
            
            	<ul class="upload-list sort-list image-list limit-one" data-action="sort-album-item">
            		<?=$AboutAlbums->listItem('category-'.$_GET['id']);?>
            	</ul>
                
            </div>
            <?php }?>
            
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>