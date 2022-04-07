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
        	<form action="process.php?action=update&page=<?=$_GET['page']?>" method="POST">
            	<?php echo $Settings->form(1); ?>
                
                <div class="buttons">
                	<input type="submit" value="<?=$Lang->_('Save')?>" class="button" />
                </div>
            </form>
        	
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>
<script>
switchSMTPField($('[name="smtp_auth_type"]').val());

$('[name="smtp_auth_type"]').change(function(){
	switchSMTPField($(this).val());
});

function switchSMTPField( value ){
	
	if(value == 'XOAUTH2'){
		$('[data-col="oauth_refresh_token"]').show();
		$('[data-col="smtp_password"]').hide();
	}else{
		$('[data-col="oauth_refresh_token"]').hide();
		$('[data-col="smtp_password"]').show();
	}
}
</script>