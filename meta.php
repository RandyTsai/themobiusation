<!--Install DataLayer -->
<script>
    window.dataLayer = window.dataLayer || [];
</script>
<!--Install DataLayer -->
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-NTD3WTB');</script>
<!-- End Google Tag Manager -->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<?=$current_site_root?>">

<!-- Meta -->
<title><?=$meta_title?></title>
<meta name="keywords" content="<?=$meta_keywords?>">  
<meta name="description" content="<?=$meta_description?>">  
<meta name="author" content="<?=getLangData($settings, 'meta_title')?>">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">

<!-- Open Graph -->
<meta property="og:title" content="<?=$meta_title?>" />
<meta property="og:url" content="<?=CONFIG_SITE_PROTOCOL.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']?>" />
<meta property="og:description" content="<?=$meta_description?>" />
<meta property="og:image" content="<?=$meta_image?>" />
<meta property="og:type" content="website" />

<!-- Twitter Cards -->
<meta name="twitter:card" content="summary" />
<meta name="twitter:title" content="<?=$meta_title?>" />
<meta name="twitter:description" content="<?=$meta_description?>" />
<meta name="twitter:image" content="<?=$meta_image?>" />
<meta name="twitter:url" content="<?=CONFIG_SITE_PROTOCOL.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']?>" />

<!-- Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@300;400;600&family=Noto+Serif+TC:wght@300;400;600&display=swap" rel="stylesheet"  media="print" onload="this.media='all'">

<!-- Style -->
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'froala-editor-3.2.6/css/froala_style.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/plugin/flickity-2.2/flickity.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/plugin/flickity-2.2/flickity-fade.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/plugin/lightGallery/dist/css/lightgallery.min.css'?>" media="print" onload="this.media='all'" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'fontawesome-5.13.0/css/fontawesome.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'fontawesome-5.13.0/css/light.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'fontawesome-5.13.0/css/regular.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'fontawesome-5.13.0/css/solid.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'fontawesome-5.13.0/css/all.min.css'?>" />
<link rel="stylesheet" href="<?=CONFIG_TOOLKIT_PATH.'fontawesome-5.13.0/css/brands.min.css'?>" />
<!--
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/plugin/jssocials/jssocials.css'?>" media="print" onload="this.media='all'" />
<link rel="stylesheet" href="<?=CONFIG_JS_PATH.'jQuery/plugin/jssocials/jssocials-theme-plain.css'?>" media="print" onload="this.media='all'" />
-->
<link rel="stylesheet" href="css/style.css?update=20220106" /> <!--?update=20220104-->
<link rel="stylesheet" href="css/responsive.css?update=20220106"/>

<!-- Favicon -->
<link rel="icon" href="<?=CONFIG_SITE_ROOT.'_upload/image/settings/icon-32/'.$SettingsAlbums->getCover(2)?>" sizes="32x32" type="image/png" />
<link rel="icon" href="<?=CONFIG_SITE_ROOT.'_upload/image/settings/icon-192/'.$SettingsAlbums->getCover(2)?>" sizes="192x192" type="image/png" />
<link rel="apple-touch-icon" href="<?=CONFIG_SITE_ROOT.'_upload/image/settings/icon-192/'.$SettingsAlbums->getCover(2)?>" />

<!-- JS -->
<?php if(GA_ENABLED){ include_once(CONFIG_ADMIN_PATH.'analytics/analytics.php'); }?>
<?php include_once('combine.php'); ?>
<script src="script.js?update=20220301"></script> <!-- update=20220104-->

