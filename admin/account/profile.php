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
				<?php echo $Admin->view($adminInfo['id']); ?>
            </div>
            
            <div class="buttons">
            	<a href="profile_edit.php" class="button"><?=$Lang->_('Edit')?></a>
            </div>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>