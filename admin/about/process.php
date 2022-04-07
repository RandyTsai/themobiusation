<?php
include_once('top.php');

if(isset($_GET['action']) && $_GET['action'] == 'insert-category'){
	$AboutCategory->insert($_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update-category'){
	$AboutCategory->update($_GET['id'],$_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-category'){
	$AboutCategory->delete($_GET['id']);
	$Logger->autoRecord();
	
	if($config['about']['use_album']){
		$AboutAlbums->deleteAllItems('category-'.$_GET['id']);
	}
	
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort-category'){
	$AboutCategory->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'insert'){
	$insertId = $About->insert($_POST);
	$Logger->autoRecord();
	$redirect = 'view.php?id='.$insertId;
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update'){
	$About->update($_GET['id'],$_POST);
	$Logger->autoRecord();
	$redirect = 'view.php?id='.$_GET['id'];
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete'){
	$About->delete($_GET['id']);
	$Logger->autoRecord();
	if($config['about']['use_album']){
		$AboutAlbums->deleteAllItems($_GET['id']);
	}
	$redirect = 'index.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort'){
	$About->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'upload'){
	
	$AboutAlbums->limit_one = $_GET['limit_one']; //Overwrite limit_one settings for category album
	
	$result = $AboutAlbums->addItem($_GET['album'], $_FILES['file']);
	$Logger->autoRecord();
	
	if(!$AboutAlbums->error){
		$html = $AboutAlbums->genListItemHTML($result['id']);
		echo json_encode(array('status'=>1, 'html'=>$html));
	}else{
		echo json_encode(array('status'=>0, 'message'=>$AboutAlbums->error));
	}
	
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'edit-album-item'){
	
	foreach($_POST['multi'] as $key => $val){	
		$AboutAlbums->update($key, $val);
		$Logger->autoRecord();
	}
	$redirect = 'view.php?id='.$_GET['album'];
	header('Location:'.$redirect);
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'set-album-cover'){
	$cover = $AboutAlbums->setCover($_GET['id']);
	$Logger->autoRecord();
	
	echo json_encode(array('cover'=>$cover));
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-album-item'){
	$AboutAlbums->deleteItem($_GET['id']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort-album-item'){
	$AboutAlbums->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'crop-image'){	

	$new_filename = $AboutAlbums->cropImage($_POST['source'], $_POST['path'], $_POST['x'], $_POST['y'], $_POST['w'], $_POST['h'], $_POST['rule_index']);
	$Logger->autoRecord();
	
	header('Location:'.($_POST['referer']?$_POST['referer']:$_SERVER['HTTP_REFERER']));
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'download'){	

	$AboutAlbums->downloadItem($_GET['id'], $AboutAlbums->upload_path.'original/');
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'check-image-exists'){//For async make thumb	
	
	$result = array();
	
	foreach($_POST['paths'] as $path){
		if(file_exists($path)){
			$result[] = $path;
		}
	}
	
	if(count($_POST['paths']) > 0 && count($_POST['paths']) != count($result) && !$AboutAlbums->isAsyncLockValied()){
		$AboutAlbums->createAsyncProcess();
	}
	
	echo json_encode($result);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'autocomplete'){
	echo json_encode(getAutoCompleteWords($About));	
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'add-video'){
	
	if($_POST['video_url'] != ''){
		
		$vdata = Articles::getVideoMeta($_POST['video_url']);
		
		if($vdata['thumb']){
			
			$result = $AboutAlbums->addItem($_POST['album'], $vdata['thumb'], array(
					'video_url'=>$_POST['video_url'],
					'alt_en'=>$vdata['title'], 
					'alt_zh'=>$vdata['title']
				));
			
			$html = $AboutAlbums->genListItemHTML($result['id']);
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