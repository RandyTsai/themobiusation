<?php 
include_once('top.php'); 

unset($_SESSION['validate_forget_password']);
unset($_SESSION['forget_password_msg']);
unset($_SESSION['validate_reset_password']);
unset($_SESSION['reset_password_complete']);
?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback" async defer></script>
<script>
var onloadCallback = function() {
    grecaptcha.execute();
};

function setResponse(response) { 
    document.getElementById('captcha-response').value = response; 
}
</script>
</head>

<body id="login">
	<div id="container">
    	<?php include_once('../header.php'); ?>        
        <div id="content">
            <form action="process.auth.php?action=login<?=(isset($_GET['redirect'])&&($_GET['redirect']!=''))?('&redirect='.$_GET['redirect']):''?>" method="post">
                	<legend><?=$Lang->_('Login')?></legend>
                    <div class="row">
                    	<div class="label"><?=$Lang->_('Username')?></div>
                    	<input type="text" name="username" />
                    </div>
                    <div class="row">
                    	<div class="label"><?=$Lang->_('Password')?></div>
                    	<input type="password" name="password" />
                    </div>
                    
                    <?php if($_SESSION['login_error']){?>
                    <div class="msg"><?=$_SESSION['login_error']?></div>
                    <?php } ?>
                    
                    <div class="buttons">
                    	<input type="submit" value="<?=$Lang->_('Login')?>" class="button" />
                        <a href="forget.php"><?=$Lang->_('Forget password')?></a>
                    </div>
                    
                    <!-- Google reCAPTCHA widget -->
    				<div class="g-recaptcha" data-sitekey="<?=RECAPTCHA_SITE_KEY?>" data-badge="inline" data-size="invisible" data-callback="setResponse"></div>    
    				<input type="hidden" id="captcha-response" name="captcha-response" />	
            </form>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>