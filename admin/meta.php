<!---meta data -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?=CONFIG_ADMIN_TITLE?></title>
<meta name="robots" content="noindex,nofollow">

<!-- Favicon -->
<link rel="icon" href="<?=CONFIG_SITE_ROOT.'_upload/image/settings/icon-32/'.$SettingsAlbums->getCover(2)?>" sizes="32x32" type="image/png" />
<link rel="icon" href="<?=CONFIG_SITE_ROOT.'_upload/image/settings/icon-192/'.$SettingsAlbums->getCover(2)?>" sizes="192x192" type="image/png" />
<link rel="apple-touch-icon" href="<?=CONFIG_SITE_ROOT.'_upload/image/settings/icon-192/'.$SettingsAlbums->getCover(2)?>" />

<!-- Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

<!---include Css -->
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/jquery-ui-1.12.1/jquery-ui.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/plugin/lightGallery/dist/css/lightgallery.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/plugin/cropper/dist/cropper.min.css'?>" />

<!---include Javascript -->
<script>
var CONFIG_PLUPLOAD_SWF_URL = '<?=CONFIG_TOOLKIT_PATH.'plupload/js/Moxie.swf'?>';
var CONFIG_PLUPLOAD_XAP_URL = '<?=CONFIG_TOOLKIT_PATH.'plupload/js/Moxie.xap'?>';
var CONFIG_TOOLKIT_PATH = '<?=CONFIG_TOOLKIT_PATH?>';
var CONFIG_EDITOR_TOOLBAR = '<?=CONFIG_EDITOR_TOOLBAR?>';
var CONFIG_EDITOR_IMAGE_UPLOAD_FOLDER = '<?=CONFIG_EDITOR_IMAGE_UPLOAD_FOLDER?>';
var CONFIG_EDITOR_FILE_UPLOAD_FOLDER = '<?=CONFIG_EDITOR_FILE_UPLOAD_FOLDER?>';
var CONFIG_EDITOR_ADMIN_PATH = '<?=CONFIG_SERVER_ROOT?>';
</script>
<?php include_once('../combine.php'); ?>

<!-- Plupload -->
<?php if((isset($load_uploader) && $load_uploader) || CURRENT_PAGE == 'view.php' || CURRENT_PAGE == 'category_upload.php'){ ?>
<script src="<?=CONFIG_TOOLKIT_PATH.'plupload/js/plupload.full.min.js'?>"></script>
<?php }?>

<!-- Froala editor -->
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'fontawesome-5.13.0/css/all.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'froala-editor-3.2.6/css/froala_style.min.css'?>" />

<?php if((isset($load_editor) && $load_editor) || CURRENT_PAGE == 'edit.php'){ ?>
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'codemirror-5.29.0/lib/codemirror.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'tui-image-editor/css/tui-image-editor.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'tui-image-editor/css/tui-color-picker.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'froala-editor-3.2.6/css/third_party/image_tui.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'froala-editor-3.2.6/css/froala_editor.pkgd.min.css'?>" />
<script src="<?=CONFIG_TOOLKIT_PATH.'codemirror-5.29.0/lib/codemirror.js'?>"></script>
<script src="<?=CONFIG_TOOLKIT_PATH.'codemirror-5.29.0/mode/xml/xml.js'?>"></script> 
<script src="<?=CONFIG_TOOLKIT_PATH.'tui-image-editor/js/fabric.min.js'?>"></script>
<script src="<?=CONFIG_TOOLKIT_PATH.'tui-image-editor/js/tui-code-snippet.min.js'?>"></script>
<script src="<?=CONFIG_TOOLKIT_PATH.'tui-image-editor/js/tui-image-editor.min.js'?>"></script>
<script src="<?=CONFIG_TOOLKIT_PATH.'froala-editor-3.2.6/js/froala_editor.pkgd.min.js'?>"></script>
<script src="<?=CONFIG_TOOLKIT_PATH.'froala-editor-3.2.6/js/languages/zh_tw.js'?>"></script>
<script src="<?=CONFIG_TOOLKIT_PATH.'froala-editor-3.2.6/js/third_party/image_tui.min.js'?>"></script>
<?php }?>

<link rel="stylesheet" href="../_css/style.css" />
<link rel="stylesheet" href="../_css/responsive.css" />
<script src="../script.js"></script>