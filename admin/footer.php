<footer id="footer">
	<p id="site-credit"><a href="https://dozencreation.com" target="_blank">SITE CREDIT</a></p>
    <div id="aside-button"><i class="far fa-ellipsis-h"></i></div>
</footer>

<div id="dialog-confirm-delete" class="confirm-dialog" title="<?=$Lang->_('Deletion confirm')?>">
  <p><?=$Lang->_('The item will be deleted immediately. Are you sure you want to continue?')?></p>
</div>

<div id="dialog-add-video" class="confirm-dialog" title="<?=$Lang->_('Add video')?>">
  <form>
  	<br/>
  	<p><label for="name"><?=$Lang->_('Video link')?></label>
      	<input type="text" name="video_url" class="large text ui-widget-content ui-corner-all" placeholder="<?=$Lang->_('Youtube or Vimeo Url')?>">
  	</p>
  	<br/>
  	<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
  </form>
</div>