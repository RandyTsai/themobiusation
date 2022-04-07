<?php
//Databse configuration
define('CONFIG_DB_HOST', 'localhost');
define('CONFIG_DB_NAME', 'themobiusation');
define('CONFIG_DB_USER', 'root');
define('CONFIG_DB_PASS', '0000');

//Website Configuration
define('CONFIG_SITE_PROTOCOL',		(!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? 'https://' : 'http://');
define('CONFIG_SITE_ROOT', 			CONFIG_SITE_PROTOCOL.'localhost/demo/themobiusation/');
define('CONFIG_SERVER_ROOT', 		'/demo/themobiusation/');
define('CONFIG_ADMIN_TITLE', 		'THEMOBIUSATION');
define('CONFIG_ADMIN_IDENTIFIER', 	'dozen_admin');
define('CONFIG_ADMIN_LANG', 		'zh-tw');
define('CONFIG_ADMIN_SKIP_HOME', 	'project');
define('CONFIG_ADMIN_PATH', 		'admin/');
define('CONFIG_ADMIN_LANG_PATH', 	'admin/_lang/');
define('CONFIG_ADMIN_UPLOAD_PATH', 	'../../_upload/');
define('CONFIG_FRONT_LANG_PATH', 	'_lang/');
define('CONFIG_DEFAULT_DATA_LANG', 	'en');
define('CONFIG_CLASS_PATH', 		'/demo/_include/');
define('CONFIG_JS_PATH', 			'/demo/_js/');
define('CONFIG_TOOLKIT_PATH', 		'/demo/_toolkit/');
define('CONFIG_THUMB_ENGINE', 		'gd');
define('CONFIG_EDITOR_TOOLBAR', 	'Full'); //Full
define('CONFIG_EDITOR_IMAGE_UPLOAD_FOLDER', '/demo/themobiusation/_upload/editor/image/');
define('CONFIG_EDITOR_FILE_UPLOAD_FOLDER',  '/demo/themobiusation/_upload/editor/file/');
define('CONFIG_LOG_EXPIRATION', 	365);
define('CONFIG_SESSION_NAME', 		'__Secure-PHPSESSID');
define('CONFIG_TITLE_MARKUP', 		'div');

//Google recaptcha
define('RECAPTCHA_SITE_KEY', 	'6LdGSdYZAAAAAAMVC6G7Xn_Mg6IEynQlfIBmtU8B');
define('RECAPTCHA_SECRET_KEY', 	'6LdGSdYZAAAAAJoMTfPP6t-fibwbzuzgmw-dC2iQ');

//Google analytics
define('GA_ENABLED', 	false);
define('GA_TRACKING', 	'UA-10743710-1');
define('GA_ACCOUNT', 	'469239077020-et9ufs7fl69a08dff80jghbd6pfq5fmr@developer.gserviceaccount.com');
define('GA_KEYFILE', 	'../../../_include/gapi/oauthkeyfile.p12');
define('GA_TABLE_ID', 	'21671811');

//Google OAuth
define('OAUTH_CLIENT_ID', 		'185260183663-lqpnntokprh19mt2gbfr26uqt0ksovte.apps.googleusercontent.com');
define('OAUTH_CLIENT_SECRET', 	'eXZgJK8le9ORhYoBO-r5LZ7O');

//define('MEDIAWIKI_PATH', $_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'zhconverter/mediawiki-1.15.4/');

$module_enabled = array(
    'about'=>'About',
    'project'=>'Project',
    'gallery'=>'Photo gallery',
);

//Data language settings
$language_enabled = array('zh'=>'繁體中文', 'en'=>'English'); 

//Panel language settings
$available_language = array('zh-tw'=>'繁體中文','en-us'=>'English'); 
$template_language = 'en-us';

//Time-zone
date_default_timezone_set("Asia/Taipei");

//Encoding
mb_internal_encoding('UTF-8');

//Multi language url
$multi_lang_url = array(
	'zh-tw' => CONFIG_SITE_PROTOCOL.'localhost/demo/themobiusation/zh/',
	'en-us' => CONFIG_SITE_PROTOCOL.'localhost/demo/themobiusation/'
);

//Session
ini_set('session.cookie_httponly', 1);
ini_set('session.use_only_cookies', 1);
ini_set('session.cookie_secure', 1);
ini_set('session.cookie_samesite', 'Lax');

session_set_cookie_params(array(
	'HttpOnly' => 'true',
	'Secure' => 'true',
	'SameSite' => 'Lax' //none, lax, strict
)); 

session_name(CONFIG_SESSION_NAME);

if(!isset($_SESSION)){
	session_start();
}

$_SESSION['last_access'] = time(); //Keep session alive

$csp_resources = array(
	'*.google.com',
	'*.googleapis.com',
	'*.google-analytics.com',
	'*.gstatic.com',
	'*.doubleclick.net',
	'*.facebook.net',
	'*.fontawesome.com',
	'*.froala.com',
	'*.facebook.com',
	'*.youtube.com',
	'*.ytimg.com',
	'*.vimeo.com',
	'*.vimeocdn.com',
	'*.jsdelivr.net',
);

header("Strict-Transport-Security:max-age=63072000");
header("Content-Security-Policy: default-src 'self' data: blob: 'unsafe-inline' 'unsafe-eval' ".implode(' ', $csp_resources)."; img-src * data: blob: ;");
header("X-Frame-Options: SAMEORIGIN");
header("X-Content-Type-Options:nosniff");
header('X-XSS-Protection: 1; mode=block');
header("Referrer-Policy: strict-origin-when-cross-origin");
header("Permissions-Policy: camera=(), microphone=()");

?>