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
        	<form action="process.php?action=<?=(isset($_GET['id']))?'update-category':'insert-category'?>&id=<?=$_GET['id']?>" method="POST">
            	<?php echo $ProjectCategory->form($_GET['id']); ?>
                <input type="submit" value="<?=$Lang->_('Save')?>" class="button" />
            </form>
        	
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>