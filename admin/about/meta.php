<?php
$config['about'] = array(
	'use_category' 		=> true,
	'use_category_album'=> true,
	'use_album' 		=> true,	
	'add_category' 		=> false,
	'edit_category'		=> true,
	'delete_category' 	=> false,	
	'add_article' 		=> true,
	'edit_article'		=> true,
	'delete_article' 	=> true,
	'view_article' 		=> true,
	'sort_article' 		=> true,
	'list_style' 		=> 'article-list',
	'list_order_by' 	=> 'ord ASC',
	'list_field' 		=> array('title', 'contents'),
	'list_header' 		=> array(),
	'category_level' 	=> 1,
	'show_all'			=> false,
	'show_uncategory'	=> false,
	'edit_album'		=> true,
	'add_video'			=> true
);


$display_option = array(1 => $Lang->_('Show'),
						0 => $Lang->_('Hidden'));
					   
if($config['about']['use_category']){
$AboutCategory = new Category($DB, 'dc_about_cat', 'dc_about');
$AboutCategory -> addColumn(array('name'=>'title', 'type'=>'text', 'label'=>$Lang->_('Title'), 'input'=>'text', 'lang'=>$language_enabled));
$AboutCategory->loadCatList();
}

$About = new Articles($DB, 'dc_about');
if($config['about']['use_category']){
$About -> addColumn(array('name'=>'category', 'type'=>'int', 'label'=>$Lang->_('Page'), 'input'=>'select', 
								'options'=>$AboutCategory->outputOptions(0,0, $config['about']['show_uncategory'] ? array(0=>$Lang->_('Uncategory')) : array()), 'default'=>isset($_GET['category'])?$_GET['category']:'' ));
}
$About -> addColumn(array('name'=>'title', 'type'=>'text', 'label'=>$Lang->_('Title'), 'input'=>'text', 'lang'=>$language_enabled));
$About -> addColumn(array('name'=>'contents', 'type'=>'text', 'label'=>$Lang->_('Contents'), 'input'=>'textarea', 'richtext'=>true, 'lang'=>$language_enabled));
$About -> addColumn(array('name'=>'display', 'type'=>'bool', 'label'=>$Lang->_('Display'), 'input'=>'radio', 'options'=>$display_option, 'default'=>1));


if($config['about']['use_album'] || $config['about']['use_category_album']){
	
$AboutAlbums = new Albums2($DB, 'dc_about_attach');
$AboutAlbums -> setThumbEngine(CONFIG_THUMB_ENGINE);
$AboutAlbums -> type = 'image';
$AboutAlbums -> limit_one = false;
$AboutAlbums -> async = true;
$AboutAlbums -> upload_path = CONFIG_ADMIN_UPLOAD_PATH.'image/about/';
$AboutAlbums -> buttons = array(
		array('path'=>'process.php','label'=>$Lang->_('Download'), 'params'=>'action=download', 'class'=>'album-download-button'),
		//array('path'=>'process.php','label'=>$Lang->_('Cover'), 'params'=>'action=set-album-cover', 'class'=>'album-cover-button'),
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=thumb/', 'class'=>'album-crop-button'),
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=thumb/,large/', 'class'=>'album-crop-button'),
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=*', 'class'=>'album-crop-button'),
		array('path'=>'process.php','label'=>$Lang->_('Remove'), 'params'=>'action=delete-album-item', 'class'=>'album-delete-button'),
	);
	
$AboutAlbums -> addColumn(array('name'=>'alt', 'type'=>'text', 'label'=>$Lang->_('Description'), 'input'=>'text', 'lang'=>$language_enabled));

$AboutAlbums -> addRule(array('folder' => 'thumb/', 'type' => 'fit', 'width' => 360, 'height' => 360));
$AboutAlbums -> addRule(array('folder' => 'large/', 'type' => 'fit', 'width' => 1280, 'height' => 1280));
$AboutAlbums -> addRule(array('folder' => 'original/', 'type' => 'resize', 'width' => NULL, 'height' => NULL, 'quality' => 100));

}
?>