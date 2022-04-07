<?php
include_once('top.php');
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
            <?php if(isset($_GET['msg']) && $_GET['msg']!=''){?>
				<div class="msg-box"><?=$_GET['msg']?></div>
			<?php } ?>
            <div class="view">
				<?php echo $Admin->view($_GET['id']); ?>
            </div>
            
            <?php if($config['account']['edit_article']){?><a href="edit.php?id=<?=$_GET['id']?>" class="button"><?=$Lang->_('Edit')?></a><?php }?>
            <?php if($config['account']['delete_article']){?><a href="process.php?action=delete&id=<?=$_GET['id']?>" class="button delete-button"><?=$Lang->_('Delete')?></a><?php }?>
            
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>