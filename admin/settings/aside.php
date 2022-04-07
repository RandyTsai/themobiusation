<aside id="aside">
	<div class="aside-set">
		<ul>
    		<li <?=!$_GET['page'] || $_GET['page'] == 1?'class="active"':''?>><a href="index.php?page=1"><?=$Lang->_('Contact information')?></a></li>
        	<li <?=$_GET['page']==2?'class="active"':''?>><a href="index.php?page=2"><?=$Lang->_('Mail settings')?></a></li>
        	<li <?=$_GET['page']==3?'class="active"':''?>><a href="index.php?page=3"><?=$Lang->_('Website settings')?></a></li>
    	</ul>
    </div>
</aside>