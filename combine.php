<?php
$js_sources= array(
    CONFIG_JS_PATH.'jQuery/jquery-3.2.1.min.js',
    CONFIG_JS_PATH.'jQuery/plugin/flickity-2.2/flickity.pkgd.min.js',
    CONFIG_JS_PATH.'jQuery/plugin/flickity-2.2/flickity-fade.js',
    CONFIG_JS_PATH.'jQuery/plugin/masonry/masonry.pkgd.min.js',
    CONFIG_JS_PATH.'jQuery/plugin/masonry/imagesloaded.pkgd.min.js',
    //CONFIG_JS_PATH.'jQuery/plugin/jssocials/jssocials-fontawesome5.0.js',
    CONFIG_JS_PATH.'jQuery/plugin/lightGallery/dist/js/lightgallery.min.js',
    CONFIG_JS_PATH.'jQuery/plugin/lightGallery/modules/lg-video.min.js'
    //CONFIG_JS_PATH.'jQuery/plugin/headroom/headroom.min.js',
    //CONFIG_JS_PATH.'jQuery/plugin/hc-sticky/hc-sticky.js',
);

$combineJs = new Combine($js_sources);
$combineJs->root = $_SERVER['DOCUMENT_ROOT'];
$combineJs->mode  = 'combine';
//$combineJs->mode  = 'source';
$combineJs->type = 'js';
$combineJs->output();
?>