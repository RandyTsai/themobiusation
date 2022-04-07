<?php 
include_once('top.php'); 

unset($_SESSION['login_error']);
unset($_SESSION['validate_reset_password']);
unset($_SESSION['reset_password_complete']);
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
            <form action="process.auth.php?action=forget-password" method="post">
                	<legend><?=$Lang->_('Forget password')?></legend>
                    <div class="row">
                    	<div class="label"><?=$Lang->_('Enter your E-mail to reset password')?></div>
                    	<input type="text" name="email" />
                    </div>
                    
                    <?php if($_SESSION['validate_forget_password']['errors']['email']){?>
                    <div class="msg"><?=$_SESSION['validate_forget_password']['errors']['email']?></div>
                    <?php }else if($_SESSION['forget_password_msg']){?>
                    <div class="msg"><?=$_SESSION['forget_password_msg']?></div>
                    <?php } ?>
                    
                    <div class="buttons">
                    	<input type="submit" value="<?=$Lang->_('Send a request')?>" class="button" />
                        <a href="login.php"><?=$Lang->_('Login')?></a>
                    </div>	
            </form>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>