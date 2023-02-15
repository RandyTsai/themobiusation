<?php
include_once('_config/config.php');
include_once($_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'classes2/autoload.php');
//include_once($_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'phpmailer6/vendor/autoload.php');
//include_once($_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'zhconverter/mediawiki-zhconverter.inc.php');
include_once('func.php');


//Sanitize
foreach($_GET as $key => $val){
	$_GET[$key] = htmlspecialchars($val, ENT_QUOTES);
}

$_SERVER['PHP_SELF'] = htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES);
$_SERVER['REQUEST_URI'] = htmlspecialchars($_SERVER['REQUEST_URI'], ENT_QUOTES);

//Database initialization
try 
{
	$DB = new PDO('mysql:host='.CONFIG_DB_HOST.';dbname='.CONFIG_DB_NAME.';charset=utf8', CONFIG_DB_USER, CONFIG_DB_PASS);
	//$DB = new LoggedPDO('mysql:host='.CONFIG_DB_HOST.';dbname='.CONFIG_DB_NAME.';charset=utf8', CONFIG_DB_USER, CONFIG_DB_PASS);
	$DB->setAttribute(PDO::ATTR_PERSISTENT, false);
	$DB->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$DB->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
	$DB->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, 'SET NAMES utf8mb4');
	$DB->setAttribute(PDO::ATTR_STATEMENT_CLASS, array('EPDOStatement', array($DB)));
}
catch(PDOException $e)
{
   echo $e->getMessage();
}

//Current site root
$current_site_root = CONFIG_SITE_ROOT.(isset($_GET['lang'])?($_GET['lang'].'/'):'');

//Initialization language
if(isset($_GET['lang']) && $_GET['lang'] == 'zh'){
    $forced_language = 'zh-tw';
    $curr_lang = 'zh';
}else{
    $forced_language = 'en-us';
    $curr_lang = 'en';
}

$front_available_language = array('en-us'=>'English', 'zh-tw'=>'中文');
$FrontLang = new Lang($_SERVER['DOCUMENT_ROOT'].CONFIG_SERVER_ROOT.CONFIG_FRONT_LANG_PATH, $front_available_language, $template_language, $forced_language);
$FrontLang -> auto_write = false;

$Lang = new Lang($_SERVER['DOCUMENT_ROOT'].CONFIG_SERVER_ROOT.CONFIG_ADMIN_LANG_PATH, $available_language, $template_language, $forced_language);

//Include modules
include_once(CONFIG_ADMIN_PATH.'settings/meta.php');
include_once(CONFIG_ADMIN_PATH.'project/meta.php');
include_once(CONFIG_ADMIN_PATH.'about/meta.php');
$settings = $Settings -> getArticle(1);
?>

