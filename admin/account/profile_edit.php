<?php
include_once('top.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        	<form action="process.auth.php?action=update-profile" method="POST">
            	<?=$Admin->form($adminInfo['id'], array(
													'validation' => $_SESSION['validate_account'],
													'ignore' => array('status', 'category')
												))?>
                
                <div class="buttons">
                	<input type="submit" value="<?=$Lang->_('Save')?>" class="button" />
                </div>
            </form>
        	
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>