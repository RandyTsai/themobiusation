<?php 
include_once('top.php');

$query = genListQuery($config['about'], $AboutCategory);
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
            <ul class="<?=$config['about']['list_style']=='thumb-list'?'thumb-list':'title-list'?> sort-list">
            	<?=$About->listArticles(array(
												'where' => $query['where'],
												'order' => 'ord ASC',
												'field' => array('title'),
												'header' => array(),
												'detail_page' => NULL,
												'albums' => ($config['about']['use_album'] && $config['about']['list_style']=='thumb-list') ? $AboutAlbums : NULL,
												'num_per_page' => -1
											));?>
            </ul>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>