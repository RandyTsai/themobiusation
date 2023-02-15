<?php include_once('top.php'); ?>
<?php

if(isset($_GET['category']) && $_GET['category'] != ''){
	$projects = $Project->dataArray(array(
		'where'=>array('query'=>'display = 1 AND category = ?', 'params'=>array($_GET['category'])),
		'order'=>'ord ASC',
		'albums'=>$ProjectAlbums //select related album
	));

    $project_cate = $ProjectCategory->getArticle($_GET['category']);
    $project_cate_title = getLangData($project_cate,'title');
}else{
	$projects = $Project->dataArray(array(
		'where'=>'display = 1',
		'order'=>'ord ASC',
		'albums'=>$ProjectAlbums
	));

    $project_cate_title = $FrontLang->_('Projects');
}

/*$Project->dataArray(array(
        'where'=> 'id= 1',
        'order'=>'ord ASC',
        'albums'=>$ProjectAlbums
));*/


$about = $About->getArticle(1);

//SEO
setMeta($project_cate_title);
?>

<!DOCTYPE HTML>
<html>
<head>
<?php
    include_once('meta.php');
    $current_page = basename($_SERVER['PHP_SELF']);
?>
</head>

<body id="works" class="<?=($curr_lang=='zh')?'zh':'';?>">
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

                <?php if($current_page=='works.php' && $_GET['category']!=''){?>
                <div id="direct-back" class="button upper_case">
                    <span></span><a href="works/"><?= $FrontLang->_('Projects')?></a>
                </div>
                <?php }?>

                <div id="summary" class="fr-view">
                    <?=getLangData($about, contents)?>
                </div>
				<?php if(count($projects) > 0){?>
                <div id="work-list" class="masonry-grid">
                	<?php
                    $imgFolder = '_upload/image/project/thumb/';
					foreach($projects as $row){
						$title = htmlspecialchars(getLangData($row, 'title'), ENT_QUOTES);
                        $imgSize = getimagesize($imgFolder.$row['path']);
                        //echo $imgSize[0].' and '.$imgSize[1];
					?>
                    <div class="grid-item <?=$imgSize[0]>$imgSize[1]?'db_width':($imgSize[0]<$imgSize[1]?'db_height':'')?>">
                                                <!-- just judge the class size 'db_width':'db_height':none  -->
                    	<div class="thumb"><a href="detail/<?=$row['id']?>"><img src="<?=$imgFolder.$row['path']?>" alt="<?=$title?>" /></a></div>
                        <div class="title upper_case"><?=$title?></div>
                    </div>
                    <?php }?>
                    <div class="sizer"></div>
                </div>
                <?php }?>
                
            </div>
        </main>
        <!--main-->
        
        <!--footer-->
        <?php include('footer.php'); ?>
        <!--footer-->
        
    </div>
</body>
</html>