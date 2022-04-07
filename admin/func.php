<?php
function genListQuery($config, $category, $param = 'category', $find_in_set = false){
	
	$where = '';
	$order = '';
	
	//Where
	if(($config === true || $config['use_category']) && isset($_GET[$param]) && $_GET[$param] != ''){//Select by category
			
			if($_GET[$param]=='all'){
				
				$query = '';
				$params = array();
				
			}else if($_GET[$param]=='uncategory'){
				
				$query = $param.' IS NULL';
				$params = array();
				
			}else{
				
				if(!$find_in_set){
					$query = $param.' = ? ';
				}else{
					$query = 'FIND_IN_SET(?, '.$param.')';
				}
			
				$params = array($_GET[$param]);
					
				if($_GET[$param] != 0){ //Because 0 means uncategory NOT the top-root in category tree.
					$subId = $category->getSubTreeId($_GET[$param]);
					if(!$find_in_set){
						foreach($subId as $val){
							$query .= ' OR '.$param.' = ? ';
							$params[] = $val;
						}
					}else{
						foreach($subId as $val){
							$query .= ' OR FIND_IN_SET(?, '.$param.')';
							$params[] = $val;
						}
					}
				}
			
			}
			
			$where = array('query'=>$query, 'params'=>$params);
			
	}
	
	//Search
	if(is_array($param) && count($param) > 0){
		
		$query_array = array();
		$params = array();
		
		foreach($param as $key => $val){
			$query_array[] = 'LOWER('.$key.') LIKE ?';	
			$params[] = '%'.strtolower($val).'%';
		}
		
		$query = implode(' OR ', $query_array);
		$where = array('query'=>$query, 'params'=>$params);
	}
	
	//Order
	if(isset($_GET['sortby'])){
		if($_GET['sortby'] != $_SESSION['sort']['field']){
			$_SESSION['sort']['order'] = 'ASC';
		}else{
			$_SESSION['sort']['order'] = ($_SESSION['sort']['order'] == 'ASC')?'DESC':'ASC';
		}
		$_SESSION['sort']['field'] = $_GET['sortby'];
	}

	if(isset($_SESSION['sort']) && $_SESSION['sort']['field'] != '' && $_SESSION['sort']['order'] != ''){
		$order = $_SESSION['sort']['field'].' '.$_SESSION['sort']['order'];
	}else{
		$order = $config['list_order_by'];
	}

	
	return array('where'=>$where, 'order'=>$order);
}

function storeCategorySortStatus(){
	
	if(!strpos($_SERVER['REQUEST_URI'],'.php') || (isset($_GET['category']) && $_GET['category'] == 'all')){
		unset($_GET['category']);	
		unset($_SESSION['curr_category']);
	}else if(isset($_GET['category'])){
		$_SESSION['curr_category'] = $_GET['category'];
	}else if(isset($_SESSION['curr_category'])){
		$_GET['category'] = $_SESSION['curr_category'];
	}
	
	if(!strpos($_SERVER['REQUEST_URI'],'.php')){
		unset($_SESSION['search']);
		unset($_SESSION['sort']);
	}

}

function getAutoCompleteWords($article){
	
	$term = trim(strip_tags($_GET['term']));
	
	$result = $article->data(array('where'=>array('query'=>$_GET['field'].' LIKE ?', 'params'=>array('%'.$term.'%')), 'field' => array($_GET['field']) ));
	$words = array();
	
	foreach($result as $row){
		$items = explode(',',$row[$_GET['field']]);
		foreach($items as $item){
			$val = trim($item);
			if(!in_array($val, $words) && stristr($val, $term)){
				array_push($words, $val);	
			}
		}
	}
	
	//$words = array('Apple','A fly','Babi', 'Cat', 'Candy');
	return $words;
	
}

