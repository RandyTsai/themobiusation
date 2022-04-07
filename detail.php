<?php

include_once('top.php');
include_once(CONFIG_ADMIN_PATH.'project/meta.php');



$cover = $ProjectAlbums->getCover($_GET['id']);

if(isset( $_GET['id']) && $_GET['id'] !=''  ){
    $project = $Project->getArticle($_GET['id']);
    $projectAlbum = $ProjectAlbums->getItems($_GET['id']);

}else{
    header('Location:'.$current_site_root);
}



//check whether project should be display
if(!$project['display']){
	header('Location:'.$current_site_root);
}


//for $prev/next button
$projects_id = array();
$current_index = false;
$count=0;
foreach( $Project->data(array('where'=>'display=1', 'order'=>'ord ASC')) as $row){
    $projects_id[] = $row['id'];
    if($row['id']==$_GET['id']){
        $current_index= $count;
    }
    $count++;

}

$prev = $current_index > 0 ? $projects_id[$current_index-1] : $projects_id[count($projects_id)-1];
$next = $current_index < count($projects_id)-1 ? $projects_id[$current_index+1] : $projects_id[0];


$prev_cate_name = '';
$prev_dir = basename(dirname($_SERVER['HTTP_REFERER']));
$prev_cate = basename($_SERVER['HTTP_REFERER']);
if($prev_dir=='works' && $prev_cate!=''){
    $proj_cate = $ProjectCategory->getArticle($prev_cate);
    $prev_cate_name = htmlspecialchars(getLangData( $proj_cate, 'title'), ENT_QUOTES);
}else{
    $prev_cate_name = $FrontLang->_('Projects');
}



//SEO
setMeta($project, $cover);



?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('meta.php'); ?>
</head>

<body id="detail" class="<?=($curr_lang=='zh')?'zh':'';?>">
	<div id="container">
    
    	<!--header-->
        <?php include('header.php'); ?>
        <!--header-->

		<!--nav-->
        <?php include('nav.php'); ?>
		<!--nav-->
        
        <!--main-->
        <main id="main-wrapper" class="wrapper">
        	<div id="main-inner" class="inner">
            	
                <?php
                $title = getLangData($project, 'title');
                $content = getLangData($project, 'contents');
                ?>
                <div id="direct-back" class="button upper_case">
                    <span></span><a href="<?= $_SERVER['HTTP_REFERER']?>"><?=$prev_cate_name?></a>
                </div>
                <div id="title">
                    <h2><?=$title?></h2>
                    <h3>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</h3>
                </div>

            	<div class="masonry-grid">
                    <div id="info" class="grid-item fr-view ">
                        <p><?=$content?></p>
                    </div>
                    <?php
                    $imgFolder = '_upload/image/project/large/';
                    foreach ($projectAlbum as $row){
                        $imgSize = getimagesize($imgFolder.$row['path']);
                        if($row['video_url']){
                    ?>
                            <div id="video-gallery" class="grid-item half-item">
                                <a href="<?=$row['video_url']?>" >
                                    <img data-width="<?=$imgSize[0]?>" src="<?=$imgFolder.$row['path']?>" alt="<?=$title?>" />
                                    <span class="play-btn"></span>
                                </a>

                            </div>
                        <?php }else{ ?>
                            <div class="grid-item">
                                <img data-width="<?=$imgSize[0]?>" src="<?=$imgFolder.$row['path']?>" alt="<?=$title?>" />
                            </div>
                        <?php } ?>

                    <?php } ?>
                    <div class="sizer"></div>

                </div>
                <div class="button switch-proj-btn ">
                    <a href="detail/<?=$prev?>/" id="detail-prev-button" ><?=$FrontLang->_('PREV')?></a>
                    <a href="detail/<?=$next?>/" id="detail-next-button" ><?=$FrontLang->_('NEXT')?></a>
                </div>



            </div>
        </main>
        <!--main-->
        
        <!--footer-->
        <?php include('footer.php'); ?>
        <!--footer-->
        
    </div>
</body>
</html>