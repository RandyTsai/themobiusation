$(document).ready( function() {
	
	/*
	==========================
	Structure
	==========================
	*/
	$('#toolbar').after('<div id="main-wrapper"></div>');
	$('#main-wrapper').prepend($('#content'));
	$('#main-wrapper').prepend($('#aside'));
	
	$('#aside').hcSticky({});  
  	$('#content').hcSticky({}); 
  	$('#banner').hcSticky({
		stickTo: '#main-wrapper'	
	});


	/*
	==========================
	Mobile
	==========================
	*/
	$('#toolbar').appendTo('#nav-inner');
	
	$('#menu-button').click(function(){
		$('body').addClass('show-nav');
	});
	
    $('#aside-button').click(function(){
        $('body').toggleClass('show-aside');
    });

    $('#nav-mask').click(function () {
		$('body').removeClass('show-nav');
		$('body').removeClass('show-aside');
		$('body').removeClass('show-subnav');
	});
	
	$('#nav-wrapper a.has-subnav').click(function(e){
		if($('#menu-button').is(':visible')){
			e.preventDefault();
			$('body').addClass('show-subnav');
			$('#nav-wrapper .sub-nav').removeClass('mobile-show');
			$(this).parent().find('.sub-nav').addClass('mobile-show');
		}
	});

	$('#nav-close').click(function(){
		$('body').removeClass('show-nav');
		$('body').removeClass('show-subnav');
	});

	$('#nav-back').click(function(){
		$('body').removeClass('show-subnav');
	});
	
	//Remove #aside-button if #aside is empty
	if( $('#aside').children().length == 0 ){
		$('#aside-button').remove();
	}
	
	//Remove #menu-button if ##nav-wrapper is not exists
	if( $('#nav-wrapper').length == 0 ){
		$('#menu-button').remove();
	}
	
	
	/*
	==========================
	Language
	==========================
	*/
	if($('#lang-menu').length > 0){
		
		var saved_lang = localStorage.getItem('admin_lang') !== null ? localStorage.getItem('admin_lang') : '';
		
		if(saved_lang != '' && $('#lang-menu a[title="'+saved_lang+'"]').length > 0){
			var selected_lang = saved_lang;
		}else{
			var selected_lang = $('#lang-menu a').first().attr('title');
		}
		
		$('.col-lang').hide();	
		$('.col-lang.'+selected_lang).show();
	
		$('#lang-menu a[title='+selected_lang+']').addClass('active');
	
		$('#lang-menu a').click(function(e){
		
			var lang = $(this).attr('title');
			$('.col-lang').hide();
			$('.col-lang.'+lang).show();
		
			$('#lang-menu a').removeClass('active');
			$(this).addClass('active');
			
			localStorage.setItem('admin_lang', lang);
			
			e.preventDefault();
		});
	}
	
	
	/*
	==========================
	Form
	==========================
	*/
	if($('#login').length > 0){
		setTimeout(function(){
			$('form input').first().focus();
		}, 1500);
	}else{
		$('form input').first().focus();
	}
	
	/*
	==========================
	View
	==========================
	*/
	$('.view .msg').delay(5000).fadeOut(1000);
	
	
	/*
	==========================
	Sort list
	==========================
	*/
	$('.sort-list').each(function(){
		
		$(this).sortable({
      		//helper  : 'clone',
			handle	: $(this).hasClass('image-list') ? '.thumb' : '',
	  		opacity : 0.8,
      		update  : function(event, ui){
				
		 		var action = $(this).attr('data-action') ;
		 		action = (action && action != '')?action:'sort';
	     		var serialized = $(this).sortable('serialize'); 
		 		$.post('process.php?action='+action, serialized);
				
	  		}
    	});
	});
	
	
	//Warning : Nested sort us the same class 'sort-list' for style
	//		   settings, so this should always called after sortable
	//		   to avoid conflict.
	$('.nested-sort-list > ol').each(function(){
		
		var data_sort_level = $(this).parent().attr('data-sort-level');
		data_sort_level = (data_sort_level)?data_sort_level:'';
			
		var list = $(this);	
			
		list.nestedSortable({
      		forcePlaceholderSize: true,
      		handle: 'div',
      		helper:	'clone',
      		items: 'li',
      		maxLevels: data_sort_level,
      		opacity: .6,
      		placeholder: 'placeholder',
      		revert: 250,
      		tabSize: 25,
      		tolerance: 'pointer',
      		toleranceElement: 'div',
      		update: function(event, ui) {
				
	     		var serialized = list.nestedSortable('serialize');
		 		var action = $(this).parent().attr('data-action');
		 		action = (action && action != '')?action:'sort-category';
		 
		 		$.post('process.php?action='+action,serialized);
      		}
    	});
	});
	
	
	/*
	==========================
	Rich text editor
	==========================
	*/
	if(!(typeof CONFIG_EDITOR_TOOLBAR === 'undefined')){
		
		switch(CONFIG_EDITOR_TOOLBAR){
			
			case 'Full':
			
				var toolbarButtons = {
  					'moreText': {
    					'buttons': ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', 'textColor', 'backgroundColor', 'clearFormatting'],
  					},
  					'moreParagraph': {
    					'buttons': ['alignLeft', 'alignCenter', 'formatOLSimple', 'alignRight', 'alignJustify', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote']
 					 },
  					'moreRich': {
    					'buttons': ['insertLink', 'insertImage', 'insertTable', 'insertVideo', 'specialCharacters', 'insertFile', 'insertHR']
  					},
  					'moreMisc': {
    					'buttons': ['undo', 'redo', 'html'],
    					'align': 'right'
  					}
				};
				
				
				var toolbarButtonsSM = {
  					'moreText': {
    					'buttons': ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', 'textColor', 'backgroundColor', 'clearFormatting'],
						buttonsVisible: 2
  					},
  					'moreParagraph': {
    					'buttons': ['alignLeft', 'alignCenter', 'formatOLSimple', 'alignRight', 'alignJustify', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote'],
						buttonsVisible: 2
 					 },
  					'moreRich': {
    					'buttons': ['insertLink', 'insertImage', 'insertTable', 'insertVideo', 'specialCharacters', 'insertFile', 'insertHR'],
						buttonsVisible: 2
  					},
  					'moreMisc': {
    					'buttons': ['html'],
    					'align': 'right',
						buttonsVisible: 2
  					}
				};
				
			break;
			case 'Simple':
			default:
				var toolbarButtons = {
  					'moreText': {
    					'buttons': ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'clearFormatting']
  					},
  					'moreParagraph': {
    					'buttons': ['alignLeft', 'alignCenter', 'formatOLSimple', 'alignRight', 'alignJustify', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote']
 					 },
  					'moreRich': {
    					'buttons': ['insertLink', 'insertTable', 'specialCharacters']
  					},
  					'moreMisc': {
    					'buttons': ['undo', 'redo', 'html'],
    					'align': 'right'
  					}
				};
				
				var toolbarButtonsSM = {
  					'moreText': {
    					'buttons': ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'clearFormatting'],
						buttonsVisible: 2
  					},
  					'moreParagraph': {
    					'buttons': ['alignLeft', 'alignCenter', 'formatOLSimple', 'alignRight', 'alignJustify', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote'],
						buttonsVisible: 2
 					 },
  					'moreRich': {
    					'buttons': ['insertLink', 'insertTable', 'specialCharacters'],
						buttonsVisible: 2
  					},
  					'moreMisc': {
    					'buttons': ['html'],
    					'align': 'right',
						buttonsVisible: 2
  					}
				};
			break;
		}
	}
	
	
	$('textarea.richtext').each(function(){
		
		new FroalaEditor($(this)[0], {
			
			//Editor settings
			key: 'OXC1lC3E3A13C10C7E7kOPVi1b1b2Le2e1G1AWMSGSAFDTGHWsE7D7D6D5A1I4C3C3C6B5==',
  			charCounterCount: false,
			heightMin: $(this).hasClass('short')? 100 : 250,
      		heightMax: $(this).hasClass('short')? 120 : 450,
			language: 'zh_tw',
			enter: FroalaEditor.ENTER_BR,
			htmlExecuteScripts: false,
			placeholderText: '',
			pasteDeniedTags: ['html', 'body', 'head', 'article', 'aside', 'nav', 'footer', 'div', 'p', 'b', 'i', 'font', 'script'],
			pastePlain: false,
			useClasses: true,
			attribution: false,
			iconsTemplate: 'font_awesome_5',
			toolbarButtons: toolbarButtons,
			toolbarButtonsSM: toolbarButtonsSM,
			toolbarButtonsXS: toolbarButtonsSM,
			toolbarStickyOffset: 53,
			quickInsertEnabled: false,
			linkInsertButtons: [],
			imageDefaultWidth: 0,
			imageDefaultAlign: 'left',
			imageEditButtons: ['imageReplace', 'imageAlign', 'imageCaption', 'imageRemove', '|', 'imageLink', 'linkOpen', 'linkEdit', 'linkRemove', '-', 'imageDisplay', 'imageAlt', 'imageSize', 'imageTUI'],
			videoInsertButtons: ['videoBack', '|', 'videoByURL', 'videoEmbed'],
			videoResponsive: true,
			
			//Image upload
			imageUploadParam: 'file',
       		imageUploadURL: CONFIG_TOOLKIT_PATH+'froala-editor-3.2.6/php/image_upload.php',
			imageUploadParams: { folder: CONFIG_EDITOR_IMAGE_UPLOAD_FOLDER, path: CONFIG_EDITOR_ADMIN_PATH },
        	imageUploadMethod: 'POST',
        	imageMaxSize: 100 * 1024 * 1024,
        	imageAllowedTypes: ['jpeg', 'jpg', 'png', 'gif'],
			
			//Image manager
			imageManagerPageSize: 20,
        	imageManagerScrollOffset: 10,
        	imageManagerLoadURL: CONFIG_TOOLKIT_PATH+'froala-editor-3.2.6/php/image_manager_load.php',
        	imageManagerLoadMethod: 'POST',
			imageManagerLoadParams: { folder: CONFIG_EDITOR_IMAGE_UPLOAD_FOLDER, path: CONFIG_EDITOR_ADMIN_PATH },
        	imageManagerDeleteURL: CONFIG_TOOLKIT_PATH+'froala-editor-3.2.6/php/image_manager_remove.php',
        	imageManagerDeleteMethod: 'POST',
			imageManagerDeleteParams: { path: CONFIG_EDITOR_ADMIN_PATH },
			
			
			//File upload
			fileUploadParam: 'file',
    		fileUploadURL: CONFIG_TOOLKIT_PATH+'froala-editor-3.2.6/php/file_upload.php',
    		fileUploadParams: { folder: CONFIG_EDITOR_FILE_UPLOAD_FOLDER, path: CONFIG_EDITOR_ADMIN_PATH }, // Additional upload params.
    		fileUploadMethod: 'POST',
    		fileMaxSize: 100 * 1024 * 1024,		
    		fileAllowedTypes: ['*'],
			
			//Events
			events: {
      			'image.error': function (error, response) {
        			alert(error.message);
     			},
      			'imageManager.error': function (error, response) {
        			alert(error.message);
     			},
				'image.removed': function ($img) {
					/*
					$.ajax({
         				method: 'POST',
         				url: CONFIG_TOOLKIT_PATH+'froala-editor-3.2.6/php/image_remove.php',
         				data: { src: $img.attr('src') }
       				}).done (function(res){});
					*/
				},
      			'file.error': function (error, response) {
        			alert(error.message);
     			},
				'keyup': function (keyupEvent) {
					updateSession();
    			}
			}
		});
	
	});
	
	
	/*
	==========================
	Uploader
	==========================
	*/		
	$('.upload-set').each(function(){
		
		var upr 		  = $(this).find('.uploader');
		var upload_list   = $(this).find('.upload-list');
		var limit_one	  = upr.hasClass('limit-one') ? 1 : 0;
		var action		  = upr.attr('data-action') ? upr.attr('data-action') : 'upload';
		
		var uploader = new plupload.Uploader({
  			browse_button: upr[0],
			drop_element: upr[0],
			multi_selection: !limit_one,
  			url: 'process.php?action='+action+'&album='+upr.attr('data-album')+'&limit_one='+limit_one,
			flash_swf_url: CONFIG_PLUPLOAD_SWF_URL,
			silverlight_xap_url: CONFIG_PLUPLOAD_XAP_URL,
		});
 
		uploader.init();
		
		uploader.bind('FilesAdded', function(up, files) {
			
			if(limit_one){
				upload_list.empty();
			}
			
  			plupload.each(files, function(file) {
				var li = $('<li id="' + file.id + '" class="uploading"><p class="progress"></p></li>');
				upload_list.append(li);
  			});
			
			up.start();
		});
		
		uploader.bind('UploadProgress', function(up, file) {
  			$('#'+file.id+' .progress').width(file.percent+'%');
		});
		
		uploader.bind('FileUploaded', function(up, file, response) {
			
			var res = $.parseJSON(response.response);
			
			if(res.status == 1){
				
				var li = $(res.html);
				
				if(upload_list.hasClass('image-list')){
					li.find('.btn').prepend('<div class="image-settings-button"><i class="far fa-cog"></i></div>');
				}
				
				$('#'+file.id).replaceWith(li);
				
				if(li.find('img').length > 0){
					li.find('img').css({opacity:0}).load(function(){
						$(this).animate({opacity:1});					
					});
				}
				
				if(li.find('[data-src]')){
					if(!loadImageFlag){
						checkImageExists();
					}
				}
				
			}else{
				if(res.message){
					alert(res.message);
				}
				$('#'+file.id).remove();
			}
	
		});
				
		uploader.bind('Error', function(up, err) {
  			alert("Error #" + err.code + ": " + err.message);
		});
		
	});
	
	
	var loadImageFlag = false;
	
	function checkImageExists(){
		
			var data = new Array();
				
			$('.upload-list .thumb[data-src]').each(function(){
				var src = $(this).attr('data-src');
				if(src){
					data.push(src);
				}
			});
			
			if(data.length > 0){
				
				loadImageFlag = true;
				
				$.ajax({
					url:'process.php?action=check-image-exists',
					type:'post',
					data:{paths:data},
					dataType:'json'
				}).done(function(res){
					$.each(res, function(index, value){
						var thumb = $('.upload-list .thumb[data-src="'+value+'"]');
						var img = $('<img src="'+value+'" />').css({opacity:0}).load(function(){
							$(this).animate({opacity:1});					
						});
						thumb.removeClass('pending').removeAttr('data-src').find('a').append(img);
					});
				
					//console.log($('.upload-list .thumb[data-src]').length);
					
					if($('.upload-list .thumb[data-src]').length > 0){
						setTimeout(checkImageExists, 5000);
					}else{
						loadImageFlag = false;
					}
				});
			
			}else{
				loadImageFlag = false;
			}
			
	}
	
	checkImageExists();
	
	
	/*
	==========================
	Image list
	==========================
	*/
	var imageZoomTimeout = null;
	
	$('.image-list .thumb a').live('click', function(e){ 
		
		e.preventDefault();
		
		var elm = $(this);
		
		clearTimeout(imageZoomTimeout);
		imageZoomTimeout = setTimeout(function(){
			
			elm.lightGallery({
				dynamic: true,
       			dynamicEl: [{
            		'src': elm.attr('href')
        		}],
				download:false,
				counter:false,
				autoplayFirstVideo:true
			});			
		}, 100);
		
	});
	
	$('.image-list li .btn').prepend('<div class="image-settings-button"><i class="far fa-cog"></i></div>');
	
	$('.album-delete-button').live('click', function(e){
		
		e.preventDefault();
		
		var li = $(this).parents('li');
		var href = $(this).attr('href');
		var list = li.parent();
		
		$('#dialog-confirm-delete').dialog({
      		resizable: false,
      		modal: true,
      		buttons: {
        		'OK': function() {
          			$.ajax({
  						type: 'GET',
  						url: href
					}).done(function( response ) {
						
  						li.fadeOut(function(){							
							$(this).remove();			
						});
					});
					$( this ).dialog( 'close' );
        		},
        		Cancel: function() {
          			$( this ).dialog( 'close' );
        		}
      		}
    	});

        $('#dialog-confirm-delete').dialog('open');
	});
	
	$('.album-cover-button').live('click', function(e){
		
		var btn = $(this);
		var li = $(this).parents('li');
		var href = $(this).attr('href');
		
		$.ajax({
  			type: 'GET',
  			url: href,
			dataType: 'json'
		}).done(function( response ) {
			if(response.cover){
				li.siblings().removeClass('cover');
				li.addClass('cover');
			}else{
				li.removeClass('cover');
			}
		});
		
		e.preventDefault();
	});
	
	
	/*
	==========================
	Date picker
	==========================
	*/
	$( 'input.date-picker' ).each(function(){
		$(this).attr('autocomplete','off').datepicker({ dateFormat: 'yy-mm-dd' });
	});
	
	
	/*
	==========================
	Deletion
	==========================
	*/
	$('.delete-button').live('click', function(e){
		
		e.preventDefault();
		
		var href = $(this).attr('href');

        $('#dialog-confirm-delete').dialog({
      		resizable: false,
      		modal: true,
      		buttons: {
        		'OK': function() {
          			window.location.href = href;
        		},
        		Cancel: function() {
          			$( this ).dialog( 'close' );
        		}
      		}
    	});

        $('#dialog-confirm-delete').dialog('open');
	});
	
	
	/*
	==========================
	AutoComplete
	==========================
	*/
	$('.autocomplete').each(function(){
		var field = $(this).attr('name');
		$(this).autocomplete({
			source: 'process.php?action=autocomplete&field='+field,
			minLength: 1
		});
	});
	
	
	/*
	==========================
	Video
	==========================
	*/
	$('.add-video-button').live('click', function(e){
		
		e.preventDefault();
		
		var upr 		= $(this).parent().parent().find('.uploader');
		var upload_list = $(this).parent().parent().find('.upload-list');
		var limit_one   = upr.hasClass('limit-one') ? 1 : 0;
		var action      = upr.attr('data-action') ? upr.attr('data-action') : 'add-video';
		
		
        $( '#dialog-add-video' ).dialog({
      		width: 400,
			resizable: false,
      		modal: true,
      		buttons: {
        		'OK': function() {
					
					var form = $( '#dialog-add-video form' );
					
					$.ajax({
						url:'process.php?action='+action,
						type:'POST',
						data:{album: upr.attr('data-album'), video_url:form.find('[name="video_url"]').val() },
						dataType:'json'
					}).done(function(res){
				
						if(res.status == 1){
							
							if(limit_one){
								upload_list.empty();
							}
					
							var li = $(res.html);				
							upload_list.append(li);
							li.find('.btn').prepend('<div class="image-settings-button"><i class="far fa-cog"></i></div>');
							
							if(li.find('img').length > 0){
								li.find('img').css({opacity:0}).load(function(){
									$(this).animate({opacity:1});					
								});
							}
				
							if(li.find('[data-src]')){
								if(!loadImageFlag){
									checkImageExists();
								}
							}
				
						}
			
					});
					
					$( this ).dialog( 'close' );
					
        		},
        		Cancel: function() {
          			$( this ).dialog( 'close' );
        		}
      		},
      		close: function() {
        		$( '#dialog-add-video form' )[0].reset();
      		}
    	});

        $( '#dialog-add-video' ).dialog('open');
	});
	
	
	/*
	==========================
	Crop image
	==========================
	*/
	$('#crop-source').each(function(){
		
		var width 	= parseInt($(this).attr('data-width'));
		var height 	= parseInt($(this).attr('data-height'));
		var type 	= $(this).attr('data-type');		
		var f = $('#crop-data [name="path"]').val().split('.')[0].split('_'); //By auto generated unique filename, there are always only one dot.
		
		$(this).find('img').cropper({
  			aspectRatio: (type == 'fill' && width && height)?(width/height):NaN,
			preview: '#crop-preview',
			autoCropArea: 1,
			rotatable: false,
			scalable: false,
			zoomable: false,
			data: (f.length == 5 ? {x:parseInt(f[1]), y:parseInt(f[2]), width:parseInt(f[3]), height:parseInt(f[4])} : null),
  			crop: function(e) {
				$('input[name="x"]').val(parseInt(e.x));
				$('input[name="y"]').val(parseInt(e.y));
				$('input[name="w"]').val(parseInt(e.width));
				$('input[name="h"]').val(parseInt(e.height));
  			}
		});
	});
	
	$('#crop-save-button').click(function(e){
		$('#crop-data').submit();
		e.preventDefault();
	});
	
	
	/*
	==========================
	Session
	==========================
	*/
	if($('#nav-wrapper').length > 0){
		
		$('input, textarea').keyup(function(){
			updateSession();
		});
		
		setInterval(updateSession, 1000);
	}
	
	var lastUpdateSession = Date.now();
	
	function updateSession(){
		
		if(Date.now() - lastUpdateSession > 60000){
			
			lastUpdateSession = Date.now();
			
			$.ajax({
				url:'process.php?action=updateSession'
			}).done(function(res){
				
			});
		}
		
	}
});