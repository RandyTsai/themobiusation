<?php include_once('top.php'); ?>
<!DOCTYPE HTML>
<html>
<head>
<?php include_once('../meta.php'); ?>
<style>
#dialog-mailing-test [name="email"] { width:98%; }
#mailing-test-result { font-size:12px; line-height:1.4em; height:300px; overflow-y:auto; border-radius:3px; background:#eee; border:1px solid #ddd; color:#666; padding:10px; }
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
        		<?php include_once('../lang.php'); ?>
        		<?php include_once('buttons.php'); ?>
            </div>
            <div class="view">
			<?=$Settings->view(1, array('ignore'=>array('gmail_server_password')))?>
            </div>
            
            <div class="buttons">
        		<a href="edit.php?page=<?=$_GET['page']?>" class="button"><?=$Lang->_('Edit')?></a>
            </div>
            
            <?php if($config['settings']['use_album']){ ?>
            <!--og:image-->
            <div class="upload-set">
            	
                <div class="title"><?=$Lang->_('Cover image')?></div>
                
            	<div class="uploader <?=$SettingsAlbums->limit_one?'limit-one':''?>" data-album="1">
    				<a id="browse-button" href="javascript:;"><?=$Lang->_('Click or drop files here to upload')?></a>
				</div>
            
            	<ul class="upload-list sort-list <?=$SettingsAlbums->type=='image'?'image-list':'file-list'?> <?=$SettingsAlbums->limit_one?'limit-one':''?>" data-action="sort-album-item">
            		<?=$SettingsAlbums->listItem(1);?>
            	</ul>
                
            </div>
            
            <!--favicon-->
            <div class="upload-set">
            	
                <div class="title"><?=$Lang->_('Favicon')?></div>
                
            	<div class="uploader <?=$SettingsAlbums->limit_one?'limit-one':''?>" data-album="2">
    				<a id="browse-button" href="javascript:;"><?=$Lang->_('Click or drop files here to upload')?></a>
				</div>
            
            	<ul class="upload-list sort-list <?=$SettingsAlbums->type=='image'?'image-list':'file-list'?> <?=$SettingsAlbums->limit_one?'limit-one':''?>" data-action="sort-album-item">
            		<?=$SettingsAlbums->listItem(2);?>
            	</ul>
                
            </div>            
            <?php }?>
            
        </div>
        <?php include_once('../footer.php'); ?>
    </div>
    
    <div id="dialog-mailing-test" class="confirm-dialog" title="<?=$Lang->_('Mailing test')?>">
  		<form>
  			<br/>
  			<p><label for="email"><?=$Lang->_('E-mail')?></label>
      		<input type="text" name="email" class="text ui-widget-content ui-corner-all">
  			</p>
  			<br/>
  			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  		</form>
        <div id="mailing-test-result"></div>
	</div>

</body>
</html>

<script>

<?php $settings = $Settings->getArticle(1);?>
<?php if($settings['smtp_auth_type'] == 'XOAUTH2'){?>
$('[data-col="oauth_refresh_token"]').show();
$('[data-col="smtp_password"]').hide();
<?php }else{ ?>
$('[data-col="oauth_refresh_token"]').hide();
$('[data-col="smtp_password"]').show();
<?php }?>

	$('#mailing-test-button').click(function(e){
		
		e.preventDefault();
		
    	$( '#dialog-mailing-test' ).dialog({
      		width: 520,
			resizable: false,
      		modal: true,
      		buttons: {
        		'OK': function() {
					
					$('#mailing-test-result').empty();
					
					$.ajax({
						url:'process.php?action=send-test-mail',
						type:'POST',
						data:{email:$( '#dialog-mailing-test form' ).find('[name="email"]').val() },
						//dataType:'json'
					}).done(function(res){
					
						//$( this ).dialog( 'close' );
						$('#mailing-test-result').html(res);
					});
					
        		},
        		Cancel: function() {
          			$( this ).dialog( 'close' );
        		}
      		},
      		close: function() {
        		$( '#dialog-mailing-test form' )[0].reset();
      		}
    	});

        $( '#dialog-mailing-test' ).dialog('open');
	});
	
</script>