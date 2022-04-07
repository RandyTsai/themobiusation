<?php
$config['project'] = array(
	'use_category' 		=> true,
	'use_album' 		=> true,	
	'add_category' 		=> true,
	'edit_category'		=> true,
	'delete_category' 	=> true,	
	'add_article' 		=> true,
	'edit_article'		=> true,
	'delete_article' 	=> true,
	'view_article' 		=> true,
	'sort_article' 		=> true,
	'list_style' 		=> 'thumb-list',
	'list_order_by' 	=> 'ord ASC',
	'list_field' 		=> array('title'),
	'list_header' 		=> array(),
	'category_level' 	=> 1,
	'show_all'			=> true,
	'show_uncategory'	=> true,
	'edit_album'		=> true,
	'add_video'			=> true
);


$display_option = array(1 => $Lang->_('Show'),
						0 => $Lang->_('Hidden'));
					   
if($config['project']['use_category']){
$ProjectCategory = new Category($DB, 'dc_project_cat', 'dc_project');
$ProjectCategory -> addColumn(array('name'=>'title', 'type'=>'text', 'label'=>$Lang->_('Title'), 'input'=>'text', 'lang'=>$language_enabled));
$ProjectCategory->loadCatList();
}

$Project = new Articles($DB, 'dc_project');
if($config['project']['use_category']){
$Project -> addColumn(array('name'=>'category', 'type'=>'int', 'label'=>$Lang->_('Category'), 'input'=>'select', 
								'options'=>$ProjectCategory->outputOptions(0,0,$config['project']['show_uncategory'] ? array(0=>$Lang->_('Uncategory')) : array()), 'default'=>isset($_GET['category'])?$_GET['category']:'' ));
}
$Project -> addColumn(array('name'=>'title', 'type'=>'text', 'label'=>$Lang->_('Title'), 'input'=>'text', 'lang'=>$language_enabled));
$Project -> addColumn(array('name'=>'contents', 'type'=>'text', 'label'=>$Lang->_('Contents'), 'input'=>'textarea', 'richtext'=>true, 'lang'=>$language_enabled));
$Project -> addColumn(array('name'=>'display', 'type'=>'bool', 'label'=>$Lang->_('Display'), 'input'=>'radio', 'options'=>$display_option, 'default'=>1));


if($config['project']['use_album']){
	
$ProjectAlbums = new Albums2($DB, 'dc_project_attach');
$ProjectAlbums -> setThumbEngine(CONFIG_THUMB_ENGINE);
$ProjectAlbums -> type = 'image';
$ProjectAlbums -> limit_one = false;
$ProjectAlbums -> async = true;
$ProjectAlbums -> upload_path = CONFIG_ADMIN_UPLOAD_PATH.'image/project/';
$ProjectAlbums -> buttons = array(
		array('path'=>'process.php','label'=>$Lang->_('Cover'), 'params'=>'action=set-album-cover', 'class'=>'album-cover-button'),
		array('path'=>'process.php','label'=>$Lang->_('Download'), 'params'=>'action=download', 'class'=>'album-download-button'),
		array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=thumb/', 'class'=>'album-crop-button'),
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=thumb/,large/', 'class'=>'album-crop-button'),
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=*', 'class'=>'album-crop-button'),
		array('path'=>'process.php','label'=>$Lang->_('Remove'), 'params'=>'action=delete-album-item', 'class'=>'album-delete-button'),
	);
	
$ProjectAlbums -> addColumn(array('name'=>'alt', 'type'=>'text', 'label'=>$Lang->_('Description'), 'input'=>'text', 'lang'=>$language_enabled));

$ProjectAlbums -> addRule(array('folder' => 'thumb/', 'type' => 'fit', 'width' => 480, 'height' => 480));
$ProjectAlbums -> addRule(array('folder' => 'large/', 'type' => 'fit', 'width' => 1280, 'height' => 1280));
$ProjectAlbums -> addRule(array('folder' => 'original/', 'type' => 'resize', 'width' => NULL, 'height' => NULL, 'quality' => 100));

}
?>