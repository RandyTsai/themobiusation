<?php
include_once('top.php');

if(isset($_GET['action']) && $_GET['action'] == 'export'){
	
	if(isset($_GET['range']) && $_GET['range'] != ''){
		$record = $Logger -> read($_GET['range']);
		$filename = CONFIG_ADMIN_TITLE.'-'.$_GET['range'].'.txt';
	}else{
		$record = $Logger -> read();
		$filename = CONFIG_ADMIN_TITLE.'-all.txt';
	}
	
	
	$str = '';
	foreach($record as $row){
		unset($row['id']);
		$str .= implode(' ', $row)."\r\n";
	};
	
	header('Content-disposition: attachment; filename='.$filename);
	header('Content-type: text/plain');

	echo $str;
	
	exit;
}

if(isset($_GET['action']) && $_GET['action'] == 'clear-all'){
	$Logger -> clearAll();
	header('Location:'.$_SERVER['HTTP_REFERER']);
	exit;
}
?>