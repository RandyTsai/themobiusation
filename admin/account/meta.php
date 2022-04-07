<?php
$config['account'] = array(
	'use_category' 		=> true,
	'add_category'		=> true,
	'edit_category'		=> true,
	'delete_category'	=> true,
	'add_article'		=> true,
	'edit_article'		=> true,
	'delete_article'	=> true,	
	'view_article' 		=> true,	
	'list_field' 		=> array('category', 'name', 'username','status'),
	'list_header' 		=> array('category'=>$Lang->_('Group'), 
								 'name'=>$Lang->_('Name'), 
								 'username' =>$Lang->_('Username'), 
								 'status'=>$Lang->_('Status')),
	'category_level'	=> 1
);


$admin_status_options = array(
								'0' => $Lang->_('Disable'),
								'1' => $Lang->_('Enable')
				  			);
							
foreach($module_enabled as $folder => $label){
	if(is_array($label)){
		$admin_group_permission_options[$folder] = $Lang->_($label['label']);
	}else if($label != '|'){
		$admin_group_permission_options[$folder] = $Lang->_($label);
	}
}


if($config['account']['use_category']){
$AdminGroup = new Category($DB, 'dc_admin_cat', 'dc_admin');
$AdminGroup -> addColumn(array('name'=>'title', 'type'=>'text', 'label'=>$Lang->_('Title'), 'input'=>'text', 'lang'=>$language_enabled));
$AdminGroup -> addColumn(array('name'=>'permission', 'type'=>'text', 'label'=>$Lang->_('Permission'), 'input'=>'checkbox', 'options'=>$admin_group_permission_options));
$AdminGroup->loadCatList();
}


$Admin = new Articles($DB, 'dc_admin');
$Admin -> addColumn(array('name'=>'status', 'type'=>'bool', 'label'=>$Lang->_('Status'), 'input'=>'select', 'options'=>$admin_status_options, 'default' => 1));
$Admin -> addColumn(array('name'=>'name', 'type'=>'text', 'label'=>$Lang->_('Name'), 'input'=>'text'));
$Admin -> addColumn(array('name'=>'username', 'type'=>'text', 'label'=>$Lang->_('Username'), 'input'=>'text'));
$Admin -> addColumn(array('name'=>'password', 'type'=>'text', 'label'=>$Lang->_('Password'), 'input'=>'password'));
$Admin -> addColumn(array('name'=>'email', 'type'=>'text', 'label'=>$Lang->_('Email'), 'input'=>'text'));

if($config['account']['use_category']){
$Admin -> addColumn(array('name'=>'category', 'type'=>'int', 'label'=>$Lang->_('Group'), 'input'=>'select', 'options'=>$AdminGroup->outputOptions(0,0,array(0 => $Lang->_('Administrator'))), 'escape' => false));
}

$Admin -> addColumn(array('name'=>'reset_pass_token', 'type'=>'text'));
$Admin -> addColumn(array('name'=>'reset_pass_time', 'type'=>'text'));

function checkAccountExist($value, $except = NULL){
		
	global $DB;
	global $Admin;
		
	if($except){
		$stmt = $DB->prepare('SELECT * FROM '.$Admin->table.' WHERE username = ? AND id != ?');
		$stmt->execute(array($_POST['username'], $except));
	}else{
		$stmt = $DB->prepare('SELECT * FROM '.$Admin->table.' WHERE username = ?');
		$stmt->execute(array($_POST['username']));
	}
		
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
		
	if(isset($row['id']))
		return false;
	else
		return true;
}


function checkEmailExist($email, $except = NULL){
		
	global $DB;
	global $Admin;
		
	if($except){
		$stmt = $DB->prepare('SELECT * FROM '.$Admin->table.' WHERE email = ? AND id != ?');
		$stmt->execute(array($_POST['username'], $except));
	}else{
		$stmt = $DB->prepare('SELECT * FROM '.$Admin->table.' WHERE email = ? ');
		$stmt->execute(array($email));
	}
		
	$row = $stmt->fetch(PDO::FETCH_ASSOC);
		
	if(isset($row['id']))
		return false;
	else
		return true;
}

function sendResetPasswordRequest($id){
	
	global $Admin;
	global $Lang;
	global $Settings;
	
	$settings = $Settings->getArticle(1);
	$admin = $Admin->getArticle($id);
	
	$link = CONFIG_SITE_ROOT.'admin/account/reset.php?token='.$admin['reset_pass_token'];
	
	$subject = $Lang->_('Reset password');
	$content = '<p>'.$Lang->_('You recently requested a password reset for your account. To complete the process, click the link below...').'</p>';
	$content .= '<div style="border:1px solid #ccc; padding:20px;"><a href="'.$link.'" target="_blank">'.$link.'</a></div><br/>';
	
	return sendMail(array(
		'sender' => $settings['mail_sender'],
		'receiver' => $admin['email'],
		'from' => $settings['mail_from'],
		'subject' => $subject,
		'body' => genMailBody(array('subject'=>$subject, 'content'=>$content))
	));
	
}
?>