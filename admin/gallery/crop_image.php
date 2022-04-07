<?php include_once('top.php'); ?><?php 
$image = $GalleryAlbums->getArticle($_GET['id']);
$_GET['album'] = $image['album']; //for back button
?>
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
            
            <?php 
				$path = $image['path'];
				if($path != ''){
					
					$width = NULL;
					$height = NULL;
					$type = 'resize';
					$folder = 'original/';
					$rule_index = array();
					
					$folders = explode(',', $_GET['folder']);
					foreach($GalleryAlbums->getRules() as $idx => $rule){
						if($width == '' && $height == '' && in_array($rule['folder'], $folders)){//Get first rule dimension
							$width = $rule['width'];
							$height = $rule['height'];
							$type = $rule['type'];
							$folder = $rule['folder'];
						}
						if($_GET['folder'] == '*' || in_array($rule['folder'], $folders)){
							$rule_index[] = $idx;
						}
					}
				}
			?>
            
            <?php if($path != ''){?>
            <div id="crop-source" data-width="<?=$width?>" data-height="<?=$height?>" data-type="<?=$type?>">
            	<img src="<?=$GalleryAlbums->upload_path.($_GET['source']?$_GET['source']:'original/').$path?>" />
            </div>
            <div id="crop-result">
            	<img src="<?=$GalleryAlbums->upload_path.$folder.$path?>" class="current" />
                <span>[<?=$Lang->_('Current image')?>]</span>
            	<div id="crop-preview"></div>
                <span>[<?=$Lang->_('New image')?>]</span>
            </div>
            <form action="process.php?action=crop-image" method="post" id="crop-data">
            	<input type="hidden" name="source" value="<?=$_GET['source']?$_GET['source']:'original/'?>" />
            	<input type="hidden" name="path" value="<?=$path?>" />
                <?php foreach($rule_index as $idx){?>
            	<input type="hidden" name="rule_index[]" value="<?=$idx?>" />
            	<?php }?>
                <input type="hidden" name="x" value="" />
            	<input type="hidden" name="y" value="" />
            	<input type="hidden" name="w" value="" />
            	<input type="hidden" name="h" value="" />
                <input type="hidden" name="referer" value="<?=$_SERVER['HTTP_REFERER']?>" />
            </form>
            
            <div class="buttons">
            	<a href="#" class="button" id="crop-save-button"><?=$Lang->_('Save image')?></a>
            </div>
            <?php }?>
            
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>