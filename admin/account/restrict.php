<?php
//Redirect to login.php and set current page as url param.
$Auth -> restrict_redirect = '../account/login.php?redirect='.urlencode($_SERVER['REQUEST_URI']);

//No restrict for login.php & process.auth.php
if(!in_array(basename($_SERVER['PHP_SELF']), array('login.php', 'forget.php', 'reset.php', 'process.auth.php', 'error.php'))){
	   
	$Auth -> restrict();
	
}else if($Auth->isLogin() && !$Auth->isPermissionAllowed()){
	
	$permission = $Auth->getUserPermission();
	
	if(count($permission) > 0){
		header('Location:'.CONFIG_SITE_ROOT.CONFIG_ADMIN_PATH.$permission[0]);
	}else{
		header('Location:'.CONFIG_SITE_ROOT.CONFIG_ADMIN_PATH.'error.php');
	}
	
	exit;
	
}else if($Auth->isLogin() && in_array(basename($_SERVER['PHP_SELF']), array('login.php', 'forget.php', 'reset.php')) ){
	
	header('Location:'.CONFIG_SITE_ROOT.CONFIG_ADMIN_PATH);
	exit;
	
}
?>