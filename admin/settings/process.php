<?php
include_once('top.php');

if(isset($_GET['action']) && $_GET['action'] == 'update'){
	
	if($_POST['smtp_password'] == ''){
		unset($_POST['smtp_password']);
	}
	
	$Settings->update(1,$_POST);
	$Logger->autoRecord();
	$redirect = 'index.php?page='.$_GET['page'];
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'send-test-mail'){
	
	if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
		if(sendTestMail($_POST['email'])){
			echo '<br/>'.$Lang->_('Mail have been sent');
		}else{
			echo '<br/>'.$Lang->_('Mail could not be sent');
		}
	}else{
		echo $Lang->_('Please enter the test mailbox.');
	}
	
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'upload'){
	
	$result = $SettingsAlbums->addItem($_GET['album'], $_FILES['file']);
	$Logger->autoRecord();
	
	if(!$SettingsAlbums->error){
		$html = $SettingsAlbums->genListItemHTML($result['id']);
		echo json_encode(array('status'=>1, 'html'=>$html));
	}else{
		echo json_encode(array('status'=>0, 'message'=>$SettingsAlbums->error));
	}
	
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-album-item'){
	$SettingsAlbums->deleteItem($_GET['id']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'download'){	

	$SettingsAlbums->downloadItem($_GET['id'], $SettingsAlbums->upload_path.'original/');
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'check-image-exists'){//For async make thumb	
	
	$result = array();
	
	foreach($_POST['paths'] as $path){
		if(file_exists($path)){
			$result[] = $path;
		}
	}
	
	if(count($_POST['paths']) > 0 && count($_POST['paths']) != count($result) && !$SettingsAlbums->isAsyncLockValied()){
		$SettingsAlbums->createAsyncProcess();
	}
	
	echo json_encode($result);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'updateSession'){
	updateSession();
	exit;
}
?>