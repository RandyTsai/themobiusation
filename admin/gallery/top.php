<?php
include_once('../../_config/config.php');
include_once('../top.php');
include_once('meta.php');

if($config['gallery']['use_category'] && !$config['gallery']['show_all'] && !isset($_GET['category'])){
	$first_category = reset($GalleryCategory->dataArray(array('order'=>'ord ASC')));
	$_GET['category'] = $first_category['id'];
}
?>