function genMailBody($config = array()){
	
	global $Settings;
	
	$defaults = array(
		'template'	=> '',
		'subject' 	=> '',
		'header' 	=> '',
		'content' 	=> '',
		'footer' 	=> '',
		'unsubscribe' => false
	);
	
	$config = array_merge($defaults, $config);
	
	
	if($config['template'] != ''){
		$message = file_get_contents($config['template']);
	}else{
		$message = file_get_contents($_SERVER['DOCUMENT_ROOT'].CONFIG_SERVER_ROOT.CONFIG_ADMIN_PATH.'_template/email-inlined.html');
	}
	
	$settings = $Settings->getArticle(1);
	
	if($config['header'] == ''){
		$config['header'] = $settings['mail_header'];
	}
	
	if($config['footer'] == ''){
		$config['footer'] = $settings['mail_signature'];
	}
	
	if($config['subject'] != ''){
		$message = str_replace('{{subject}}', $config['subject'], $message);
	}
	
	if($config['header'] != ''){
		$message = str_replace('{{header}}', $config['header'], $message);
	}
	
	if($config['content'] != ''){
		$message = str_replace('{{content}}', $config['content'], $message);
	}
	
	if($config['footer'] != ''){
		$message = str_replace('{{footer}}', $config['footer'], $message);
	}
	
	if($config['unsubscribe'] != ''){
		$message = str_replace('<!--{{unsubscribe}}-->&nbsp;', '<div style="text-align:center;padding:10px 0;"><a href="{{unsubscribe}}" target="_blank" style="text-decoration:none;color:#777; font-size:12px;">Unsubscribe</a></div>', $message);
	}
	
	return $message;
	
}

