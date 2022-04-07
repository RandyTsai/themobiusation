<?php
include_once('top.php');

$query = genListQuery($config['about'], $AboutCategory);

//Buttons
$button = array();

if($config['about']['view_article'])
	array_push($button, array('path'=>'view.php', 	'label'=>$Lang->_('View'), 'class'=>'view-button'));	   
?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
</head>

<body>
	<div id="container" >
    	<?php include_once('../header.php'); ?>        
		<?php include_once('../nav.php'); ?>
        <?php include_once('../toolbar.php'); ?>
        <?php include_once('aside.php'); ?>
        <div id="content">
        	<div id="banner">
				<?php include_once('buttons.php'); ?>
        		<?php include_once('../lang.php'); ?>
            </div>
            <ul class="<?=$config['about']['list_style']?>">
            	<?=$About->listArticles(array(
												'where' => $query['where'],
												'order' => $config['about']['list_order_by'],
												'field' => $config['about']['list_field'],
												'header' => $config['about']['list_header'],
												'detail_page' => ($config['about']['view_article']) ? 'view.php' : '',
												'albums' => ($config['about']['use_album']) ? $AboutAlbums : NULL,
												'button' => $button
											));?>
            </ul>
            
            <div class="pagination">
            	<?php 
					$pagination = $About->getPageNav();
					if($pagination){
						$pagination->show();
					}
				?>
            </div>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>