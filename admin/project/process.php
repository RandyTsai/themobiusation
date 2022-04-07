<?php
include_once('top.php');

if(isset($_GET['action']) && $_GET['action'] == 'insert-category'){
	$ProjectCategory->insert($_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update-category'){
	$ProjectCategory->update($_GET['id'],$_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-category'){
	$ProjectCategory->delete($_GET['id']);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort-category'){
	$ProjectCategory->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'insert'){
	$insertId = $Project->insert($_POST);
	$Logger->autoRecord();
	$redirect = 'view.php?id='.$insertId;
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update'){
	$Project->update($_GET['id'],$_POST);
	$Logger->autoRecord();
	$redirect = 'view.php?id='.$_GET['id'];
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete'){
	$Project->delete($_GET['id']);
	$Logger->autoRecord();
	if($config['project']['use_album']){
		$ProjectAlbums->deleteAllItems($_GET['id']);
	}
	$redirect = 'index.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort'){
	$Project->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'upload'){
	
	$result = $ProjectAlbums->addItem($_GET['album'], $_FILES['file']);
	$Logger->autoRecord();
	
	if(!$ProjectAlbums->error){
		$html = $ProjectAlbums->genListItemHTML($result['id']);
		echo json_encode(array('status'=>1, 'html'=>$html));
	}else{
		echo json_encode(array('status'=>0, 'message'=>$ProjectAlbums->error));
	}
	
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'edit-album-item'){
	
	foreach($_POST['multi'] as $key => $val){	
		$ProjectAlbums->update($key, $val);
		$Logger->autoRecord();
	}
	$redirect = 'view.php?id='.$_GET['album'];
	header('Location:'.$redirect);
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'set-album-cover'){
	$cover = $ProjectAlbums->setCover($_GET['id']);
	$Logger->autoRecord();
	
	echo json_encode(array('cover'=>$cover));
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-album-item'){
	$ProjectAlbums->deleteItem($_GET['id']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort-album-item'){
	$ProjectAlbums->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'crop-image'){	

	$new_filename = $ProjectAlbums->cropImage($_POST['source'], $_POST['path'], $_POST['x'], $_POST['y'], $_POST['w'], $_POST['h'], $_POST['rule_index']);
	$Logger->autoRecord();
	
	header('Location:'.($_POST['referer']?$_POST['referer']:$_SERVER['HTTP_REFERER']));
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'download'){	

	$ProjectAlbums->downloadItem($_GET['id'], $ProjectAlbums->upload_path.'original/');
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'check-image-exists'){//For async make thumb	
	
	$result = array();
	
	foreach($_POST['paths'] as $path){
		if(file_exists($path)){
			$result[] = $path;
		}
	}
	
	if(count($_POST['paths']) > 0 && count($_POST['paths']) != count($result) && !$ProjectAlbums->isAsyncLockValied()){
		$ProjectAlbums->createAsyncProcess();
	}
	
	echo json_encode($result);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'autocomplete'){
	echo json_encode(getAutoCompleteWords($Project));	
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'add-video'){
	
	if($_POST['video_url'] != ''){
		
		$vdata = Articles::getVideoMeta($_POST['video_url']);
		
		if($vdata['thumb']){
			
			$result = $ProjectAlbums->addItem($_POST['album'], $vdata['thumb'], array(
					'video_url'=>$_POST['video_url'],
					'alt_en'=>$vdata['title'], 
					'alt_zh'=>$vdata['title']
				));
			
			$html = $ProjectAlbums->genListItemHTML($result['id']);
			echo json_encode(array('status'=>1, 'html'=>$html));
		}
	}
	
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'updateSession'){
	updateSession();
	exit;
}
?>