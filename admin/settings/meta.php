<?php
$config['settings'] = array(
	'use_album' => ($_GET['page'] == 3) ? true : false
);


$Settings 	= new Articles($DB, 'dc_settings');

if(!$_GET['page'] || $_GET['page'] == 1){
	
	$Settings -> addGroup('contact', $Lang->_('Contact information'));
	$Settings -> addColumn(array('group'=>'contact', 'name'=>'contact_address', 'type'=>'text', 'label'=>$Lang->_('Address'), 'input'=>'text', 'lang'=>$language_enabled));
	$Settings -> addColumn(array('group'=>'contact', 'name'=>'contact_phone', 'type'=>'text', 'label'=>$Lang->_('Phone'), 'input'=>'text'));
	$Settings -> addColumn(array('group'=>'contact', 'name'=>'contact_email', 'type'=>'text', 'label'=>$Lang->_('Email'), 'input'=>'text'));	
	
	$Settings -> addGroup('social', $Lang->_('Social links'));
	$Settings -> addColumn(array('group'=>'social', 'name'=>'social_facebook', 'type'=>'text', 'label'=>'Facebook', 'input'=>'text', 'format'=>'url'));
	$Settings -> addColumn(array('group'=>'social', 'name'=>'social_messenger', 'type'=>'text', 'label'=>'Messenger', 'input'=>'text', 'format'=>'url'));
	$Settings -> addColumn(array('group'=>'social', 'name'=>'social_instagram', 'type'=>'text', 'label'=>'Instagram', 'input'=>'text', 'format'=>'url'));
	$Settings -> addColumn(array('group'=>'social', 'name'=>'social_twitter', 'type'=>'text', 'label'=>'Twitter', 'input'=>'text', 'format'=>'url'));
	$Settings -> addColumn(array('group'=>'social', 'name'=>'social_line', 'type'=>'text', 'label'=>'Line', 'input'=>'text', 'format'=>'url'));
	$Settings -> addColumn(array('group'=>'social', 'name'=>'social_linkedin', 'type'=>'text', 'label'=>'LinkedIn', 'input'=>'text', 'format'=>'url'));
	$Settings -> addColumn(array('group'=>'social', 'name'=>'social_youtube', 'type'=>'text', 'label'=>'Youtube', 'input'=>'text', 'format'=>'url'));
	
}else if($_GET['page'] == 2){
	
	$Settings -> addGroup('general', $Lang->_('System mail settings'));
	$Settings -> addColumn(array('group'=>'general', 'name'=>'mail_sender', 'type'=>'text', 'label'=>$Lang->_('Mail sender'), 'input'=>'text'));
	$Settings -> addColumn(array('group'=>'general', 'name'=>'mail_receiver', 'type'=>'text', 'label'=>$Lang->_('Mail receiver'), 'input'=>'text'));
	$Settings -> addColumn(array('group'=>'general', 'name'=>'mail_from', 'type'=>'text', 'label'=>$Lang->_('Mail from'), 'input'=>'text'));
	$Settings -> addColumn(array('group'=>'general', 'name'=>'mail_header', 'type'=>'text', 'label'=>$Lang->_('Mail header'), 'input'=>'textarea', 'richtext'=>true));
	$Settings -> addColumn(array('group'=>'general', 'name'=>'mail_signature', 'type'=>'text', 'label'=>$Lang->_('Mail signature'), 'input'=>'textarea', 'richtext'=>true));
	
	$description = $Lang->_('To log in with OAuth and send mail via Gmail, please get the Refresh Token from <a href="get_oauth_token.php?provider=Google" target="_blank">Here</a>. You must update the Refresh Token whenever you change the password of your Google account.');
	
	$Settings -> addGroup('smtp', $Lang->_('Outgoing mail server'), $description);
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'smtp_status', 'type'=>'text', 'label'=>$Lang->_('Status'), 'input'=>'radio', 'options'=>array('1'=>$Lang->_('Enabled'), '0'=>$Lang->_('Disabled')) ));
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'smtp_host', 'type'=>'text', 'label'=>$Lang->_('SMTP Host'), 'input'=>'text'));
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'smtp_port', 'type'=>'text', 'label'=>$Lang->_('SMTP Port'), 'input'=>'text'));
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'smtp_secure', 'type'=>'text', 'label'=>$Lang->_('SMTP Secure'), 'input'=>'select', 'options'=>array(''=>'','ssl'=>'SSL', 'tls'=>'TLS')));	
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'smtp_auth_type', 'type'=>'text', 'label'=>$Lang->_('SMTP Auth Type'), 'input'=>'select', 'options'=>array(''=>'AUTO','XOAUTH2'=>'XOAUTH2')));	
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'smtp_account', 'type'=>'text', 'label'=>$Lang->_('Account'), 'input'=>'text'));
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'smtp_password', 'type'=>'text', 'label'=>$Lang->_('Password'), 'input'=>'password'));
	$Settings -> addColumn(array('group'=>'smtp', 'name'=>'oauth_refresh_token', 'type'=>'text', 'label'=>$Lang->_('OAuth Refresh Token'), 'input'=>'textarea', 'input_property'=>array('class'=>'short') ));
	
	
}else if($_GET['page'] == 3){
	
	$Settings -> addGroup('meta', $Lang->_('Meta settings'));
	$Settings -> addColumn(array('group'=>'meta', 'name'=>'meta_title', 'type'=>'text', 'label'=>$Lang->_('Website title'), 'input'=>'text', 'lang'=>$language_enabled));
	$Settings -> addColumn(array('group'=>'meta', 'name'=>'meta_keywords', 'type'=>'text', 'label'=>$Lang->_('Website keywords'), 'input'=>'textarea', 'lang'=>$language_enabled));
	$Settings -> addColumn(array('group'=>'meta', 'name'=>'meta_description', 'type'=>'text', 'label'=>$Lang->_('Website description'), 'input'=>'textarea', 'lang'=>$language_enabled));
	
}


