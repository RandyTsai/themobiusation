<?php
include_once('top.php');
include_once($_SERVER['DOCUMENT_ROOT'].CONFIG_CLASS_PATH.'gapi/gapi.class.php');

$GA = new Analytics(GA_ACCOUNT, GA_KEYFILE, GA_TABLE_ID);

$GA->max_results = 100;

if(isset($_GET['startdate']) && $_GET['startdate']!='')
	$GA->startdate = $_GET['startdate'];
	
if(isset($_GET['enddate']) && $_GET['enddate']!='')
	$GA->enddate = $_GET['enddate'];

$filter = NULL;
	
if(isset($_GET['u']) && $_GET['u']!=''){
	$filter = 'ga:pagePath=@'.trim($_GET['u']);
} 
?>

<div id="date">
          <?=$GA->viewReport($Lang->_('How many visitors recently visit my site?'), 
										array('date'), array('pageviews','visits'), '-date', $filter); ?>                                               
</div>
<div id="hour">
			 <?=$GA->viewReport($Lang->_('When are visitors visiting the site?'), 
										array('hour'), array('pageviews','visits'), 'hour', $filter);?>     
</div>
<div id="page">
            <?=$GA->viewReport($Lang->_('Which are the top viewing pages?'), 
										array('pagePath'), array('pageviews','visits'), '-visits', $filter);?>
</div>
<div id="spending">
            <?=$GA->viewReport($Lang->_('How long visitors spent on the page?'), 
										array('pagePath'), array('timeOnPage'), '-timeOnPage', $filter);?>
</div>
<div id="landing-page">
			<?=$GA->viewReport($Lang->_('From which page the visitor enters the site?'), 
										array('landingPagePath'), array('entrances'), '-entrances', $filter);?>  
</div>
<div id="guest">
            <?=$GA->viewReport($Lang->_('How many new visitors and returning visitors?'), 
										array('userType'), array('users'), '-users', $filter);?>  
</div>
<div id="reference">
            <?=$GA->viewReport($Lang->_('What are referrence page bring visitors to my site?'), 
										array('source'), array('pageviews','visits'), '-visits', $filter);?>
</div>
<div id="country">
            <?=$GA->viewReport($Lang->_('Where are visitors come from?'), 
										array('country'), array('pageviews','visits'), '-visits', $filter);?>
</div>
<div id="language">
            <?=$GA->viewReport($Lang->_('What are language of visitors browser?'), 
										array('language'), array('pageviews','visits'), '-visits', $filter);?>
</div>
<div id="browser">
            <?=$GA->viewReport($Lang->_('What browsers visitors to my site?'), 
										array('browser','browserVersion'), array('pageviews','visits'), '-visits', $filter);?>
</div>
<div id="os">
            <?=$GA->viewReport($Lang->_('What operation systems visitors to my site?'), 
										array('operatingSystem','operatingSystemVersion'), array('pageviews','visits'), '-visits', $filter);?>
</div>
<div id="resolution">
            <?=$GA->viewReport($Lang->_('What screen resolutions visitors to my site?'), 
										array('screenResolution'), array('pageviews','visits'), '-visits', $filter);?>
</div>
<?php
//$Lang->genTranslationFile();
?>