function sendMail($config = array()){
	
	global $Settings;
	global $MailTask;
	global $Mailer;
	
	$defaults = array(
		'sender' 		=> '',
		'receiver' 		=> '',
		'from' 			=> '',
		'subject' 		=> '',
		'body' 			=> '',
		'cc' 			=> '',
		'debug' 		=> 0,
		'delay' 		=> 0,
		'tracking_id'  	=> ''
	);
	
	$config = array_merge($defaults, $config);
	
	if($config['sender'] == '' || $config['receiver'] == ''){
		return false;
	}
	
	$settings = $Settings->getArticle(1);
	
	//Bulk mail
	if($config['delay'] && isset($MailTask)){
		
		$data = array(
			'sender' 		=> $config['sender'],
			'receiver' 		=> is_array($config['receiver']) ? implode(',', $config['receiver']) : $config['receiver'],
			'mailfrom' 		=> $config['from'],
			'subject' 		=> $config['subject'],
			'body' 			=> $config['body'],
			'cc' 			=> is_array($config['cc']) ? implode(',', $config['cc']) : $config['cc'],
			'bcc' 			=> is_array($config['bcc']) ? implode(',', $config['bcc']) : $config['bcc'],
			'tracking_id' 	=> $config['tracking_id']
		);
		
		$exist = $MailTask->getArticleNum(array(
			'query' => 'receiver = ? AND subject = ? AND body = ?',
			'params' => array($data['receiver'], $data['subject'], $data['body'])
		));
		
		if($exist <= 0){
			$MailTask->insert($data);
		}
		
		return true;
	}
	
	//Mailer initialize
	if(!isset($Mailer)){
		
		$Mailer = new PHPMailer\PHPMailer\PHPMailer();
	
		if($settings['smtp_status'] == 1){
		
			$Mailer->isSMTP();
			$Mailer->SMTPDebug = $config['debug'];
			$Mailer->Debugoutput = 'html';
			$Mailer->Host = $settings['smtp_host'];
			$Mailer->Port = $settings['smtp_port'];
			$Mailer->SMTPSecure = $settings['smtp_secure'];
			$Mailer->SMTPAuth = true;
			$Mailer->AuthType = $settings['smtp_auth_type'];
			$Mailer->Username = $settings['smtp_account'];
			$Mailer->Password = $settings['smtp_password'];
			$Mailer->SMTPKeepAlive = true;
		
			if($settings['smtp_auth_type'] == 'XOAUTH2'){
			
				//Create a new OAuth2 provider instance
				$provider = new League\OAuth2\Client\Provider\Google(array(
        			'clientId' => OAUTH_CLIENT_ID,
        			'clientSecret' => OAUTH_CLIENT_SECRET,
    			));
			
				//Pass the OAuth provider instance to PHPMailer
				$Mailer->setOAuth(
    				new PHPMailer\PHPMailer\OAuth(array(
            			'provider' => $provider,
            			'clientId' => OAUTH_CLIENT_ID,
           		 		'clientSecret' => OAUTH_CLIENT_SECRET,
            			'refreshToken' => $settings['oauth_refresh_token'],
            			'userName' => $settings['smtp_account'],
        			))
				);

			}
 
		}else{
			$Mailer->isMail();
		}
		
	}else{
		
		$Mailer->clearAllRecipients();
		$Mailer->clearAddresses();
		$Mailer->clearBCCs();
		$Mailer->clearCCs();
		$Mailer->clearReplyTos();
    	$Mailer->clearAttachments();
	
	}
	
	
	//Tracking
	if($config['tracking_id'] != ''){
		
		$tracking_host = CONFIG_SITE_ROOT.'tracking/';
		$receivers = is_array($config['receiver']) ? implode(',',$config['receiver']) : $config['receiver'];
		
		//Open action
		$tracking_url = $tracking_host.'?type=open&id='.$config['tracking_id'].'&email='.$receivers.'&rand='.rand(1000, 9999);
		$part = explode('</body>', $config['body']);
		$config['body'] = $part[0].'<img src="'.$tracking_url.'" /></body>'.$part[1];
		
		//Click action
		preg_match_all('/<a[^>]*href="([^"]*)"/i', $config['body'], $matches);
	
    	if (isset($matches[0])){
			foreach ($matches[0] as $index=>$link){
				
				$url = $matches[1][$index];
				
				if(strpos($url, 'unsubscribe') !== false || $url == '#'){
					continue;
				}
						
				$new_url = $tracking_host.'?type=click&id='.$config['tracking_id'].'&email='.$receivers.'&url='.$url;
				$config['body'] = str_replace($url, $new_url, $config['body']);
			}
		}
		
	}
	
	//Embed images
    preg_match_all('/<img[^>]*src="([^"]*)"/i', $config['body'], $matches);
		
    if (isset($matches[0])){
		foreach ($matches[0] as $index=>$img){
			
        	$id = 'img'.$index;
        	$src = $matches[1][$index];
			
			if(strpos($src, 'http') !== false){
				continue;
			}else if(strpos($src, '../') !== false){ //for relative path
				$sys_src = $_SERVER['DOCUMENT_ROOT'].CONFIG_SERVER_ROOT.CONFIG_ADMIN_PATH.str_replace('../', '', $src);
				$Mailer->AddEmbeddedImage($sys_src, $id);
			}else if(strpos($src, $_SERVER['DOCUMENT_ROOT']) === false){ //for absolute path
				$sys_src = $_SERVER['DOCUMENT_ROOT'].CONFIG_SERVER_ROOT.ltrim($src, CONFIG_SERVER_ROOT);
				$Mailer->AddEmbeddedImage($sys_src, $id);
			}else{
				$Mailer->AddEmbeddedImage($src, $id);
			}
        	
        	$config['body'] = str_replace($src,'cid:'.$id, $config['body']);
    	}
	}
	
	$Mailer->isHTML(true);
	$Mailer->CharSet = 'UTF-8';
	$Mailer->setFrom($config['sender'], $config['from']);
	$Mailer->addReplyTo($config['sender'], $config['from']);
	$Mailer->Subject = $config['subject'];
	$Mailer->msgHTML($config['body']);
	
	if(is_array($config['receiver'])){
		foreach($config['receiver'] as $rec){
			$Mailer->AddAddress($rec);
		}
	}else{
		$Mailer->AddAddress($config['receiver']);
	}
	
	if(is_array($config['cc'])){
		foreach($config['cc'] as $rec){
			$Mailer->AddCC($rec);
		}
	}else if($config['cc'] != ''){
		$Mailer->AddCC($config['cc']);
	}
	
	if(is_array($config['bcc'])){
		foreach($config['bcc'] as $rec){
			$Mailer->AddBCC($rec);
		}
	}else if($config['bcc'] != ''){
		$Mailer->AddBCC($config['bcc']);
	}
	
	// Send the email
	if(!$Mailer->Send()) {
		
		if($settings['smtp_status'] == 1){
			$Mailer->getSMTPInstance()->reset();
		}
		
 		//echo "Mailer Error: " . $Mailer->ErrorInfo;
		return false;
		
	}else{
		
		return true;
		
	}
}


function extractArticle($url){
	
	$readability = new andreskrey\Readability\Readability(new andreskrey\Readability\Configuration());

	$html = file_get_contents($url);

	try {
    	$readability->parse($html);
		
		$feature_image = $readability->getImage();
		if(!isImage($feature_image)){
			foreach($readability->getImages() as $img){
				if(isImage($img)){
					$feature_image = $img;
					break;
				}
			}
		}
		
    	return array(
			'title'=>$readability->getTitle(),
			'content'=>$readability->getContent(),
			'summary'=>$readability->getExcerpt(),
			'feature_image'=>$feature_image,
			'images'=>$readability->getImages(),		
			'author'=>$readability->getAuthor()
		);
	} catch (ParseException $e) {
    	echo sprintf('Error processing text: %s', $e->getMessage());
	}
	
	return false;
		
}

function isImage($pathToFile)
{
  if( false === exif_imagetype($pathToFile) )
   return FALSE;

   return TRUE;
}

function updateSession(){
	$_SESSION['last_access'] = time();
}
?>