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
        		<?php include_once('../lang.php'); ?>
        		<?php include_once('buttons.php'); ?>
            </div>
        	<form action="process.php?action=<?=(isset($_GET['id']))?'update':'insert'?>&id=<?=$_GET['id']?>" method="POST">
            	<?php echo $Project->form($_GET['id']); ?>
                <div class="buttons">
                	<input type="submit" value="<?=$Lang->_('Save')?>" class="button" />
                </div>
            </form>
        	
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>