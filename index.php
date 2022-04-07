<?php

include_once('top.php');
include_once(CONFIG_ADMIN_PATH.'gallery/meta.php');


//SEO
setMeta();
?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('meta.php'); ?>
</head>

<body id="index" class="<?=($curr_lang=='zh')?'zh':'';?>">
	<div id="container">



    	<!--header-->
        <?php include('header.php')?>
        <!--header-->

		<!--nav-->
        <?php include('nav.php'); ?>
		<!--nav-->
        
        <!--cover-->
        <main id="cover">

            <div class="main-carousel">
                <?php
                $gallery = $GalleryAlbums->getItems(1);
                foreach ($gallery as $row){
                ?>
                   <div class="carousel-cell" style="background-image: url('_upload/image/gallery/hd/<?=$row['path']?>')" ></div>
                <?php } ?>
            </div>
            <div id="cover-mask"></div>
            <div id="intro">
                WE<br>
                COMPUTE DESIGN.<br>
                TANGIBLE DIGITAL FABRICATION.<br>
                SPATIAL DESIGNER / WEB DEVELOPER
            </div>
            <a id="enter" href="works/" class="button" >ENTER</a>

            <!--footer-->
            <?php include('footer.php'); ?>
            <!--footer-->

        </main>

        <!--main-->
        

        
    </div>
</body>
</html>