<?php include_once('top.php'); ?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
</head>

<body>
	<div id="container">
    	<?php include_once('../header.php'); ?>        
		<?php include_once('../nav.php'); ?>
        <?php include_once('../toolbar.php'); ?>
        <?php include_once('aside.php'); ?>
        <div id="content">
        	<div id="banner">
        		<?php include_once('buttons.php'); ?>
        		<?php include_once('../lang.php'); ?>
            </div>
            <div class="tips">
            	<?=$Lang->_('Tips').' : '.$Lang->_('Drag items to sort')?>
            </div>
            <div id="nested-sort-list" class="title-list" data-sort-level="<?=$config['account']['category_level']?>">
				<?php
					$button = array();
					
					if($config['account']['edit_category'])
						array_push($button, array('path'=>'category_edit.php','label'=>$Lang->_('Edit')));
					
					if($config['account']['delete_category'])
						array_push($button, array('path'=>'process.php', 'param'=>'action=delete-category', 'label'=>$Lang->_('Delete')));
				?>
				<?=$AdminGroup->outputTree(0, array('button' => $button))?>
            </div>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>