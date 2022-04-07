<div id="toolbar">
	<ul>    
    	<?php if($adminInfo['category'] == 0){?>
        <li><a href="../account" <?=(CURRENT_FOLDER == 'account' && !in_array( basename($_SERVER['PHP_SELF']), array('profile.php','profile_edit.php')))?'class="active"':''?>><i class="far fa-user-circle"></i><?=$Lang->_('Admin')?></a></li>
        <li><a href="../analytics" <?=(CURRENT_FOLDER == 'analytics')?'class="active"':''?>><i class="far fa-chart-line"></i><?=$Lang->_('Analytics')?></a>
        <li><a href="../settings" <?=(CURRENT_FOLDER == 'settings')?'class="active"':''?>><i class="far fa-cog"></i><?=$Lang->_('Settings')?></a></li>
        <li><a href="../log" <?=(CURRENT_FOLDER == 'log')?'class="active"':''?>><i class="far fa-list-alt"></i><?=$Lang->_('Log')?></a></li>
        <?php }else{ ?>
		<li><a href="../account/profile.php" <?=(CURRENT_FOLDER == 'account' && in_array( basename($_SERVER['PHP_SELF']), array('profile.php','profile_edit.php')))?'class="active"':''?>><i class="far fa-user-circle"></i><?=$adminInfo['name']?></a></li>	
		<?php }?>
        
        <?php if(isset($Auth) && $Auth->isLogin()){?>
        <li><a href="../account/process.auth.php?action=logout"><i class="far fa-sign-out"></i><?=$Lang->_('Logout')?></a></li>        
        <?php }?>
        
    </ul>
</div>
