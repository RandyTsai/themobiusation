<?php
$config['log'] = array(
	'list_style' 		=> 'inline-list',
	'list_order_by' 	=> 'id DESC',
	'list_field' 		=> array('create_time', 'admin','page','action','message'),	
	'list_header' 		=> array('create_time'=>$Lang->_('Time'),
								 'admin'=>$Lang->_('User'), 
								 'page'=>$Lang->_('Page'), 
								 'action'=>$Lang->_('Action'), 
								 'message'=>$Lang->_('Message'))
);

$Log 	= new Articles($DB, 'dc_log');

$Log -> addColumn(array('name'=>'admin'));
$Log -> addColumn(array('name'=>'page'));
$Log -> addColumn(array('name'=>'action'));
$Log -> addColumn(array('name'=>'message'));

?>