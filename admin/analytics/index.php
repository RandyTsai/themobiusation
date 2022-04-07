<?php include_once('top.php'); ?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
</head>
<body id="analytics">
	<div id="container">
    	<?php include_once('../header.php'); ?>        
		<?php include_once('../nav.php'); ?>
        <?php include_once('../toolbar.php'); ?>
        <?php include_once('aside.php'); ?>
        <div id="content">
            <div id="filter">
            	<?=$Lang->_('Range : ')?>
    			<?=$Lang->_('from')?> <input type="text" name="startdate" class="date-picker" value="<?=date('Y-m-d',strtotime('1 month ago'))?>" />
    			<?=$Lang->_('to')?> <input type="text" name="enddate" class="date-picker" value="<?=date('Y-m-d')?>" />&nbsp;
				<?=$Lang->_('Page')?> : <input type="text" name="u" value="<?=$_GET['u']?>" placeholder="Ex: /page/1/" />
    			<a href="#" class="button" id="view-button"><?=$Lang->_('View')?></a>
                <a href="#" class="button" id="export-button"><?=$Lang->_('Export')?></a>
            </div>
            <p id="status">Loading data...</p>
            <div id="ga-box"></div>
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
</body>
</html>

<script type="text/javascript" src="tablesToExcel.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	var data = '';
	
	var gaLoad = function(){
		
		$("#ga-box").removeClass('loaded').load('load.php', data, function(response, status, xhr) {
			
			$('#status').fadeOut();
			$("#ga-box").addClass('loaded');
			
  			$(this).find('div').hide();
			$(this).find('div').first().fadeIn();
			$('#aside li a').first().parent().addClass('active');
		
			$('#aside li a').click(function(){
				var id = $(this).attr('title');
				$('#ga-box div').hide();
				$('#'+id).fadeIn();
			
				$('#aside li a').parent().removeClass('active');
				$(this).parent().addClass('active');
				
				$('body').removeClass('show-aside');
				
			});
		});
	
	}
	
	gaLoad();
	
	$('#filter #view-button').click(function(){
		$('#ga-box').empty();
		$('#status').fadeIn();
		data = 'startdate='+$('input[name=startdate]').val()+'&enddate='+$('input[name=enddate]').val()+'&u='+$('input[name=u]').val();
		gaLoad();
		return false;	
	});
	
	$('#filter #export-button').click(function(){
		
		var tables = new Array();
		var labels = new Array();
		
		$('.aside-set li').each(function(){
			var a = $(this).find('a');
			var label = a.text();
			var target = a.attr('title');
			var table = $('#ga-box #'+target+' table').attr('id', 'table-'+target);
			tables.push('table-'+target);
			labels.push(label);
		});
		
		if($('#ga-box').hasClass('loaded')){
			tablesToExcel(tables, labels, 'Statistics.xls', 'Excel');
		}
		
		return false;	
	});
	
  
});
</script>