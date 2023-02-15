<?php
$current_page = basename($_SERVER['PHP_SELF']);

//如何讓parent li也亮起來
//中文 的時候filter沒有作用  li也沒有active

?>

<nav id="nav-wrapper" class="wrapper">
	<div id="nav-inner" class="inner">
		<div id="menu-btn" class="inner upper_case">
			<div><?= $FrontLang->_('Menu') ?><span></span></div>
		</div>
		<ul class="upper_case">
			<!--output the rest of li by category-->
            <?php
            $top_category = $ProjectCategory->dataArray(  array('where'=>'parent = 0', 'order'=>'ord ASC') );
            foreach( $top_category as $top ){
                $sub_category = $ProjectCategory->dataArray( array('where'=>'parent='.$top['id'], 'order'=>'ord ASC') );
                /*print_r($sub_category);*/
                if( count($sub_category)>0 ){
                    ?>
					<li class="has-child"><?=htmlspecialchars(getLangData($top, 'title'), ENT_QUOTES)?><span></span>
						<div class="foldatble">
							<ul class="sub-cat">
                                <?php foreach($sub_category as $sub){ ?>
									<li class="<?= ($current_page=='works.php') && ($_GET['category']==$sub['id'])?'active':''?>"><a href="works/<?= $sub['id']?>/"><?= htmlspecialchars(getLangData($sub, 'title'), ENT_QUOTES) ?></a></li>
                                <?php } ?>
							</ul>
						</div>
					</li>
                <?php }else{ ?>
					<li class="<?= ($current_page=='works.php') && ($_GET['category']==$top['id'])?'active':''?>"><a href="works/<?= $top['id']?>/"><?=htmlspecialchars(getLangData($top, 'title'), ENT_QUOTES)?></a></li>
                <?php } ?>
            <?php } ?>
			<!--output the rest of li by category-->

			<!-- the last li : language button-->
			<li class="tools flex">

                <?php $actual_link = CONFIG_SITE_ROOT.preg_replace( '/'.preg_quote(CONFIG_SERVER_ROOT, '/').'/', '', $_SERVER['REQUEST_URI'], 1); ?>
                <?php if($forced_language == 'en-us'){
                    $url = str_replace($multi_lang_url['en-us'], $multi_lang_url['zh-tw'], $actual_link); ?>
					<a href="<?=$url?>">中文</a>
                <?php }else{
                    $url = str_replace($multi_lang_url['zh-tw'], $multi_lang_url['en-us'], $actual_link); ?>
					<a href="<?=$url?>">EN</a>
                <?php }?>

				<a class="fb" href="#"><i class="fab fa-facebook-f"></i></a>
			</li>
			<!-- the last li : language button-->
		</ul>


	</div>
</nav>