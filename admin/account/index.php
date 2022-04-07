<?php
include_once('top.php');
unset($_SESSION['validate_account']);

$query = genListQuery($config['account'], $AdminGroup);
				
//Buttons
$buttons = array();
					
if($config['account']['view_article'])
	$button['view'] = array('path'=>'view.php', 'label'=>$Lang->_('View'));		

if(!$config['account']['use_category']){
	unset($config['account']['list_field'][0]);
	unset($config['account']['list_header'][0]);
}

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
            <ul class="inline-list">
				<?=$Admin->listArticles(array(
											'where' => $query['where'],
											'order' => $query['order'],
											'field' => $config['account']['list_field'],
											'header' => $config['account']['list_header'],
											'button' => $button
										))?>
                
            </ul>
            <div class="pagination">
            	<?php 
					$pagination = $Admin->getPageNav();
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