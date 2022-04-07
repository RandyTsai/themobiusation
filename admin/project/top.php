<?php
include_once('../../_config/config.php');
include_once('../top.php');
include_once('meta.php');

if($config['project']['use_category'] && !$config['project']['show_all'] && !isset($_GET['category'])){
	$first_category = reset($ProjectCategory->dataArray(array('order'=>'ord ASC')));
	$_GET['category'] = $first_category['id'];
}
?>