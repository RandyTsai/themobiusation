<?php
/*
No restric for login / logout / update-profile process,
So we put these process in seperate file.
*/
include_once('top.php');

if(isset($_GET['action']) && $_GET['action'] == 'login'){
	
	unset($_SESSION['login_error']);
	
	if(isset($_POST['captcha-response']) && !empty($_POST['captcha-response'])){
		
        // Get verify response data
		$secretKey = RECAPTCHA_SECRET_KEY;
        $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secretKey.'&response='.$_POST['captcha-response']);
        $responseData = json_decode($verifyResponse);
        if($responseData->success){
            
			if($Auth -> login($_POST['username'], $_POST['password'])){
			
				//when login succese, go to redirect url or admin/index.php 
				$redirect = (isset($_GET['redirect']) && $_GET['redirect'] != '')?$_GET['redirect']:CONFIG_SITE_ROOT.CONFIG_ADMIN_PATH;
		
				$_SESSION['editor_upload_allowed'] = 1; //Editor upload Auth
				
				$Logger->autoRecord();
		
			}else{
				//when login failed, go back to login.php
            	$_SESSION['login_error'] = $Lang->_('Incorrect username or password.');
				$redirect = $_SERVER['HTTP_REFERER'];				
				
				$Logger->autoRecord();
			}
		
			header('Location:'.$redirect);
			exit;
		
        }else{
            $_SESSION['login_error'] = $Lang->_('Verification failed, please try again.');
        	$redirect = $_SERVER['HTTP_REFERER'];
			header('Location:'.$redirect);
			exit;
        }
		
    }else{
		$_SESSION['login_error'] = $Lang->_('Verification failed, please try again.');
        $redirect = $_SERVER['HTTP_REFERER'];
		header('Location:'.$redirect);
		exit;
    }
	
}

if(isset($_GET['action']) && $_GET['action'] == 'logout'){
	
	$DB->fullQuery = '';
	$Logger->autoRecord();
	
	//when logout, go back to login.php
	$Auth -> logout_redirect = CONFIG_SITE_ROOT.CONFIG_ADMIN_PATH.'account/login.php';
	
	unset($_SESSION['editor_upload_allowed']);  //Editor upload Auth
	
	unset($_SESSION['login_error']);
	unset($_SESSION['validate_forget_password']);
	unset($_SESSION['forget_password_msg']);
	unset($_SESSION['validate_reset_password']);
	unset($_SESSION['reset_password_complete']);

	$Auth -> logout();
}

if(isset($_GET['action']) && $_GET['action'] == 'update-profile'){
	
	$adminInfo = $Auth -> getUserInfo();
	$_GET['id'] = $adminInfo['id']; //for checkAccountExist

	$validate_rules = array(
		'username'  => array(array('type'=>'required', 'messege'=>$Lang->_('Username is required')),
							 array('type'=>'custom', 'func_name'=>'checkAccountExist', 'messege'=>$Lang->_('Username is already exist'))),
		'email'  => array('type'=>'email', 'messege'=>$Lang->_('Email is invalid'))
	); 
	
	if($_POST['password'] == ''){		
		unset($_POST['password']);
	}else{
		$_POST['password'] = md5($_POST['password']);
	}
					
	$Validation = new Validation();
	$Validation -> identifier = 'validate_account';
	$Validation -> rules = $validate_rules;
	if($Validation -> validate()){
		$Admin->update($adminInfo['id'],$_POST);
		$Logger->autoRecord();
		$redirect = 'profile.php';
		$Validation -> unsetSession();
	}else{
		$redirect = $_SERVER['HTTP_REFERER'];
	}
	
	//$Lang->genTranslationFile();
	
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'forget-password'){
	
	$validate_rules = array('email'  => array('type'=>'email', 'messege'=>$Lang->_('Please enter your E-mail')));
						
	$Validation = new Validation();
	$Validation -> identifier = 'validate_forget_password';
	$Validation -> rules = $validate_rules;
	
	if($Validation -> validate()){
		
		$admin = $Admin->dataArray(array('where'=>array('query'=>'email = ?', 'params'=>array($_POST['email']))));
		
		if(count($admin) > 0){
			
			$admin = reset($admin);
			$Admin->update($admin['id'], array(
				'reset_pass_token' => uniqid(rand(0,999)),
				'reset_pass_time' => date('Y-m-d H:i:s')
			));
			
			include_once('../settings/meta.php');	
			sendResetPasswordRequest($admin['id']);
			
			$_SESSION['forget_password_msg'] = $Lang->_('The password reset information has been sent to your E-mail');
			$redirect = $_SERVER['HTTP_REFERER'];
		}else{
			$_SESSION['forget_password_msg'] = $Lang->_('The E-mail is not exists');
			$redirect = $_SERVER['HTTP_REFERER'];
		}
		
		$Validation -> unsetSession();
		
	}else{
		$redirect = $_SERVER['HTTP_REFERER'];
	}
	
	header('Location:'.$redirect);
	exit;	
	
}

if(isset($_GET['action']) && $_GET['action'] == 'reset-password'){
	
	unset($_SESSION['reset_password_complete']);
	
	$validate_rules = array(
		'new_password' => array('type'=>'required', 'messege'=>$Lang->_('New password is required')),
		'repeat_password'  => array('type'=>'equalTo', 'compareTo'=>$_POST['new_password'], 'messege'=>$Lang->_('Password not equal'))
	); 
							
	$Validation = new Validation();
	$Validation -> identifier = 'validate_reset_password';
	$Validation -> rules = $validate_rules;
	
	if($Validation -> validate()){
		
		$admin = $Admin->dataArray(array('where'=>array('query'=>'reset_pass_token = ? AND reset_pass_time > (NOW() - INTERVAL 30 MINUTE)', 'params'=>array($_POST['token']) )));	
		
		if(count($admin) > 0){
			
			$admin = reset($admin);
			$Admin->update($admin['id'], array(
				'password' => md5($_POST['new_password']),
				'reset_pass_token' => '',
				'reset_pass_time' => ''
			));
			
			$Validation -> unsetSession();
			
			$_SESSION['reset_password_complete'] = 1;
			$redirect = 'reset.php';
		}else{
			$redirect = 'reset.php';
		}
		
		$Validation -> unsetSession();
		
	}else{
		$redirect = $_SERVER['HTTP_REFERER'];
	}
	
	header('Location:'.$redirect);
	exit;	
	
}
?>