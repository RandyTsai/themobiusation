<?php
include_once('top.php');

if(isset($_GET['action']) && $_GET['action'] == 'insert-category'){
	$GalleryCategory->insert($_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update-category'){
	$GalleryCategory->update($_GET['id'],$_POST);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-category'){
	$GalleryCategory->delete($_GET['id']);
	$Logger->autoRecord();
	$redirect = 'category.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort-category'){
	$GalleryCategory->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'insert'){
	$insertId = $Gallery->insert($_POST);
	$Logger->autoRecord();
	$redirect = 'index.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'update'){
	$Gallery->update($_GET['id'],$_POST);
	$Logger->autoRecord();
	$redirect = 'index.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete'){
	$Gallery->delete($_GET['id']);
	$Logger->autoRecord();
	if($config['gallery']['use_album']){
		$GalleryAlbums->deleteAllItems($_GET['id']);
	}
	$redirect = 'index.php';
	header('Location:'.$redirect);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort'){
	$Gallery->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'upload'){
	
	$result = $GalleryAlbums->addItem($_GET['album'], $_FILES['file']);
	$Logger->autoRecord();
	
	if(!$GalleryAlbums->error){
		$html = $GalleryAlbums->genListItemHTML($result['id']);
		echo json_encode(array('status'=>1, 'html'=>$html));
	}else{
		echo json_encode(array('status'=>0, 'message'=>$GalleryAlbums->error));
	}
	
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'edit-album-item'){
	
	foreach($_POST['multi'] as $key => $val){	
		$GalleryAlbums->update($key, $val);
		$Logger->autoRecord();
	}
	$redirect = 'index.php';
	header('Location:'.$redirect);
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'set-album-cover'){
	$cover = $GalleryAlbums->setCover($_GET['id']);
	$Logger->autoRecord();
	
	echo json_encode(array('cover'=>$cover));
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'delete-album-item'){
	$GalleryAlbums->deleteItem($_GET['id']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'sort-album-item'){
	$GalleryAlbums->sort($_POST['list']);
	$Logger->autoRecord();
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'crop-image'){	

	$new_filename = $GalleryAlbums->cropImage($_POST['source'], $_POST['path'], $_POST['x'], $_POST['y'], $_POST['w'], $_POST['h'], $_POST['rule_index']);
	$Logger->autoRecord();
	
	header('Location:'.($_POST['referer']?$_POST['referer']:$_SERVER['HTTP_REFERER']));
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'download'){	

	$GalleryAlbums->downloadItem($_GET['id'], $GalleryAlbums->upload_path.'original/');
	exit;
	
}

if(isset($_GET['action']) && $_GET['action'] == 'check-image-exists'){//For async make thumb	
	
	$result = array();
	
	foreach($_POST['paths'] as $path){
		if(file_exists($path)){
			$result[] = $path;
		}
	}
	
	if(count($_POST['paths']) > 0 && count($_POST['paths']) != count($result) && !$GalleryAlbums->isAsyncLockValied()){
		$GalleryAlbums->createAsyncProcess();
	}
	
	echo json_encode($result);
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'autocomplete'){
	echo json_encode(getAutoCompleteWords($Gallery));	
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'add-video'){
	
	if($_POST['video_url'] != ''){
		
		$vdata = Articles::getVideoMeta($_POST['video_url']);
		
		if($vdata['thumb']){
			
			$result = $GalleryAlbums->addItem($_POST['album'], $vdata['thumb'], array(
					'video_url'=>$_POST['video_url'], 
					'alt_en'=>$vdata['title'], 
					'alt_zh'=>$vdata['title']
				));
			
			$html = $GalleryAlbums->genListItemHTML($result['id']);
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