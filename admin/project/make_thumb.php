<?php
$no_restrict = true;
include_once('top.php');

$folder = getcwd();
function onend() {
	global $folder;
	global $ProjectAlbums;
	@unlink($folder.'/'.$ProjectAlbums->async_lock_file);
}
register_shutdown_function('onend');


ob_end_clean();
header("Connection: close");
ignore_user_abort();
set_time_limit(0);


$ref_url = parse_url($_SERVER['HTTP_REFERER']);
$site_url = parse_url(CONFIG_SITE_ROOT);

//Check for same domain and lock file. 
//lock file should be created if process is called from Albums class.
if($ref_url['host'] == $site_url['host'] && file_exists($ProjectAlbums->async_lock_file)){
	while($ProjectAlbums->asyncPendingNum() > 0){		
		$ProjectAlbums->asyncMakeThumb();
	}
}
?>