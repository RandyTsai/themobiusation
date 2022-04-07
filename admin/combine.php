<?php

$js_sources= array(
	CONFIG_JS_PATH.'jQuery/jquery-3.2.1.min.js',
	CONFIG_JS_PATH.'jQuery/jquery-migrate/jquery-migrate-1.4.1.min.js',
	CONFIG_JS_PATH.'jQuery/jquery-ui-1.12.1/jquery-ui.min.js',
	CONFIG_JS_PATH.'jQuery/plugin/jquery.ui.touch-punch/jquery.ui.touch-punch.min.js',
	CONFIG_JS_PATH.'jQuery/plugin/nestedSortable/jquery.ui.nestedSortable.js',
	CONFIG_JS_PATH.'jQuery/plugin/lightGallery/dist/js/lightgallery.min.js',
	CONFIG_JS_PATH.'jQuery/plugin/lightGallery/modules/lg-video.min.js',
	CONFIG_JS_PATH.'jQuery/plugin/cropper/dist/cropper.min.js',
	CONFIG_JS_PATH.'jQuery/plugin/hc-sticky/dist/hc-sticky.js',
	CONFIG_JS_PATH.'jQuery/plugin/Readmore/readmore.min.js'
);

$combineJs = new Combine($js_sources);
$combineJs->root = $_SERVER['DOCUMENT_ROOT'];
$combineJs->mode = 'combine';
//$combineJs->mode = 'source';
$combineJs->type = 'js';
$combineJs->output = '../combine.js';
$combineJs->output();

?>