$load_uploader = true;

$SettingsAlbums = new Albums2($DB, 'dc_settings_attach');
$SettingsAlbums -> setThumbEngine(CONFIG_THUMB_ENGINE);
$SettingsAlbums -> type = 'image';
$SettingsAlbums -> limit_one = true;
$SettingsAlbums -> async = true;
$SettingsAlbums -> upload_path = CONFIG_ADMIN_UPLOAD_PATH.'image/settings/';
$SettingsAlbums -> buttons = array(
	array('path'=>'process.php','label'=>$Lang->_('Download'), 'params'=>'action=download', 'class'=>'album-download-button'),
	array('path'=>'process.php','label'=>$Lang->_('Remove'), 'params'=>'action=delete-album-item', 'class'=>'album-delete-button'),
);

$SettingsAlbums -> addRule(array('folder' => 'icon-32/', 'type' => 'fill', 'width' => 32, 'height' => 32));
$SettingsAlbums -> addRule(array('folder' => 'icon-192/', 'type' => 'fill', 'width' => 192, 'height' => 192));
$SettingsAlbums -> addRule(array('folder' => 'thumb/', 'type' => 'fit', 'width' => 360, 'height' => 360));
$SettingsAlbums -> addRule(array('folder' => 'large/', 'type' => 'fit', 'width' => 1280, 'height' => 1280));
$SettingsAlbums -> addRule(array('folder' => 'original/', 'type' => 'resize', 'width' => NULL, 'height' => NULL, 'quality' => 100));


function sendTestMail($email){
	
	global $Settings;
	
	$settings = $Settings->getArticle(1);
	
	$subject = 'E-mail Test';
	$content = '<p>E-mail test from '.$settings['mail_from'].'</p>';
	
	return sendMail(array(
		'sender' => $settings['mail_sender'],
		'receiver' => $email,
		'from' => $settings['mail_from'],
		'subject' => $subject,
		'body' => genMailBody(array('subject'=>$subject, 'content'=>$content)),
		'debug' => 1
	));
	
}
?>