<?php if($language_enabled && count($language_enabled) > 1){?>
<div id="lang-menu">
   <?php foreach($language_enabled as $key => $val){ ?>
   <a href="#" title="<?=$key?>" ><span><?=$val?></span></a>
   <?php }?>
</div>
<?php }?>

