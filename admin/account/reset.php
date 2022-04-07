<?php 
include_once('top.php'); 

unset($_SESSION['login_error']);
unset($_SESSION['validate_forget_password']);
unset($_SESSION['forget_password_msg']);
?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
</head>

<body id="login">
	<div id="container">
    	<?php include_once('../header.php'); ?>        
        <div id="content">
            <form action="process.auth.php?action=reset-password" method="post">
                	<legend><?=$Lang->_('Reset password')?></legend>
                    
                    <?php 
						$token_valid = false;
					
						if(isset($_GET['token'])){
							
							$admin = $Admin->dataArray(array('where'=>array('query'=>'reset_pass_token = ? AND reset_pass_time > (NOW() - INTERVAL 30 MINUTE)', 'params'=>array($_GET['token']) )));	
							
							if(count($admin) > 0){
								$token_valid = true;
							}
						}	
					?>
                    
                    <?php if($token_valid){ ?>
                    
                    	<div class="row">
                        
                    		<div class="label"><?=$Lang->_('New password')?></div>
                    		<input type="password" name="new_password" value="<?=$_SESSION['validate_reset_password']['values']['new_password']?>" />
                            <?php if($_SESSION['validate_reset_password']['errors']['new_password']){?>
                    		<div class="msg"><?=$_SESSION['validate_reset_password']['errors']['new_password']?></div>
                    		<?php }?>
                    	</div>
                    	<div class="row">
                    		<div class="label"><?=$Lang->_('Repeat password')?></div>
                    		<input type="password" name="repeat_password" />
                            <?php if($_SESSION['validate_reset_password']['errors']['repeat_password']){?>
                    		<div class="msg"><?=$_SESSION['validate_reset_password']['errors']['repeat_password']?></div>
                    		<?php }?>
                    	</div>                    
                    	<div class="buttons">
                    		<input type="submit" value="<?=$Lang->_('Save')?>" class="button" />
                            <input type="hidden" name="token" value="<?=$_GET['token']?>" />
                    	</div>	
                    
                    <?php }else if($_SESSION['reset_password_complete']){  unset($_SESSION['reset_password_complete']); ?>
						<div class="msg"><?=$Lang->_('The password reset is complete. <br/>Please login with your new password.')?></div>
                        <div class="link"><a href="login.php"><?=$Lang->_('Login')?></a></div>
					<?php }else{ ?>
                    	<div class="msg"><?=$Lang->_('The password reset request is expired.')?></div>
                        <div class="link"><a href="login.php"><?=$Lang->_('Login')?></a></div>
                    <?php }?>
                    
            </form>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>