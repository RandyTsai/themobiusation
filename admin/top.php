<?php
include_once($_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'classes2/autoload.php');
include_once($_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'readability/vendor/autoload.php');
include_once($_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'phpmailer6/vendor/autoload.php');
include_once('../func.php');

//Sanitize
foreach($_GET as $key => $val){
	$_GET[$key] = htmlspecialchars($val, ENT_QUOTES);
}

$_SERVER['PHP_SELF'] = htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES);
$_SERVER['REQUEST_URI'] = htmlspecialchars($_SERVER['REQUEST_URI'], ENT_QUOTES);

//Path
$current_path = explode('/',$_SERVER['PHP_SELF']);
define('CURRENT_FOLDER', $current_path[count($current_path)-2]);
define('CURRENT_PAGE', basename($_SERVER['PHP_SELF']));

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

//Auth & Restrict
$Auth = new Auth($DB, 'dc_admin', 'dc_admin_cat');
$Auth -> session_identifier = CONFIG_ADMIN_IDENTIFIER;
$Auth -> module = $module_enabled;

$adminInfo = $Auth -> getUserInfo();

if(!(isset($no_restrict) && $no_restrict === true)){
	include_once('../account/restrict.php'); 
}

//Language
$Lang = new Lang($_SERVER['DOCUMENT_ROOT'].CONFIG_SERVER_ROOT.CONFIG_ADMIN_LANG_PATH , $available_language, $template_language, CONFIG_ADMIN_LANG);
$Lang -> auto_write = false;
	
//Logger
$Logger = new Logger($DB, 'dc_log');
$Logger -> session_identifier = CONFIG_ADMIN_IDENTIFIER;
$Logger -> expiration = CONFIG_LOG_EXPIRATION;
$Logger -> time_column = 'create_time';
$Logger -> time_write = false;

//Keep session alive
updateSession();

//Store current category and sorting status
storeCategorySortStatus();

//Include settings module for favicon
include_once('../settings/meta.php');

?>