<?php
$config['gallery'] = array(
	'use_category' 		=> false,
	'use_album' 		=> true,	
	'add_category' 		=> true,
	'edit_category'		=> true,
	'delete_category' 	=> true,	
	'add_article' 		=> true,
	'edit_article'		=> false,
	'delete_article' 	=> false,
	'view_article' 		=> false,
	'sort_article' 		=> false,
	'list_style' 		=> 'thumb-list',
	'list_order_by' 	=> 'ord ASC',
	'list_field' 		=> array('title'),
	'list_header' 		=> array(),
	'category_level' 	=> 1,
	'show_all'			=> true,
	'show_uncategory'	=> true,
	'edit_album'		=> true,
	'add_video' 		=> true
);


$display_option = array(1 => $Lang->_('Show'),
						0 => $Lang->_('Hidden'));
					   
if($config['gallery']['use_category']){
$GalleryCategory = new Category($DB, 'dc_gallery_cat', 'dc_gallery');
$GalleryCategory -> addColumn(array('name'=>'title', 'type'=>'text', 'label'=>$Lang->_('Title'), 'input'=>'text', 'lang'=>$language_enabled));
$GalleryCategory->loadCatList();
}

$Gallery = new Articles($DB, 'dc_gallery');
if($config['gallery']['use_category']){
$Gallery -> addColumn(array('name'=>'category', 'type'=>'int', 'label'=>$Lang->_('Category'), 'input'=>'select', 
								'options'=>$GalleryCategory->outputOptions(0,0,$config['gallery']['show_uncategory'] ? array(0=>$Lang->_('Uncategory')) : array()), 'default'=>$_GET['category'] ));
}
$Gallery -> addColumn(array('name'=>'title', 'type'=>'text', 'label'=>$Lang->_('Title'), 'input'=>'text', 'lang'=>$language_enabled));
//$Gallery -> addColumn(array('name'=>'display', 'type'=>'bool', 'label'=>$Lang->_('Display'), 'input'=>'radio', 'options'=>$display_option, 'default'=>1));
//$Gallery -> addColumn(array('name'=>'contents', 'type'=>'text', 'label'=>$Lang->_('Contents'), 'input'=>'textarea', 'richtext'=>true, 'lang'=>$language_enabled));


if($config['gallery']['use_album']){
$GalleryAlbums = new Albums2($DB, 'dc_gallery_attach');
$GalleryAlbums -> setThumbEngine(CONFIG_THUMB_ENGINE);
$GalleryAlbums -> type = 'image';
$GalleryAlbums -> limit_one = false;
$GalleryAlbums -> async = true;
$GalleryAlbums -> upload_path = CONFIG_ADMIN_UPLOAD_PATH.'image/gallery/';
$GalleryAlbums -> buttons = array(
		array('path'=>'process.php','label'=>$Lang->_('Download'), 'params'=>'action=download', 'class'=>'album-download-button'),
		//array('path'=>'process.php','label'=>$Lang->_('Cover'), 'params'=>'action=set-album-cover', 'class'=>'album-cover-button'),
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=thumb/', 'class'=>'album-crop-button'),
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=thumb/,large/', 'class'=>'album-crop-button')
		//array('path'=>'crop_image.php','label'=>$Lang->_('Crop'), 'params'=>'folder=*', 'class'=>'album-crop-button')
		array('path'=>'process.php','label'=>$Lang->_('Remove'), 'params'=>'action=delete-album-item', 'class'=>'album-delete-button'),
);
$GalleryAlbums -> addColumn(array('name'=>'alt', 'type'=>'text', 'label'=>$Lang->_('Description'), 'input'=>'text', 'lang'=>$language_enabled));

$GalleryAlbums -> addRule(array('folder' => 'thumb/', 'type' => 'resize', 'height' => 200));
$GalleryAlbums -> addRule(array('folder' => 'large/', 'type' => 'fit', 'width' => 1024, 'height' => 768));
$GalleryAlbums -> addRule(array('folder' => 'original/', 'type' => 'resize', 'width' => NULL, 'height' => NULL, 'quality' => 100));
$GalleryAlbums -> addRule(array('folder' => 'hd/', 'type' => 'fit', 'width' => 1920, 'height' => 1920));
}
?>