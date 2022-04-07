<div id="buttons">
    <?php if(CURRENT_PAGE == 'index.php'){ if($Logger->getRecordNum() > 0){ ?>
    	<select id="range">
        	<option value=""><?=$Lang->_('All records')?></option>
            <?php foreach($Logger->getYearMonth() as $row){?>
            <option value="<?=$row['label']?>" <?=$_GET['range']==$row['label']?'selected':''?>><?=$row['label']?></option>
            <?php }?>
        </select>
    	<a href="process.php?action=export<?=isset($_GET['range'])?('&range='.$_GET['range']):''?>" class="button"><?=$Lang->_('Export to file')?></a>
    <?php }}?>
    
</div>