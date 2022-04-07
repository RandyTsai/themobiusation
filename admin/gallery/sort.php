<?php 
include_once('top.php');

$query = genListQuery($config['gallery'], $GalleryCategory);
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
        		<?php include_once('../lang.php'); ?>
				<?php include_once('buttons.php'); ?>
            </div>
            <div class="tips">
            	<?=$Lang->_('Tips').' : '.$Lang->_('Drag items to sort')?>
            </div>
            <ul class="<?=$config['gallery']['list_style']=='thumb-list'?'thumb-list':'title-list'?> sort-list">
            	<?=$Gallery->listArticles(array(
												'where' => $query['where'],
												'order' => 'ord ASC',
												'field' => array('title'),
												'header' => array(),
												'detail_page' => NULL,
												'albums' => ($config['gallery']['use_album'] && $config['gallery']['list_style']=='thumb-list') ? $GalleryAlbums : NULL,
												'num_per_page' => -1
											));?>
            </ul>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>