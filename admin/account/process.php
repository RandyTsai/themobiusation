<?php
include_once('top.php');

if(isset($_GET['action']) && $_GET['action'] == 'insert'){
	
	$validate_rules = array(
		'name' => array('type'=>'required', 'messege'=>$Lang->_('Please enter your name')),
		'username' => array(
			array('type'=>'required', 'messege'=>$Lang->_('Username is required')),
			array('type'=>'custom', 'func_name'=>'checkAccountExist', 'messege'=>$Lang->_('Username is already exist'))
		),
		'password' => array('type'=>'required', 'messege'=>$Lang->_('Password is invalid')),
		'email' => array(
			array('type'=>'email', 'messege'=>$Lang->_('Email is invalid')),
			array('type'=>'custom', 'func_name'=>'checkEmailExist', 'messege'=>$Lang->_('E-mail is already exist'))
		)
	); 
							
	$Validation = new Validation();
	$Validation -> identifier = 'validate_account';
	$Validation -> rules = $validate_rules;
	
	if($Validation -> validate()){
		
		$_POST['password'] = md5($_POST['password']);
		$_POST['category'] = $config['account']['use_category'] ? $_POST['category'] : 0;
		$Admin->insert($_POST);
		$Logger->autoRecord();
		$redirect = 'index.php';
		$Validation -> unsetSession();
		
	}else{
		$redirect = $_SERVER['HTTP_REFERER'];
	}
	
	//$Lang->genTranslationFile();
	
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update'){
	
	$validate_rules = array(
		'name' => array('type'=>'required', 'messege'=>$Lang->_('Please enter your name')),
		'username' => array(
			array('type'=>'required', 'messege'=>$Lang->_('Username is required')),
			array('type'=>'custom', 'func_name'=>'checkAccountExist', 'param'=>$_GET['id'], 'messege'=>$Lang->_('Username is already exist'))
		),
		'email' => array(
			array('type'=>'email', 'messege'=>$Lang->_('Email is invalid')),
			array('type'=>'custom', 'func_name'=>'checkEmailExist', 'param'=>$_GET['id'], 'messege'=>$Lang->_('E-mail is already exist'))
		)
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
		$Admin->update($_GET['id'],$_POST);
		$Logger->autoRecord();
		$redirect = 'index.php';
		$Validation -> unsetSession();
	}else{
		$redirect = $_SERVER['HTTP_REFERER'];
	}
	
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete'){
	
	if($Admin->getArticleNum() > 1){
		$Admin->delete($_GET['id']);
		$Logger->autoRecord();
	}
	
	$redirect = 'index.php'.$errDelete;
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'insert-category'){
	
	$AdminGroup->insert($_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update-category'){
	
	$AdminGroup->update($_GET['id'],$_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-category'){
	
	$AdminGroup->delete($_GET['id'], true, false);
	$Logger->autoRecord();
	
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort-category'){
	$AdminGroup->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'updateSession'){
	updateSession();
	exit;
}

?>