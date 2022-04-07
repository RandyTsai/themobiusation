$(document).ready( function() {


    /*
    ===========================
   	flickity
    ===========================
    */
    $('.main-carousel').flickity({
        // options
        autoPlay: 6000,
        fade: true,
        pauseAutoPlayOnHover: false,
        prevNextButtons: false,
        pageDots: false,
        draggable: false,
        wrapAround: true,
        setGallerySize:false
    });



    //detail.php judge image size class
    var totalWidth = $('#detail .masonry-grid').width();
    var count = 0;
    var threshold = totalWidth*0.8;

    $('#detail .grid-item').each(function () {

        var imgWidth = parseInt($(this).find('img').attr('data-width'));

        if(imgWidth < threshold ){
            $(this).addClass("half-item");
        }
        // window.alert(imgWidth > threshold);
        if( (count==1) && (imgWidth < threshold) ){ //judge whether #info should be half, the first grid-item = #info

            $('#detail #info').addClass("half-item");
        }

        count++;
    });

    //masonry
    var $grid =  $('.masonry-grid').masonry({
        // options
        itemSelector: '.grid-item',
        columnWidth: '.sizer',
        percentPosition:true

    });
    $grid.imagesLoaded().progress( function() {
        $grid.masonry('layout');
    }); //use this to resolve image overlap



    //lightGallery
    $('#video-gallery').lightGallery({
        download:false,
        videoMaxWidth:1280,
        autoplayFirstVideo:true,
        youtubePlayerParams: {
            modestbranding: 0,
            showinfo: 0,
            rel: 0,
            controls: 1
        }

    });



    $('#menu-btn').click( function () {
        $('body').toggleClass('show-nav');

    });


    /*    $('nav li.has-child').click( function () {
            if($('body').hasClass('is-responsive') ){
                $(this).toggleClass('show-sub-nav');
            }



        });*/



   /* var resizeTimeout = null;

    function doResize(needReload) {

        if(needReload) {
            clearTimeout(resizeTimeout);
            resizeTimeout = setTimeout(function () {
                window.location.reload();
            }, 500);
        }


        if($(window).width() <= 850){
            $('body').addClass('is-responsive');
            $('body').removeClass('not-responsive');
        }else{
            $('body').removeClass('is-responsive');
            $('body').addClass('not-responsive');
        }

    }

    doResize(false);

    $(window).resize(function(){
        doResize(true);
    });
*/

    /**append LOGO svg**/
    $.ajax({
        url: "img/LOGO.svg",
        dataType:"html"
    }).done(function(data) {
        $( "#header-inner .logo a" ).html( data );
    });






















});