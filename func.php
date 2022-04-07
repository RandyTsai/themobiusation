<?php
function getLangData($row, $field, $use_alternative = true){
	
	global $FrontLang;
	
	$current_lang = $FrontLang->getCurrentLanguage();
	$current_lang = explode('-', $current_lang);
	$lang   = $current_lang[0];
	$locale = $current_lang[1];

	$data = $row[$field.'_'.$lang];
	
	if($data != ''){
		if($locale == 'cn' && class_exists('MediaWikiZhConverter')){
			return MediaWikiZhConverter::convert($data, 'zh-cn');
		}else{
			return $data;
		}
	}else{
		if($use_alternative && $lang != CONFIG_DEFAULT_DATA_LANG ){
			return $row[$field.'_'.CONFIG_DEFAULT_DATA_LANG];
		}
	}
	
	return '';
}

function getLanguageUrl($lang){
	
	global $forced_language;
	global $multi_lang_url;
	
	$full_url = CONFIG_SITE_PROTOCOL . $_SERVER['HTTP_HOST']. $_SERVER['REQUEST_URI'];
	
	return str_replace($multi_lang_url[$forced_language] , $multi_lang_url[$lang], $full_url);
}

function substrHtml($value, $limit = 100, $more_symbol = ''){
	
	$value = html_entity_decode($value);
	
    if (mb_strwidth($value, 'UTF-8') <= $limit) {
        return $value;
    }

    // Strip text with HTML tags, sum html len tags too.
    // Is there another way to do it?
    do {
        $len          = mb_strwidth($value, 'UTF-8');
        $len_stripped = mb_strwidth(strip_tags($value), 'UTF-8');
        $len_tags     = $len - $len_stripped;

        $value = mb_strimwidth($value, 0, $limit + $len_tags, '', 'UTF-8');
    } while ($len_stripped > $limit);

    // Load as HTML ignoring errors
    $dom = new DOMDocument();
    @$dom->loadHTML('<?xml encoding="utf-8" ?>'.$value, LIBXML_HTML_NODEFDTD);

    // Fix the html errors
    $value = $dom->saveHtml($dom->getElementsByTagName('body')->item(0));

    // Remove body tag
    $value = mb_strimwidth($value, 6, mb_strwidth($value, 'UTF-8') - 13, '', 'UTF-8'); // <body> and </body>
    // Remove empty tags
	$value = preg_replace('/<(\w+)\b(?:\s+[\w\-.:]+(?:\s*=\s*(?:"[^"]*"|"[^"]*"|[\w\-.:]+))?)*\s*\/?>\s*<\/\1\s*>/', '', $value);
	
	//Add more symbol
	if($more_symbol){
		$value .= $more_symbol;
	}
	
    return $value;
}


function setMeta( $data = '', $image = '' ){
	
	global $current_site_root;
	global $settings;
	global $meta_title;
	global $meta_keywords;
	global $meta_description;
	global $meta_image;
	global $SettingsAlbums;
	
	if(is_array($data)){ //is array
		
		$meta_title = (getLangData($data, 'meta_title') ? getLangData($data, 'meta_title') : getLangData($data, 'title')).' | '.getLangData($settings, 'meta_title');
		$meta_keywords = getLangData($data, 'meta_keywords') ? getLangData($data, 'meta_keywords') : getLangData($settings, 'meta_keywords');
		$meta_description = getLangData($data, 'meta_description') ? getLangData($data, 'meta_description') : (getLangData($data, 'summary') ? getLangData($data, 'summary') : (getLangData($data, 'contents') ? substrHtml(getLangData($data, 'contents'), 200, '...') : getLangData($settings, 'meta_description')));
		
	}else if($data != ''){ //is string
		
		$meta_title = $data.' | '.getLangData($settings, 'meta_title');
		$meta_keywords = getLangData($settings, 'meta_keywords');
		$meta_description = getLangData($settings, 'meta_description');
		
	}else{
		
		$meta_title = getLangData($settings, 'meta_title');
		$meta_keywords = getLangData($settings, 'meta_keywords');
		$meta_description = getLangData($settings, 'meta_description');
		
	}
	
	$meta_title = strip_tags($meta_title);
	$meta_keywords = strip_tags($meta_keywords);
	$meta_description = strip_tags($meta_description);
	
	$cover = $SettingsAlbums->getCover(1);
	
	if($image != ''){
		$meta_image = $image;
	}else if($cover){
		$meta_image = $current_site_root.'_upload/image/settings/large/'.$cover;
	}else if(file_exists('image/cover.jpg')){
		$meta_image = $current_site_root.'image/cover.jpg';
	}
	
}
?>