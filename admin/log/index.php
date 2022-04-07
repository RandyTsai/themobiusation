<?php
include_once('top.php');

$where = '';

if(isset($_GET['range']) && $_GET['range'] != ''){
	$first_date = $_GET['range'].'-01';
	$where = array('query'=>'create_time BETWEEN ? AND LAST_DAY(?)', 'params'=>array($first_date, $first_date));
}
?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
<style>
select#range	{ font-size:1.1em; width:140px; height:30px; padding:0 5px; }
[data-col="createdate"] { width:164px; }
[data-col="message"] { word-break:break-all; width:420px; padding-right:30px !important; position:relative; }
[data-col="message"] .more,
[data-col="message"] .less { position:absolute; right:0; top:12px; display:inline-block; width:16px; height:16px; line-height:16px; text-align:center;  }
</style>
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
            </div>
            <ul id="log-list" class="<?=$config['log']['list_style']?>">
				<?=$Log->listArticles(array(
											'where' => $where,
											'order' => $config['log']['list_order_by'],
											'field' => $config['log']['list_field'],
											'header' => $config['log']['list_header'],
											'str_length' => 1000
											));
				?>
            </ul>
            <div class="pagination">
            	<?php 
					$pagination = $Log->getPageNav();
					if($pagination){
						$pagination->show();
					}
				?>
            </div>
            <?php /*if($Logger->getRecordNum() > 0){ ?>
            <div class="buttons">
            	<a href="process.php?action=clear-all" class="button"><?=$Lang->_('Clear all')?></a>
            </div>
            <?php }*/ ?>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>
<script>
$('select#range').change(function(){
	if($(this).val()){
		window.location.href = 'index.php?range='+$(this).val();
	}else{
		window.location.href = 'index.php';
	}
});

$('#log-list [data-col="message"] span').css('display', 'block').readmore({
  collapsedHeight: 16,
  moreLink: '<a href="#" class="more">+</a>',
  lessLink: '<a href="#" class="less">-</a>',
  blockCSS: ''
});
</script>