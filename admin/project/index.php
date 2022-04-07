<?php
include_once('top.php');

$query = genListQuery($config['project'], $ProjectCategory);

//Buttons
$button = array();

if($config['project']['view_article'])
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
            <ul class="<?=$config['project']['list_style']?>">
            	<?=$Project->listArticles(array(
												'where' => $query['where'],
												'order' => $config['project']['list_order_by'],
												'field' => $config['project']['list_field'],
												'header' => $config['project']['list_header'],
												'detail_page' => ($config['project']['view_article']) ? 'view.php' : '',
												'albums' => ($config['project']['use_album']) ? $ProjectAlbums : NULL,
												'button' => $button
											));?>
            </ul>
            
            <div class="pagination">
            	<?php 
					$pagination = $Project->getPageNav();
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