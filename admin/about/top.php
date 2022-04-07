<?php
include_once('../../_config/config.php');
include_once('../top.php');
include_once('meta.php');

if($config['about']['use_category'] && !$config['about']['show_all'] && !isset($_GET['category'])){
	$first_category = reset($AboutCategory->dataArray(array('order'=>'ord ASC')));
	$_GET['category'] = $first_category['id'];
}
?>