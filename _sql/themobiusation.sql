-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-01-05 09:09:49
-- 伺服器版本： 10.4.17-MariaDB
-- PHP 版本： 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `themobiusation`
--

-- --------------------------------------------------------

--
-- 資料表結構 `dc_about`
--

CREATE TABLE `dc_about` (
  `id` int(11) NOT NULL,
  `display` tinyint(1) NOT NULL DEFAULT 1,
  `category` tinyint(4) DEFAULT NULL,
  `title_en` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_zh` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_zh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ord` int(11) NOT NULL DEFAULT 9999,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_about`
--

INSERT INTO `dc_about` (`id`, `display`, `category`, `title_en`, `title_zh`, `contents_en`, `contents_zh`, `ord`, `create_time`, `update_time`) VALUES
(1, 1, 1, 'Summary', '摘要', 'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web visualization.<br><br>Although we have done a number of projects for over six years, we would rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.', 'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過八年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。', 2, '2022-01-05 14:21:10', '2022-01-05 14:58:19');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_about_attach`
--

CREATE TABLE `dc_about_attach` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `album` int(11) NOT NULL,
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` tinyint(1) NOT NULL DEFAULT 0,
  `video_url` varchar(240) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ord` int(11) NOT NULL DEFAULT 0,
  `alt_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_zh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_about_attach`
--

INSERT INTO `dc_about_attach` (`id`, `type`, `album`, `path`, `filename`, `cover`, `video_url`, `ord`, `alt_en`, `alt_zh`, `counter`, `status`, `create_time`, `update_time`) VALUES
(21, NULL, 1, '9525891d27840696.jpg', 'news2329_gross.jpg', 0, NULL, 2, NULL, NULL, 0, NULL, '2022-01-05 14:26:01', '2022-01-05 14:40:16');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_about_cat`
--

CREATE TABLE `dc_about_cat` (
  `id` tinyint(4) NOT NULL,
  `title_en` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_zh` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT 0,
  `ord` tinyint(4) NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_about_cat`
--

INSERT INTO `dc_about_cat` (`id`, `title_en`, `title_zh`, `parent`, `ord`, `create_time`, `update_time`) VALUES
(1, 'About us', '關於我們', 0, 0, '2021-05-17 11:28:39', '2021-05-17 11:28:39');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_admin`
--

CREATE TABLE `dc_admin` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `reset_pass_token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_pass_time` datetime DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `create_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_admin`
--

INSERT INTO `dc_admin` (`id`, `name`, `username`, `password`, `email`, `category`, `status`, `reset_pass_token`, `reset_pass_time`, `update_time`, `create_time`) VALUES
(1, '曾功達', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'dagoolasoul3@gmail.com', 0, 1, NULL, NULL, '2022-01-05 14:42:43', '2022-01-05 14:46:09');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_admin_cat`
--

CREATE TABLE `dc_admin_cat` (
  `id` tinyint(4) NOT NULL,
  `title_en` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_zh` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT 0,
  `ord` tinyint(4) NOT NULL DEFAULT 0,
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `create_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `dc_gallery`
--

CREATE TABLE `dc_gallery` (
  `id` int(11) NOT NULL,
  `display` tinyint(1) NOT NULL DEFAULT 1,
  `title_en` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_zh` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_zh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ord` int(11) NOT NULL DEFAULT 9999,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_gallery`
--

INSERT INTO `dc_gallery` (`id`, `display`, `title_en`, `title_zh`, `contents_en`, `contents_zh`, `ord`, `create_time`, `update_time`) VALUES
(1, 1, NULL, 'test', NULL, NULL, 9999, '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(2, 1, 'Afador', NULL, NULL, NULL, 9999, '2022-01-05 14:38:06', '2022-01-05 14:47:33');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_gallery_attach`
--

CREATE TABLE `dc_gallery_attach` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `album` int(11) NOT NULL,
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` tinyint(1) NOT NULL DEFAULT 0,
  `video_url` varchar(240) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ord` int(11) NOT NULL DEFAULT 0,
  `alt_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_zh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_gallery_attach`
--

INSERT INTO `dc_gallery_attach` (`id`, `type`, `album`, `path`, `filename`, `cover`, `video_url`, `ord`, `alt_en`, `alt_zh`, `counter`, `status`, `create_time`, `update_time`) VALUES
(17, 'image', 1, '41960030950b6ff5.jpg', '8895ff6d1453ce46.jpg', 0, NULL, 10, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(18, 'image', 1, '87260032ea43b513_345_89_1744_1047.jpg', '12104snow.jpg', 0, NULL, 1, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(21, 'image', 1, '7526003322764b68_0_52_1819_774.jpg', 'finalRen.jpg', 0, NULL, 6, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(8, 'image', 1, '93760032e4598cc1_0_220_3542_1870.jpg', 'TVM_persp eingang_140302.jpg', 0, NULL, 3, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(9, 'image', 1, '4755ff6d0d6cb5da.jpg', 'factory2FORRender4fixCut.jpg', 0, NULL, 11, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(10, 'image', 1, '78560032f455f9f7_0_1423_7051_3542.jpg', 'FinalMixCut2.jpg', 0, NULL, 4, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(11, 'image', 1, '54360032fb08180c_0_53_853_404.jpg', '13320436_1723031291289595_8399467170437329242_o.jpg', 0, NULL, 5, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(13, 'image', 1, '4575ff6d11deb738.jpg', 'DSC00574.jpg', 0, NULL, 7, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(14, 'image', 1, '97460032f6e03774_167_363_1512_887.jpg', 'superSrf3fix.jpg', 0, NULL, 8, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(16, 'image', 1, '15060032f8a731c2_0_167_786_434.jpg', 'DDD5cut.jpg', 0, NULL, 9, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33'),
(20, 'image', 1, '2456003314fdc549.jpg', '0704ren2.jpg', 0, NULL, 2, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:47:33');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_log`
--

CREATE TABLE `dc_log` (
  `id` int(11) NOT NULL,
  `admin` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `page` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_log`
--

INSERT INTO `dc_log` (`id`, `admin`, `page`, `action`, `message`, `create_time`) VALUES
(462, 'admin', 'settings', 'upload', 'INSERT INTO dc_settings_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'6861d549b20a234.png\', \'1\', \'webphoto-01.png\', 999, \'pending\' )', '2022-01-05 15:33:06'),
(461, 'admin', 'settings', 'update', 'UPDATE dc_settings SET meta_title_zh = \'THEMOBIUSATION\',meta_title_en = \'THEMOBIUSATION\',meta_keywords_zh = \'衍生設計, 運算設計, 數位構築, 參數式建築, 建築設計,  室內設計, 編程藝術, 程式藝術, 網站開發, 網站設計, 全端網站開發, 網站視覺設計。\',meta_keywords_en = \'Generative Design, Computation Design, Digital Fabrication, Parametric Architecture, Architecture, Interior, Programming Art, Code Art, Web Developer, Web Development, Full-Stack Developer, Full-Stack Development, Web Design, Web Visualization, Webpage Design.\',meta_description_zh = \'莫比創意 - 建築設計，室內設計，網站設計，工作室。\\r\\n\\r\\nTHEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過八年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',meta_description_en = \'THEMOBIUSATION - studio for Web design, Art creation , Architecture design, Interior design.\\r\\n\\r\\nMobiusation referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web visualization.\\r\\n\\r\\nAlthough we have done a number of projects for over six years, we would rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2022-01-05 15:26:35'),
(460, 'admin', 'settings', 'update', 'UPDATE dc_settings SET meta_title_zh = \'DozenCreation\',meta_title_en = \'THEMOBIUSATION\',meta_keywords_zh = \'\',meta_keywords_en = \'Generative Design, Computation Design, Digital Fabrication, Parametric Architecture, Architecture, Interior, Programming Art, Code Art, Web Developer, Web Development, Full-Stack Developer, Full-Stack Development, Web Design, Web Visualization, Webpage Design.\',meta_description_zh = \'\',meta_description_en = \'THEMOBIUSATION - studio for Web design, Art creation , Architecture design, Interior design.\\r\\n\\r\\nMobiusation referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web visualization.\\r\\n\\r\\nAlthough we have done a number of projects for over six years, we would rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2022-01-05 15:21:43'),
(447, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'4\'', '2022-01-05 14:55:37'),
(448, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'5\'', '2022-01-05 14:55:41'),
(449, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'6\'', '2022-01-05 14:55:44'),
(450, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'7\'', '2022-01-05 14:55:47'),
(451, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'8\'', '2022-01-05 14:55:49'),
(452, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'9\'', '2022-01-05 14:55:52'),
(453, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'10\'', '2022-01-05 14:55:55'),
(454, 'admin', 'settings', 'upload', 'INSERT INTO dc_settings_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'94861d5422851e61.svg\', \'2\', \'LOGO.svg\', 999, \'pending\' )', '2022-01-05 15:00:56'),
(455, 'admin', 'settings', 'delete-album-item', 'DELETE FROM dc_settings_attach WHERE id = \'1\'', '2022-01-05 15:01:18'),
(456, 'admin', 'settings', 'upload', 'INSERT INTO dc_settings_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'77161d54337e9e64.png\', \'2\', \'fevicon.png\', 999, \'pending\' )', '2022-01-05 15:05:28'),
(457, 'admin', 'settings', 'update', 'UPDATE dc_settings SET meta_title_zh = \'DozenCreation\',meta_title_en = \'THEMOBIUSATION\',meta_keywords_zh = \'\',meta_keywords_en = \'\',meta_description_zh = \'\',meta_description_en = \'\' WHERE id = \'1\'', '2022-01-05 15:05:50'),
(458, 'admin', 'settings', 'update', 'UPDATE dc_settings SET mail_sender = \'dozencreation.mailer@gmail.com\',mail_receiver = \'waterblue4019@hotmail.com\',mail_from = \'THEMOBIUSATION\',mail_header = \'<u>THEMOBIUSATION</u>\',mail_signature = \'<u>THEMOBIUSATION</u>\',smtp_status = \'1\',smtp_host = \'smtp.gmail.com\',smtp_port = \'587\',smtp_secure = \'tls\',smtp_auth_type = \'XOAUTH2\',smtp_account = \'dozencreation.mailer@gmail.com\',oauth_refresh_token = \'1//0eVsN3z0pPn0oCgYIARAAGA4SNwF-L9IrRMFVeu5daWSsE_ZgWJYFsBw-WcR0gjEJStAGpX24-rbBpwE54hlgw6dyg5IRTSEQUTA\' WHERE id = \'1\'', '2022-01-05 15:06:34'),
(459, 'admin', 'settings', 'update', 'UPDATE dc_settings SET contact_address_zh = \'\',contact_address_en = \'803 高雄市鹽埕區大勇 路11 號3 樓308 室\',contact_phone = \'0988378769\',contact_email = \'waterblue4019@hotmail.com\',social_facebook = \'https://www.facebook.com/Actinia0103/\',social_messenger = \'\',social_instagram = \'\',social_twitter = \'\',social_line = \'https://line.me/ti/p/-IFuHCCmDr\',social_linkedin = \'https://www.linkedin.com/in/yuwei-tsai-randy/\',social_youtube = \'\' WHERE id = \'1\'', '2022-01-05 15:11:09'),
(446, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'3\'', '2022-01-05 14:55:35'),
(445, 'admin', 'about', 'delete', 'DELETE FROM dc_about WHERE id = \'2\'', '2022-01-05 14:55:32'),
(197, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'77\'', '2021-01-05 17:08:02'),
(198, 'admin', 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'325ff42dde67de1_319_106_386_487.jpg\' WHERE path = \'605ff33dcb8fea7.jpg\'', '2021-01-05 17:14:06'),
(199, 'admin', 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'5335ff42f5932d64.jpg\', \'9\', \'2020-12-09-13-58-22-601.jpg\', 999, \'pending\' )', '2021-01-05 17:20:25'),
(200, 'admin', 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'173\'', '2021-01-05 17:20:44'),
(201, 'admin', 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'7705ff42f8420acd.jpg\', \'9\', \'2020-12-09-13-58-22-601.jpg\', 999, \'pending\' )', '2021-01-05 17:21:09'),
(202, 'admin', 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'355ff42fb3d6eca_316_342_1721_1721.jpg\' WHERE path = \'7705ff42f8420acd.jpg\'', '2021-01-05 17:21:55'),
(203, 'admin', 'settings', 'update', 'UPDATE dc_settings SET meta_title_zh = \'THEMOBIUSATION\',meta_title_en = \'\',meta_keywords_zh = \'\',meta_keywords_en = \'\',meta_description_zh = \'\',meta_description_en = \'\' WHERE id = \'1\'', '2021-01-05 17:41:21'),
(204, 'admin', 'settings', 'update', 'UPDATE dc_settings SET meta_title_zh = \'\',meta_title_en = \'\',meta_keywords_zh = \'\',meta_keywords_en = \'\',meta_description_zh = \'\',meta_description_en = \'\' WHERE id = \'1\'', '2021-01-07 15:35:23'),
(205, 'admin', 'settings', 'update', 'UPDATE dc_settings SET meta_title_zh = \'\',meta_title_en = \'THEMOBIUSATION\',meta_keywords_zh = \'\',meta_keywords_en = \'\',meta_description_zh = \'\',meta_description_en = \'\' WHERE id = \'1\'', '2021-01-07 15:35:30'),
(206, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'7865ff6d00a775f9.jpg\', \'1\', \'2.jpg\', 999, \'pending\' )', '2021-01-07 17:10:34'),
(207, 'admin', 'gallery', 'delete-album-item', 'DELETE FROM dc_gallery_attach WHERE id = \'7\'', '2021-01-07 17:10:43'),
(208, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'3245ff6d0c912895.jpg\', \'1\', \'TVM_persp eingang_140302.jpg\', 999, \'pending\' )', '2021-01-07 17:13:46'),
(209, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'4755ff6d0d6cb5da.jpg\', \'1\', \'factory2FORRender4fixCut.jpg\', 999, \'pending\' )', '2021-01-07 17:13:59'),
(210, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'5645ff6d0de37e41.jpg\', \'1\', \'FinalMixCut2.jpg\', 999, \'pending\' )', '2021-01-07 17:14:07'),
(211, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'3975ff6d0e66a9ca.jpg\', \'1\', \'13320436_1723031291289595_8399467170437329242_o.jpg\', 999, \'pending\' )', '2021-01-07 17:14:14'),
(212, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'8965ff6d0ef5becf.jpg\', \'1\', \'13133220_1707811726144885_5944868160778005026_nCut.jpg\', 999, \'pending\' )', '2021-01-07 17:14:23'),
(213, 'admin', 'gallery', 'delete-album-item', 'DELETE FROM dc_gallery_attach WHERE id = \'12\'', '2021-01-07 17:14:57'),
(214, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'4575ff6d11deb738.jpg\', \'1\', \'DSC00574.jpg\', 999, \'pending\' )', '2021-01-07 17:15:10'),
(215, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'5085ff6d13508483.jpg\', \'1\', \'superSrf3fix.jpg\', 999, \'pending\' )', '2021-01-07 17:15:33'),
(216, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'8895ff6d1453ce46.jpg\', \'1\', \'cover.jpg\', 999, \'pending\' )', '2021-01-07 17:15:49'),
(217, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'865ff6d1860de7d.jpg\', \'1\', \'DDD5cut.jpg\', 999, \'pending\' )', '2021-01-07 17:16:54'),
(218, 'admin', 'project', 'insert', 'INSERT INTO dc_project(title_zh,title_en,category,display,contents_zh,contents_en) VALUES (\'\',\'Generative Pts\',3,\'1\',\'\',\'\')', '2021-01-10 21:50:43'),
(219, 'admin', 'project', 'upload', 'SELECT dc_project_cat.id,dc_project_cat.parent,COUNT(dc_project.id) AS count,dc_project_cat.title_zh,dc_project_cat.title_en FROM dc_project_cat LEFT JOIN dc_project ON (dc_project_cat.id = dc_project.category OR FIND_IN_SET(dc_project_cat.id, dc_project.category) ) GROUP BY dc_project_cat.id ORDER BY dc_project_cat.ord ASC, id ASC', '2021-01-10 21:50:50'),
(220, 'admin', 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'9585ffb07552a22e_72_0_720_720.jpg\' WHERE path = \'3175ffb06e14a4fd.jpg\'', '2021-01-10 21:55:33'),
(221, 'admin', 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'815ffb0768330f2_96_29_676_676.jpg\' WHERE path = \'9585ffb07552a22e_72_0_720_720.jpg\'', '2021-01-10 21:55:52'),
(222, 'admin', 'project', 'insert-category', 'INSERT INTO dc_project_cat(title_zh,title_en) VALUES (\'\',\'ANIMAL\')', '2021-01-11 22:27:11'),
(223, 'admin', 'project', 'delete-category', 'UPDATE dc_project SET category = \"\" WHERE category = \'3\'', '2021-01-11 22:33:27'),
(224, 'admin', 'project', 'delete-category', 'UPDATE dc_project SET category = \"\" WHERE category = \'5\'', '2021-01-11 22:33:48'),
(225, 'admin', 'project', 'insert-category', 'INSERT INTO dc_project_cat(title_zh,title_en) VALUES (\'\',\'Code\')', '2021-01-11 22:34:16'),
(226, 'admin', 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'程式撰寫\',title_en = \'Code\' WHERE id = \'6\'', '2021-01-11 22:35:38'),
(227, 'admin', 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'運算設計\',title_en = \'Computation Design\' WHERE id = \'4\'', '2021-01-11 22:35:54'),
(228, 'admin', 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'建築\',title_en = \'Architecture\' WHERE id = \'1\'', '2021-01-11 22:36:07'),
(229, 'admin', 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'室內/其他\',title_en = \'Interior/Other\' WHERE id = \'2\'', '2021-01-11 22:36:22'),
(230, 'admin', 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'程式撰寫\',title_en = \'Code\' WHERE id = \'6\'', '2021-01-11 22:41:39'),
(231, 'admin', 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'運算設計\',title_en = \'Computation Design\' WHERE id = \'4\'', '2021-01-11 22:41:46'),
(232, 'admin', 'project', 'insert-category', 'INSERT INTO dc_project_cat(title_zh,title_en) VALUES (\'\',\'Afador\')', '2021-01-11 22:42:26'),
(233, 'admin', 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'7\'', '2021-01-11 22:44:23'),
(234, 'admin', 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2021-01-11 22:44:32'),
(235, 'admin', 'project', 'delete-category', 'UPDATE dc_project SET category = \"\" WHERE category = \'7\'', '2021-01-11 22:45:58'),
(236, 'admin', 'project', 'insert-category', 'INSERT INTO dc_project_cat(title_zh,title_en) VALUES (\'\',\'Afador\')', '2021-01-11 22:47:31'),
(237, 'admin', 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2021-01-11 22:48:05'),
(238, 'admin', 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2021-01-11 22:50:39'),
(239, 'admin', 'project', 'delete-category', 'UPDATE dc_project SET category = \"\" WHERE category = \'8\'', '2021-01-11 23:09:48'),
(240, 'admin', 'project', 'insert-category', 'INSERT INTO dc_project_cat(title_zh,title_en) VALUES (\'\',\'Afador\')', '2021-01-12 01:02:18'),
(241, 'admin', 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2021-01-12 01:02:25'),
(242, 'admin', 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'9\'', '2021-01-12 01:02:29'),
(243, 'admin', 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2021-01-12 01:02:33'),
(244, 'admin', 'project', 'delete-category', 'UPDATE dc_project SET category = \"\" WHERE category = \'9\'', '2021-01-12 01:02:41'),
(245, 'admin', 'gallery', 'insert', 'INSERT INTO dc_gallery(title_zh,title_en) VALUES (\'\',\'Afador\')', '2021-01-15 01:07:56'),
(246, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'41960030950b6ff5.jpg\', \'1\', \'8895ff6d1453ce46.jpg\', 999, \'pending\' )', '2021-01-16 23:42:09'),
(247, 'admin', 'gallery', 'upload', NULL, '2021-01-17 02:08:27'),
(248, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'27260032baaf1463.jpg\', \'1\', \'12104snow.jpg\', 999, \'pending\' )', '2021-01-17 02:08:43'),
(249, 'admin', 'gallery', 'sort-album-item', 'UPDATE dc_gallery_attach SET ord = \'9\' WHERE id = \'17\'', '2021-01-17 02:10:06'),
(250, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'47360032cb9d40c1.jpg\', \'1\', \'0712xxx.jpg\', 999, \'pending\' )', '2021-01-17 02:13:14'),
(251, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'16760032e36c98ed_158_190_2090_940.jpg\' WHERE path = \'47360032cb9d40c1.jpg\'', '2021-01-17 02:19:34'),
(252, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'93760032e4598cc1_0_220_3542_1870.jpg\' WHERE path = \'3245ff6d0c912895.jpg\'', '2021-01-17 02:19:49'),
(253, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'88960032e6c82573_0_233_7051_4733.jpg\' WHERE path = \'5645ff6d0de37e41.jpg\'', '2021-01-17 02:20:28'),
(254, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'9960032e6c849df_0_233_7051_4733.jpg\' WHERE path = \'5645ff6d0de37e41.jpg\'', '2021-01-17 02:20:28'),
(255, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'87260032ea43b513_345_89_1744_1047.jpg\' WHERE path = \'27260032baaf1463.jpg\'', '2021-01-17 02:21:24'),
(256, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'8360032ed88f800_0_80_786_581.jpg\' WHERE path = \'865ff6d1860de7d.jpg\'', '2021-01-17 02:22:16'),
(257, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'78560032f455f9f7_0_1423_7051_3542.jpg\' WHERE path = \'88960032e6c82573_0_233_7051_4733.jpg\'', '2021-01-17 02:24:05'),
(258, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'97460032f6e03774_167_363_1512_887.jpg\' WHERE path = \'5085ff6d13508483.jpg\'', '2021-01-17 02:24:46'),
(259, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'15060032f8a731c2_0_167_786_434.jpg\' WHERE path = \'8360032ed88f800_0_80_786_581.jpg\'', '2021-01-17 02:25:14'),
(260, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'54360032fb08180c_0_53_853_404.jpg\' WHERE path = \'3975ff6d0e66a9ca.jpg\'', '2021-01-17 02:25:52'),
(261, 'admin', 'gallery', 'sort-album-item', 'UPDATE dc_gallery_attach SET ord = \'10\' WHERE id = \'19\'', '2021-01-17 02:27:28'),
(262, 'admin', 'gallery', 'sort-album-item', 'UPDATE dc_gallery_attach SET ord = \'10\' WHERE id = \'9\'', '2021-01-17 02:27:37'),
(263, 'admin', 'gallery', 'sort-album-item', 'UPDATE dc_gallery_attach SET ord = \'10\' WHERE id = \'9\'', '2021-01-17 02:27:51'),
(264, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'2456003314fdc549.jpg\', \'1\', \'0704ren2.jpg\', 999, \'pending\' )', '2021-01-17 02:32:48'),
(265, 'admin', 'gallery', 'sort-album-item', 'UPDATE dc_gallery_attach SET ord = \'11\' WHERE id = \'9\'', '2021-01-17 02:33:03'),
(266, 'admin', 'gallery', 'delete-album-item', 'DELETE FROM dc_gallery_attach WHERE id = \'19\'', '2021-01-17 02:33:38'),
(267, 'admin', 'gallery', 'upload', 'INSERT INTO dc_gallery_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'437600331d657af5.jpg\', \'1\', \'finalRen.jpg\', 999, \'pending\' )', '2021-01-17 02:35:02'),
(268, 'admin', 'gallery', 'sort-album-item', 'UPDATE dc_gallery_attach SET ord = \'11\' WHERE id = \'9\'', '2021-01-17 02:35:24'),
(269, 'admin', 'gallery', 'sort-album-item', 'UPDATE dc_gallery_attach SET ord = \'11\' WHERE id = \'9\'', '2021-01-17 02:36:01'),
(270, 'admin', 'gallery', 'crop-image', 'UPDATE dc_gallery_attach SET path = \'7526003322764b68_0_52_1819_774.jpg\' WHERE path = \'437600331d657af5.jpg\'', '2021-01-17 02:36:23'),
(271, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'161\'', '2021-01-17 22:55:32'),
(272, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'0\' WHERE id = \'161\'', '2021-01-17 22:55:35'),
(273, 'admin', 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'356600450126984c_322_-1_1203_1203.jpg\' WHERE path = \'2765ff3471cd3dd0.jpg\'', '2021-01-17 22:56:18'),
(274, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'161\'', '2021-01-17 22:56:21'),
(275, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'0\' WHERE id = \'161\'', '2021-01-17 22:56:23'),
(276, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'161\'', '2021-01-17 22:56:42'),
(277, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'0\' WHERE id = \'161\'', '2021-01-17 22:56:45'),
(278, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'161\'', '2021-01-17 22:56:57'),
(279, 'admin', 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'0\' WHERE id = \'161\'', '2021-01-17 22:57:00'),
(280, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'95260065de5ee524_69_115_1785_1185.jpg\' WHERE path = \'3465ff3438090cfe.jpg\'', '2021-01-19 12:19:50'),
(281, NULL, 'project', 'insert-category', 'INSERT INTO dc_project_cat(title_zh,title_en) VALUES (\'\',\'classics\')', '2021-01-19 12:26:31'),
(282, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2021-01-19 12:26:47'),
(283, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'10\'', '2021-01-19 12:26:54'),
(284, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2021-01-19 12:26:57'),
(285, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'典型\',title_en = \'classics\' WHERE id = \'10\'', '2021-01-19 12:27:50'),
(286, NULL, 'project', 'insert', 'INSERT INTO dc_project(title_zh,title_en,category,display,contents_zh,contents_en) VALUES (\'\',\'testClassic\',10,\'1\',\'\',\'\')', '2021-01-19 16:39:43'),
(287, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'38160069daa19d46.jpg\', \'21\', \'242020入住紀錄_210119_20.jpg\', 999, \'pending\' )', '2021-01-19 16:51:54'),
(288, NULL, 'project', 'insert', 'INSERT INTO dc_project(title_zh,title_en,category,display,contents_zh,contents_en) VALUES (\'\',\'Generative Pts\',6,\'1\',\'\',\'\')', '2021-01-19 16:54:27'),
(289, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'8960069ea36c58a.jpg\', \'22\', \'815ffb0768330f2_96_29_676_676.jpg\', 999, \'pending\' )', '2021-01-19 16:56:03'),
(290, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'14660069f9fceee2_101_38_1089_599.jpg\' WHERE path = \'8960069ea36c58a.jpg\'', '2021-01-19 17:00:15'),
(291, NULL, 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'177\'', '2021-01-19 17:00:19'),
(292, NULL, 'project', 'delete', 'DELETE FROM dc_project WHERE id = \'20\'', '2021-01-19 17:00:46'),
(293, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'7156006a820597be_0_154_737_881.jpg\' WHERE path = \'1735ff3472db75a2.jpg\'', '2021-01-19 17:36:32'),
(294, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'626009b367e8dfc.jpg\', \'21\', \'完工出租_210121_0.jpg\', 999, \'pending\' )', '2021-01-22 01:01:28'),
(295, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'7676009b36901d35.jpg\', \'21\', \'完工出租_210121_1.jpg\', 999, \'pending\' )', '2021-01-22 01:01:29'),
(296, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'6886009b36985ce1.jpg\', \'21\', \'完工出租_210121_3.jpg\', 999, \'pending\' )', '2021-01-22 01:01:30'),
(297, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'3946009b36a0a75d.jpg\', \'21\', \'完工出租_210121_4.jpg\', 999, \'pending\' )', '2021-01-22 01:01:30'),
(298, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'8766009b36a8545c.jpg\', \'21\', \'完工出租_210121_5.jpg\', 999, \'pending\' )', '2021-01-22 01:01:31'),
(299, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'9436009b36b0aeef.jpg\', \'21\', \'完工出租_210121_9.jpg\', 999, \'pending\' )', '2021-01-22 01:01:31'),
(300, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'2326009b36b7f173.jpg\', \'21\', \'完工出租_210121_10.jpg\', 999, \'pending\' )', '2021-01-22 01:01:31'),
(301, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'3196009b36c02654.jpg\', \'21\', \'完工出租_210121_12.jpg\', 999, \'pending\' )', '2021-01-22 01:01:32'),
(302, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'5286009b36c78e74.jpg\', \'21\', \'完工出租_210121_16.jpg\', 999, \'pending\' )', '2021-01-22 01:01:32'),
(303, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'7096009b36cf250e.jpg\', \'21\', \'完工出租_210121_17.jpg\', 999, \'pending\' )', '2021-01-22 01:01:33'),
(304, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'4616009b36d6f603.jpg\', \'21\', \'完工出租_210121_19.jpg\', 999, \'pending\' )', '2021-01-22 01:01:33'),
(305, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'2236009b36de3b2d.jpg\', \'21\', \'完工出租_210121_20.jpg\', 999, \'pending\' )', '2021-01-22 01:01:34'),
(306, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'2326009b36e584ef.jpg\', \'21\', \'完工出租_210121_22.jpg\', 999, \'pending\' )', '2021-01-22 01:01:34'),
(307, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'6206009b36ed0577.jpg\', \'21\', \'完工出租_210121_23.jpg\', 999, \'pending\' )', '2021-01-22 01:01:35'),
(308, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'9406009b36f4f94a.jpg\', \'21\', \'完工出租_210121_24.jpg\', 999, \'pending\' )', '2021-01-22 01:01:35'),
(309, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'6996009b36fbb902.jpg\', \'21\', \'完工出租_210121_25.jpg\', 999, \'pending\' )', '2021-01-22 01:01:36'),
(310, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'176\'', '2021-01-22 01:01:40'),
(311, NULL, 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'179\'', '2021-01-22 01:01:48'),
(312, NULL, 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'0\' WHERE id = \'179\'', '2021-01-22 01:01:51'),
(313, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'9666009bc2f318ff_276_342_1292_655.jpg\' WHERE path = \'356600450126984c_322_-1_1203_1203.jpg\'', '2021-01-22 01:38:55'),
(314, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'\',title_en = \'Taste Creative THU\',category = 10,display = \'1\',contents_zh = \'\',contents_en = \'\' WHERE id = \'15\'', '2021-01-22 14:19:31'),
(315, NULL, 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'1\' WHERE id = \'170\'', '2021-01-22 22:37:37'),
(316, NULL, 'project', 'set-album-cover', 'UPDATE dc_project_attach SET cover = \'0\' WHERE id = \'170\'', '2021-01-22 22:37:43'),
(317, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'613600d9b780475d_0_122_960_714.jpg\' WHERE path = \'1885ff33dca6e456.jpg\'', '2021-01-25 00:08:24'),
(318, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'481600d9b850fee4_0_110_860_637.jpg\' WHERE path = \'4125ff33dcab869a.jpg\'', '2021-01-25 00:08:37'),
(319, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'609600d9b905f26d_0_120_960_717.jpg\' WHERE path = \'8585ff33dcb0a38f.jpg\'', '2021-01-25 00:08:48'),
(320, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'249600d9ba24ed53_0_160_960_635.jpg\' WHERE path = \'3645ff33dcbddfef.jpg\'', '2021-01-25 00:09:06'),
(321, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'925600d9baee722b_162_0_637_959.jpg\' WHERE path = \'3465ff33dcc2f598.jpg\'', '2021-01-25 00:09:18'),
(322, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'66600d9bbe4b9e4_0_159_960_638.jpg\' WHERE path = \'4685ff33dcc7796b.jpg\'', '2021-01-25 00:09:34'),
(323, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'922600d9bd1077d9_0_181_1125_751.jpg\' WHERE path = \'5905ff33dcd0569d.jpg\'', '2021-01-25 00:09:53'),
(324, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'377600d9bde7a185_156_0_639_960.jpg\' WHERE path = \'995ff33dcd644ba.jpg\'', '2021-01-25 00:10:06'),
(325, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'91\'', '2021-01-25 00:10:28'),
(326, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'174\'', '2021-01-25 00:10:34'),
(327, NULL, 'project', 'sort-album-item', 'UPDATE dc_project_attach SET ord = \'16\' WHERE id = \'93\'', '2021-01-25 00:11:28'),
(328, NULL, 'project', 'sort-album-item', 'UPDATE dc_project_attach SET ord = \'16\' WHERE id = \'93\'', '2021-01-25 22:34:09'),
(329, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'81\'', '2021-01-25 22:34:33'),
(330, NULL, 'project', 'sort-album-item', 'UPDATE dc_project_attach SET ord = \'15\' WHERE id = \'93\'', '2021-01-25 22:35:08'),
(331, NULL, 'project', 'sort-album-item', 'UPDATE dc_project_attach SET ord = \'15\' WHERE id = \'93\'', '2021-01-25 22:35:37'),
(332, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'679600ed7850062a_43_0_1347_794.jpg\' WHERE path = \'5905ff343285ee32.jpg\'', '2021-01-25 22:36:53'),
(333, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'531600ed7b49297a_69_115_1785_1185.jpg\' WHERE path = \'95260065de5ee524_69_115_1785_1185.jpg\'', '2021-01-25 22:37:40'),
(334, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'177\'', '2021-01-26 15:31:37'),
(335, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'100600ff78999d8a.jpg\', \'22\', \'weaving2.jpg\', 999, \'pending\' )', '2021-01-26 19:05:46'),
(336, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'Nullam iaculis augue sed sapien rutrum blandit. Aliquam ac dignissim quam. Vivamus scelerisque pulvinar enim, quis sollicitudin sapien cursus a. Sed feugiat metus ac metus tristique, non feugiat eros placerat. Proin ac ultrices lacus. Aenean orci leo, iaculis quis dignissim et, luctus eu nisi. Proin in vulputate ligula. Donec dapibus justo non tellus dignissim sodales. Nullam volutpat dolor consequat, placerat nibh eu, ornare arcu. Nunc odio metus, vestibulum at mi non, ullamcorper condimentum ligula. Ut in ligula scelerisque, eleifend nulla eu, elementum quam. Suspendisse convallis nisi a risus cursus, et faucibus urna venenatis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam ut congue mi. Pellentesque congue, massa sed bibendum lobortis, lorem arcu rutrum augue, ut pharetra metus odio nec tellus.\' WHERE id = \'1\'', '2021-01-29 16:10:59'),
(337, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'Nullam iaculis augue sed sapien rutrum blandit. Aliquam ac dignissim quam. Vivamus scelerisque pulvinar enim, quis sollicitudin sapien cursus a. Sed feugiat metus ac metus tristique, non feugiat eros placerat. Proin ac ultrices lacus. Aenean orci leo, iaculis quis dignissim et, luctus eu nisi. Proin in vulputate ligula. Donec dapibus justo non tellus dignissim sodales. Nullam volutpat dolor consequat, placerat nibh eu, ornare arcu. Nunc odio metus, vestibulum at mi non, ullamcorper condimentum ligula. Ut in ligula scelerisque, eleifend nulla eu, elementum quam. Suspendisse convallis nisi a risus cursus, et faucibus urna venenatis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam ut congue mi. Pellentesque congue, massa sed bibendum lobortis, lorem arcu rutrum augue, ut pharetra metus odio nec tellus.\' WHERE id = \'1\'', '2021-01-29 16:14:28'),
(338, NULL, 'about', 'update', 'SELECT * FROM dc_about      ORDER BY ord ASC LIMIT 0,1', '2021-01-29 16:47:15'),
(339, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line.<br><br>The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, web, UI and UX, art, and meanwhile, of course, trying to survive : )<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\' WHERE id = \'1\'', '2021-01-29 16:51:50'),
(340, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line.<br><br>The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, web, UI and UX, art, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture, programming and art, but relatively, eager to crave the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 17:08:50'),
(341, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line.<br>The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, web, UI and UX, art, and meanwhile, of course, trying to survive : )<br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture, programming and art, but relatively, eager to crave the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 17:32:17'),
(342, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, web, UI and UX, art, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture, programming and art, but relatively, eager to crave the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 17:32:49'),
(343, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to crave the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 17:35:08'),
(344, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由建築設計出身，程序猿上身的一群跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 17:38:24'),
(345, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由一群建築出身，程序猿上身的跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 17:39:30'),
(346, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。<br><br>工作室主要由一群建築出身，程序猿上身的跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。同時當然，也嘗試著在這苦勞的設計領域把創作與現實結合最大化。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 17:46:03'),
(347, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'太極綠洲\',title_en = \'TaiJi Oasis\',category = 1,display = \'1\',contents_zh = \'此案由東海大學 邱浩修 教授, 共同創作。王銘鴻建築師事務所擁有。為一住商混和大樓。\',contents_en = \'\' WHERE id = \'8\'', '2021-01-29 17:52:09'),
(348, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'太極綠洲\',title_en = \'TaiJi Oasis\',category = 1,display = \'1\',contents_zh = \'此案由東海大學 邱浩修 教授, 共同創作。王銘鴻建築師事務所擁有。為一住商混和大樓。\',contents_en = \'\' WHERE id = \'8\'', '2021-01-29 17:52:18'),
(349, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'太極綠洲\',title_en = \'TaiJi Oasis\',category = 1,display = \'1\',contents_zh = \'此案由東海大學 邱浩修 教授, 共同創作。王銘鴻建築師事務所擁有。為一住商混和大樓。\',contents_en = \'The TaiJi Oasis is a mix used skyscraper, which co-designed with Prof. Hao-Hsiu Chiu. Own by Ming-Hong Wang architect.\' WHERE id = \'8\'', '2021-01-29 17:55:54'),
(350, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'\',title_en = \'Arena\',category = 1,display = \'1\',contents_zh = \'\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'19\'', '2021-01-29 17:57:02'),
(351, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'\',title_en = \'Arena\',category = 1,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'19\'', '2021-01-29 17:57:18'),
(352, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'高雄鳳山 蔡宅\',title_en = \'testClassic\',category = 10,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'\' WHERE id = \'21\'', '2021-01-29 18:05:51'),
(353, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'高雄鳳山 蔡宅\',title_en = \'TSAI house\',category = 10,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'21\'', '2021-01-29 18:07:46'),
(354, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'\',title_en = \'Song\',category = 2,display = \'1\',contents_zh = \'\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'17\'', '2021-01-29 18:08:01'),
(355, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'頌\',title_en = \'Song\',category = 2,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'17\'', '2021-01-29 18:08:19'),
(356, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'頌\',title_en = \'Song\',category = 2,display = \'1\',contents_zh = \'此系列為風雅頌三組六件作品其中一組, 共同創作者: 東海大學 邱浩修老師<br>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'17\'', '2021-01-29 18:09:43'),
(357, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'\',title_en = \'Feng\',category = 2,display = \'1\',contents_zh = \'\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'16\'', '2021-01-29 18:09:57'),
(358, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'風\',title_en = \'Feng\',category = 2,display = \'1\',contents_zh = \'此為風雅頌三組六件作品其中一組, 共同創作者 東海大學 邱浩修 教授<br>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'16\'', '2021-01-29 18:10:45'),
(359, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'品樂東海\',title_en = \'Taste Creative THU\',category = 10,display = \'1\',contents_zh = \'品樂東海為東海大學育成中心展場規劃設計作品, 共同創作者 賴可謙設計師。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'15\'', '2021-01-29 18:12:07');
INSERT INTO `dc_log` (`id`, `admin`, `page`, `action`, `message`, `create_time`) VALUES
(360, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'編織公車站\',title_en = \'Woven Bus Station\',category = 2,display = \'1\',contents_zh = \'運用運算建模技巧, 結合竹材料特性創作之對未來公車停靠站空間想像。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'14\'', '2021-01-29 18:14:16'),
(361, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'捕捉器工廠-雨捕捉器\',title_en = \'Catchers Factory Concept - Water catcher\',category = 1,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'13\'', '2021-01-29 18:16:12'),
(362, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'台灣塔-凝\',title_en = \'Taiwan Tower - Ning\',category = 1,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'12\'', '2021-01-29 18:17:05'),
(363, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'\',title_en = \'Super Surface\',category = 2,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'11\'', '2021-01-29 18:17:44'),
(364, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION = THE MOBIUS + CREATION，莫比設計 取自莫比烏斯環的形意而來，為一條無限持續沒有盡頭的環。工作室主要由一群建築出身，程序猿上身的跨領域設計者組成。 在過去的專案中，莫比致力於結合空間運算 建築 平面 網站前後端 UI UX 互動藝術為發展領域，把所學之型態與計算機概念推之極限。同時當然，也嘗試著在這苦勞的設計領域把創作與現實結合最大化。<br><br>縱使至今超過六年的累積，我們也很難定義莫比的專案領域，只能說一直介於建築 程式語言 與藝術之間，但也相對的期望在未來每次的合作專案中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-29 18:18:08'),
(365, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'漣漪磚牆\',title_en = \'Ripple Wall\',category = 2,display = \'1\',contents_zh = \'現存於東海大學女生宿舍正門意象。共同創作者: 東海大學 邱浩修教授, 趨境聯合設計工程 丁奕理主持設計師。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'10\'', '2021-01-29 18:20:56'),
(366, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'媽咪醬親子餐廳\',title_en = \'MoneyJump Family Restaurant\',category = 2,display = \'1\',contents_zh = \'現存於台灣台北市內湖區。\',contents_en = \'。\' WHERE id = \'9\'', '2021-01-29 18:23:47'),
(367, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'媽咪醬親子餐廳\',title_en = \'MoneyJump Family Restaurant\',category = 2,display = \'1\',contents_zh = \'現存於台灣台北市內湖區。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'9\'', '2021-01-29 18:24:12'),
(368, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'媽咪醬親子餐廳\',title_en = \'MoneyJump Family Restaurant\',category = 2,display = \'1\',contents_zh = \'現存於台灣台北市內湖區，為一百坪空間網紅親子餐廳。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'9\'', '2021-01-29 18:25:10'),
(369, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'工廠設計 - 台灣彰化\',title_en = \'F2O Factory\',category = 10,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.<br><br>\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'6\'', '2021-01-29 18:27:44'),
(370, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'TVM工廠立面設計 - 德國\',title_en = \'TVM Facade \',category = 1,display = \'1\',contents_zh = \'此為林友寒建築師合作設計案, 莫比設計負責建築表皮磚牆運算。\',contents_en = \'Own by Behet Bondzio Lin Architekten, Germany.\' WHERE id = \'5\'', '2021-01-29 18:30:39'),
(371, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'雲門舞集 - 淡水\',title_en = \'Cloud Gate Gallery\',category = 1,display = \'1\',contents_zh = \'現存台灣淡水之雲門舞集場館, 莫比設計負責初步建築金屬皮層構築分析 重建 與相關幾何估算。\',contents_en = \'Cloud Gate Gallery, an art performing group in Taiwan. The Mobiusation is responsible for the cladding analysis and fabrication of the building skin.\' WHERE id = \'18\'', '2021-01-29 18:34:04'),
(372, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'程式藝術作品\',title_en = \'Generative Pts\',category = 6,display = \'1\',contents_zh = \'Cloud Gate Gallery\',contents_en = \'\' WHERE id = \'22\'', '2021-01-29 18:34:52'),
(373, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'程式藝術作品\',title_en = \'Generative Pts\',category = 6,display = \'1\',contents_zh = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.<br><br>\' WHERE id = \'22\'', '2021-01-29 18:35:14'),
(374, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 取自莫比烏斯環的形意而來。我們認為不斷碰撞修正的過程即是設計, 如一條無限延續無盡的環。莫比創意工作室主要由一群跨建築與程式領域的設計者組成，致力於結合空間設計、 程式運算、平面設計、網站與互動經驗，把型態與計算機概念推之極限。專案累積迄今超過六年，但我們依然不去定義莫比的軌跡，而是不斷的在空間、藝術、與程式語言之間探索，嘗試在每次的合作中不受侷限，找出未曾出現過的可能性。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-30 01:27:09'),
(375, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計 程式運算 平面 網站 與 互動經驗，將所學之型態設計與計算機概念推之極限。<br>縱使迄今超過六年的專案累積，但我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次的合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-30 10:13:33'),
(376, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計 程式運算 平面 網站 與 互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，但我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次的合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-30 10:13:57'),
(377, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計 程式運算 平面 網站 與 互動經驗，將所學之型態設計與計算機概念推之極限。迄今超過六年的專案累積，但我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次的合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-30 10:24:07'),
(378, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計 程式運算 平面 網站 與 互動經驗，將所學之型態設計與計算機概念推之極限。迄今超過六年的專案累積，但我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-30 10:25:35'),
(379, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站, 與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION = THE MOBIUS + CREATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to joint and push the limit on computation, architecture, art, web, UI and UX, and meanwhile, of course, trying to survive : )<br><br>Although we have done a number of projects over six years, still hard to define what we do. Somewhere between architecture/programming/art, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.\' WHERE id = \'1\'', '2021-01-30 23:14:01'),
(380, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站, 與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'THEMOBIUSATION, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to push the limit of jointing space, programming, art, web, UI and UX.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture/programming/art to date, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.<br><br>THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站, 與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\' WHERE id = \'1\'', '2021-01-30 23:37:20'),
(381, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站, 與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, as a path that unlimited as well as without the end of the line. &nbsp;The studio is composed of a group of interdisciplinary designers who are specialized in architecture and programming. Within the past projects, the Mobiusation aims to push the limit of integrating space, programming, art, web, UI and UX.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture/programming/art to date, but relatively, eager to carve the way unrestrictedly that we have never seen in the future.<br><br>THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站, 與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\' WHERE id = \'1\'', '2021-01-30 23:41:36'),
(382, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站, 與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Within the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture/programming/art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2021-01-30 23:52:54'),
(383, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站, 與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture/programming/art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2021-01-30 23:54:25'),
(384, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture/programming/art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2021-01-30 23:59:14'),
(385, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2021-01-31 01:21:15'),
(386, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2021-01-31 01:58:05'),
(387, NULL, 'settings', 'update', 'UPDATE dc_settings SET meta_title_zh = \'THEMOBIUSATION\',meta_title_en = \'THEMOBIUSATION\',meta_keywords_zh = \'\',meta_keywords_en = \'\',meta_description_zh = \'\',meta_description_en = \'\' WHERE id = \'1\'', '2021-02-03 12:51:12'),
(388, NULL, 'settings', 'update', 'UPDATE dc_settings SET address_zh = \'803 高雄市鹽埕區大勇路11號3樓308室\',address_en = \'\',phone = \'0988378769\',email = \'waterblue4019@hotmail.com\',facebook = \'\' WHERE id = \'1\'', '2022-01-02 17:15:48'),
(389, NULL, 'settings', 'update', 'UPDATE dc_settings SET address_zh = \'803 高雄市鹽埕區大勇路11號3樓308室\',address_en = \'Room 308, 3rd Floor, No. 11 Dayong Road, Yancheng District, Kaohsiung City, 803\',phone = \'0988378769\',email = \'waterblue4019@hotmail.com\',facebook = \'\' WHERE id = \'1\'', '2022-01-02 17:16:56'),
(390, NULL, 'settings', 'update', 'UPDATE dc_settings SET mail_sender = \'dagoolasoul3@gmail.com\',mail_receiver = \'waterblue4019@hotmail.com\',mail_from = \'THEMOBIUSATION\',mail_signature = \'<a href=\\\"http://dozencreation.com\\\" target=\\\"_blank\\\">Dozencreation</a><br>0937853024\',smtp_status = \'0\',smtp_host = \'smtp.gmail.com\',smtp_port = \'587\',smtp_secure = \'tls\',smtp_account = \'dozencreation.mailer@gmail.com\' WHERE id = \'1\'', '2022-01-02 17:20:25'),
(391, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'媽咪醬親子餐廳\',title_en = \'MoneyJump Family Restaurant\',category = 2,display = \'1\',contents_zh = \'此親子餐廳位於台北內湖，此設計案為典型數位構築案例。與傳統設計從平面套圖探討相反，在空間丈量完成之後，一切由三維繪圖軟體犀牛建構數位模型為主，讓所有造型精準的沿著空間而生。模型完成之後分解，編號，送CNC場切割，最後只需要工匠至現場按編號組裝， 猶如宜家家具DIY概念般，一切在電腦三維製作時期造至造就精準拿捏。此案掛名晴時禾方設計公司所有, 但主體設計為當時本人在職時期一人負責。 \',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'9\'', '2022-01-02 18:38:11'),
(392, NULL, 'project', 'insert', 'INSERT INTO dc_project(title_zh,title_en,category,display,contents_zh,contents_en) VALUES (\'楷模創生館\',\'MODEL CREATION HALL\',2,\'1\',\'此創生館為概念競圖時期設計，為2018年台中花博覽館場館之一。概念來自於創業楷模數十年如一日，永存在心中的創業家精神。旱地中拔地而起，撐起一片天。雖然其中有著各樣的困難與挑戰，也能在其之間，靠著實力與打拚的精神扭轉乾坤，勇往直前無退縮。縱使後來因預算胎死腹中，但在當時實務上為一結構創新設計，承重只有圖中接地一處，鋼構與皮層由電腦三為運算與模擬詳細尺寸，從粗到細從接地處延伸，以達到貌似懸浮於空中的視覺衝擊感。\',\'\')', '2022-01-02 18:39:59'),
(393, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'8561d18106642e1.jpg\', \'23\', \'2456003314fdc549.jpg\', 999, \'pending\' )', '2022-01-02 18:40:06'),
(394, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'\',title_en = \'Arena\',category = 1,display = \'1\',contents_zh = \'此案為概念設計，場館基本規劃為一樓游泳池，二樓辦公空間，三樓羽球場，側面觀眾台臨操場。設計重點在於建築皮層運算對於陽光入射角度於建物室內的開闔調節，以達到最有效化自然光照與自然風對流效果。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'19\'', '2022-01-02 18:40:32'),
(395, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'廣州運動場館\',title_en = \'GUANGZHOU ARENA\',category = 1,display = \'1\',contents_zh = \'此案為概念設計，場館基本規劃為一樓游泳池，二樓辦公空間，三樓羽球場，側面觀眾台臨操場。設計重點在於建築皮層運算對於陽光入射角度於建物室內的開闔調節，以達到最有效化自然光照與自然風對流效果。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'19\'', '2022-01-02 18:41:37'),
(396, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'西北紡織服裝協會館\',title_en = \'TVM Facade \',category = 1,display = \'1\',contents_zh = \'此案為林友寒建築師作品，莫比創意當時負責外牆紅磚數位運算、三維建模與放樣之相關電腦工作。 胚藤部分用了幾張黑白照片為基礎，利用不同色階數值以控制磚塊旋轉角度。林友寒建築師於德國的事務所為了此案已開發出五種不同角度之紅磚與試體，搭配我們的程式運算出圖，最終達到此效果。\',contents_en = \'Own by Behet Bondzio Lin Architekten, Germany.\' WHERE id = \'5\'', '2022-01-02 18:42:33'),
(397, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'淡水雲門舞集會館\',title_en = \'CLOUD GATE GALLERY\',category = 1,display = \'1\',contents_zh = \'此案為黃聲遠建築師作品，莫比負責屋頂曲面建構、修改、模矩化切片分析、模擬放樣等三維電腦工作。本案的技術難度在於屋頂曲面為自由曲面，在建模初期就得花很多心力在分割曲面與重建上，因為當曲面非常不規則、細部分常不平滑的時候，會導致後期模矩化分析與切割失敗，且在重建過程中，還需要高度貼合現場已完成的鋼構支撐。曲面重建分割完成之後，切割模矩化由程式軟體Grasshopper來完成。\\r\\n\',contents_en = \'Cloud Gate Gallery, an art performing group in Taiwan. The Mobiusation is responsible for the cladding analysis and fabrication of the building skin.\' WHERE id = \'18\'', '2022-01-02 18:43:49'),
(398, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'漣漪磚牆\',title_en = \'Ripple Wall\',category = 2,display = \'1\',contents_zh = \'此案為台中東海大學女生宿舍門口，交誼廳空間重建工程之一，磚牆背面即面交誼廳落地窗。不同於舊東海女宿混凝土磚牆連續帶，我們取水波漣漪之概念，期望能用數位運算工具，結合東海建築群內舊有紅磚材料，構築一個傳統元素加以現代表現法的設計。在這之中，經典紅磚牆給人穩重內斂的形象，但在這次的設計中，整個紅磚視覺感受是流動、柔軟且有張力的。功能上，也藉由參數調整磚與磚之間的距離，以達到背面聯誼空間有自然光入射與空氣流通的作用。也讓會客聯誼空間與落地窗面有一幅漣漪流動的美畫。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'10\'', '2022-01-02 18:44:37'),
(399, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'台灣塔-凝\',title_en = \'TAIWAN TOWER- NING\',category = 1,display = \'1\',contents_zh = \'台灣塔為2012年台中水湳機場重建計畫之概念競圖案，為當時學生時期組隊參加之作品，最終在近三百組國際參賽者中獲得優選，為當時十二個獎項中，學生唯二得獎，台灣唯三入選之作品。莫比創意在其中擔任主要三維建模設計之角色。台灣塔取自台灣第一高山玉山之不屈不撓迎風而上之精神，以風、水、結晶三個概念來作為基地內強風、雨水回收、與塔上空間的思考延伸。版面渲染皆為團隊成果。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'12\'', '2022-01-02 18:45:30'),
(400, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'風雅頌青銅器 - 頌\',title_en = \'FENG-YA-SONG Bronze\',category = 2,display = \'1\',contents_zh = \'風雅頌為莫比與東海建築系邱浩修老師合作開發之作品，風-雅-頌共三組六件青銅器，皆取自詩經風雅頌恣意形象概念而發開。風，輕盈而自由，變幻無常。雅，優雅而恬靜內斂，不張牙五爪。頌，霸氣複雜，拔地而起。 作品照片唯獨風與頌，為莫比負責設計，雅為邱浩修老師設計。六件作品皆為三維粉末列印(右圖白色)之後交由青銅器廠商翻模，也是一傳統工法結合現代工法的實驗作品。此案技術難點在於三維列印並沒有翻模、拔模、脫模的限制，但製作青銅器卻有，於是得考慮設計過程中之脫模拔模開口與胚藤大小等等限制以達到最佳解。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'17\'', '2022-01-02 18:46:48'),
(401, NULL, 'project', 'insert', 'INSERT INTO dc_project(title_zh,title_en,category,display,contents_zh,contents_en) VALUES (\'杭州宴家花園\',\'YEN-CHIA MEGA GARDEN\',2,\'1\',\'宴家花園為一百公頃花園總體規劃概念設計案。莫比負責基地內所有植栽、建物、遊具、花園、廊帶，入口意象等等一切規劃設計，包括最終由Lumion軟體渲染動畫，為期半年。為莫比創意團隊之規劃設計、三維建模、後期渲染動畫出圖等綜合能力展現。觀看影片 請連結右下youtube連結。\',\'\')', '2022-01-02 18:47:45'),
(402, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'74061d183b26dd0f.png\', \'24\', \'12104snow-cut.png\', 999, \'pending\' )', '2022-01-02 18:51:31'),
(403, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'高雄鳳山 - 蔡宅\',title_en = \'HOUSE TSAI \',category = 10,display = \'1\',contents_zh = \'此案業主位於高雄鳳山，為一四十年五樓公寓老舊建物翻修案，為期約十個月。原始案場十分老舊，包括所有電水管線、地平不均等等幾乎需要整個砍掉重練。走微工業風格。照片展示整修前、後對比。為莫比少數整體室內設計修改案例。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'21\'', '2022-01-02 18:54:07'),
(404, NULL, 'project', 'update', 'UPDATE dc_project SET title_zh = \'編織公車站\',title_en = \'WOVEN BUS STATION\',category = 2,display = \'1\',contents_zh = \'編織公車站為當時台中市公車站競圖作品，以數位軟體模擬方法針對竹子材料做實驗性發想。竹子彈性大、堅韌、環保，在東南亞泰國等地有許多實驗性建築師以竹為材料構築建築物。莫比以三維軟體Rhino模擬與探討竹材料的最大最小彎曲度，編織密度等，來對應真實遮風擋雨功能，思考構築一環保公車站。\',contents_en = \'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\\\'s De Finibus Bonorum et Malorum for use in a type specimen book.\' WHERE id = \'14\'', '2022-01-02 18:54:38'),
(405, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'運算設計\',title_en = \'COMPUTATION\' WHERE id = \'4\'', '2022-01-02 23:13:20'),
(406, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'典型\',title_en = \'CLASSIC\' WHERE id = \'10\'', '2022-01-02 23:13:37'),
(407, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:13:42'),
(408, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'程式撰寫\',title_en = \'CODE\' WHERE id = \'6\'', '2022-01-02 23:13:49'),
(409, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'建築\',title_en = \'ARCHITECTURE\' WHERE id = \'1\'', '2022-01-02 23:14:01'),
(410, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:14:04'),
(411, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'室內/其他\',title_en = \'INTERIOR / OTHER\' WHERE id = \'2\'', '2022-01-02 23:14:44'),
(412, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:17:47'),
(413, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:17:51'),
(414, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:17:52'),
(415, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:18:04'),
(416, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'2\'', '2022-01-02 23:18:13'),
(417, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:18:18'),
(418, NULL, 'project', 'sort-category', 'UPDATE dc_project_cat SET parent=\'0\', ord=\'5\' WHERE id=\'6\'', '2022-01-02 23:18:58'),
(419, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'程式撰寫\',title_en = \'CODE ART\' WHERE id = \'6\'', '2022-01-03 13:40:03'),
(420, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'編程創作\',title_en = \'CODE ART\' WHERE id = \'6\'', '2022-01-03 14:02:36'),
(421, NULL, 'project', 'update-category', 'UPDATE dc_project_cat SET title_zh = \'編程創作\',title_en = \'CODE WORK\' WHERE id = \'6\'', '2022-01-03 14:32:36'),
(422, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web visualization.<br><br>Although we have done a number of projects for over six years, we would still rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2022-01-04 11:17:42'),
(423, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過六年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web visualization.<br><br>Although we have done a number of projects for over six years, we would rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2022-01-04 11:18:51'),
(424, NULL, 'about', 'update', 'UPDATE dc_about SET title_zh = \'摘要\',title_en = \'Summary\',contents_zh = \'THEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過八年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。\',contents_en = \'The Mobiusation, referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web visualization.<br><br>Although we have done a number of projects for over six years, we would rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.\' WHERE id = \'1\'', '2022-01-04 11:34:29'),
(425, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'103\'', '2022-01-04 18:16:50'),
(426, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'19961d41e95cd713.jpg\', \'10\', \'6705ff341f048840.jpg\', 999, \'pending\' )', '2022-01-04 18:16:54'),
(427, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'198\'', '2022-01-04 18:17:08'),
(428, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'76061d41eafe9bf3.jpg\', \'10\', \'6705ff341f048840.jpg\', 999, \'pending\' )', '2022-01-04 18:17:20'),
(429, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'199\'', '2022-01-04 18:17:23'),
(430, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'19061d41f08df541.jpg\', \'10\', \'6705ff341f048840.jpg\', 999, \'pending\' )', '2022-01-04 18:18:49'),
(431, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'60661d41f22719df_0_0_849_1279.jpg\' WHERE path = \'19061d41f08df541.jpg\'', '2022-01-04 18:19:14'),
(432, NULL, 'project', 'crop-image', 'UPDATE dc_project_attach SET path = \'40861d41f3a5b793_0_0_849_1279.jpg\' WHERE path = \'60661d41f22719df_0_0_849_1279.jpg\'', '2022-01-04 18:19:38'),
(433, NULL, 'project', 'delete-album-item', 'DELETE FROM dc_project_attach WHERE id = \'200\'', '2022-01-04 18:20:23'),
(434, NULL, 'project', 'upload', 'INSERT INTO dc_project_attach ( type, path, album, filename, ord, status ) VALUES ( \'image\', \'76561d41f6ac723c.jpg\', \'10\', \'6705ff341f048840.jpg\', 999, \'pending\' )', '2022-01-04 18:20:27'),
(435, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(436, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(437, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(438, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(439, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(440, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(441, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(442, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(443, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', NULL),
(444, 'admin', 'about', 'insert', 'INSERT INTO dc_about(category,title_zh,title_en,contents_zh,contents_en,display) VALUES (1,\'ttest\',\'\',\'\',\'\',\'1\')', '2022-01-05 14:54:56');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_project`
--

CREATE TABLE `dc_project` (
  `id` int(11) NOT NULL,
  `display` tinyint(1) NOT NULL DEFAULT 1,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_zh` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents_zh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ord` int(11) NOT NULL DEFAULT 9999,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_project`
--

INSERT INTO `dc_project` (`id`, `display`, `category`, `title_en`, `title_zh`, `contents_en`, `contents_zh`, `ord`, `create_time`, `update_time`) VALUES
(19, 1, '1', 'GUANGZHOU ARENA', '廣州運動場館', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '此案為概念設計，場館基本規劃為一樓游泳池，二樓辦公空間，三樓羽球場，側面觀眾台臨操場。設計重點在於建築皮層運算對於陽光入射角度於建物室內的開闔調節，以達到最有效化自然光照與自然風對流效果。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(18, 1, '1', 'CLOUD GATE GALLERY', '淡水雲門舞集會館', 'Cloud Gate Gallery, an art performing group in Taiwan. The Mobiusation is responsible for the cladding analysis and fabrication of the building skin.', '此案為黃聲遠建築師作品，莫比負責屋頂曲面建構、修改、模矩化切片分析、模擬放樣等三維電腦工作。本案的技術難度在於屋頂曲面為自由曲面，在建模初期就得花很多心力在分割曲面與重建上，因為當曲面非常不規則、細部分常不平滑的時候，會導致後期模矩化分析與切割失敗，且在重建過程中，還需要高度貼合現場已完成的鋼構支撐。曲面重建分割完成之後，切割模矩化由程式軟體Grasshopper來完成。\r\n', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(5, 1, '1', 'TVM Facade ', '西北紡織服裝協會館', 'Own by Behet Bondzio Lin Architekten, Germany.', '此案為林友寒建築師作品，莫比創意當時負責外牆紅磚數位運算、三維建模與放樣之相關電腦工作。 胚藤部分用了幾張黑白照片為基礎，利用不同色階數值以控制磚塊旋轉角度。林友寒建築師於德國的事務所為了此案已開發出五種不同角度之紅磚與試體，搭配我們的程式運算出圖，最終達到此效果。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(6, 1, '10', 'F2O Factory', '工廠設計 - 台灣彰化', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.<br><br>', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(7, 1, '2', 'Geo', NULL, NULL, NULL, 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(8, 1, '1', 'TaiJi Oasis', '太極綠洲', 'The TaiJi Oasis is a mix used skyscraper, which co-designed with Prof. Hao-Hsiu Chiu. Own by Ming-Hong Wang architect.', '此案由東海大學 邱浩修 教授, 共同創作。王銘鴻建築師事務所擁有。為一住商混和大樓。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(9, 1, '2', 'MoneyJump Family Restaurant', '媽咪醬親子餐廳', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '此親子餐廳位於台北內湖，此設計案為典型數位構築案例。與傳統設計從平面套圖探討相反，在空間丈量完成之後，一切由三維繪圖軟體犀牛建構數位模型為主，讓所有造型精準的沿著空間而生。模型完成之後分解，編號，送CNC場切割，最後只需要工匠至現場按編號組裝， 猶如宜家家具DIY概念般，一切在電腦三維製作時期造至造就精準拿捏。此案掛名晴時禾方設計公司所有, 但主體設計為當時本人在職時期一人負責。 ', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(10, 1, '2', 'Ripple Wall', '漣漪磚牆', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '此案為台中東海大學女生宿舍門口，交誼廳空間重建工程之一，磚牆背面即面交誼廳落地窗。不同於舊東海女宿混凝土磚牆連續帶，我們取水波漣漪之概念，期望能用數位運算工具，結合東海建築群內舊有紅磚材料，構築一個傳統元素加以現代表現法的設計。在這之中，經典紅磚牆給人穩重內斂的形象，但在這次的設計中，整個紅磚視覺感受是流動、柔軟且有張力的。功能上，也藉由參數調整磚與磚之間的距離，以達到背面聯誼空間有自然光入射與空氣流通的作用。也讓會客聯誼空間與落地窗面有一幅漣漪流動的美畫。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(11, 1, '2', 'Super Surface', NULL, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(12, 1, '1', 'TAIWAN TOWER- NING', '台灣塔-凝', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '台灣塔為2012年台中水湳機場重建計畫之概念競圖案，為當時學生時期組隊參加之作品，最終在近三百組國際參賽者中獲得優選，為當時十二個獎項中，學生唯二得獎，台灣唯三入選之作品。莫比創意在其中擔任主要三維建模設計之角色。台灣塔取自台灣第一高山玉山之不屈不撓迎風而上之精神，以風、水、結晶三個概念來作為基地內強風、雨水回收、與塔上空間的思考延伸。版面渲染皆為團隊成果。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(13, 1, '1', 'Catchers Factory Concept - Water catcher', '捕捉器工廠-雨捕捉器', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(14, 1, '2', 'WOVEN BUS STATION', '編織公車站', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '編織公車站為當時台中市公車站競圖作品，以數位軟體模擬方法針對竹子材料做實驗性發想。竹子彈性大、堅韌、環保，在東南亞泰國等地有許多實驗性建築師以竹為材料構築建築物。莫比以三維軟體Rhino模擬與探討竹材料的最大最小彎曲度，編織密度等，來對應真實遮風擋雨功能，思考構築一環保公車站。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(15, 1, '10', 'Taste Creative THU', '品樂東海', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', '品樂東海為東海大學育成中心展場規劃設計作品, 共同創作者 賴可謙設計師。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(16, 1, '2', 'Feng', '風', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', '此為風雅頌三組六件作品其中一組, 共同創作者 東海大學 邱浩修 教授<br>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(17, 1, '2', 'FENG-YA-SONG Bronze', '風雅頌青銅器 - 頌', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '風雅頌為莫比與東海建築系邱浩修老師合作開發之作品，風-雅-頌共三組六件青銅器，皆取自詩經風雅頌恣意形象概念而發開。風，輕盈而自由，變幻無常。雅，優雅而恬靜內斂，不張牙五爪。頌，霸氣複雜，拔地而起。 作品照片唯獨風與頌，為莫比負責設計，雅為邱浩修老師設計。六件作品皆為三維粉末列印(右圖白色)之後交由青銅器廠商翻模，也是一傳統工法結合現代工法的實驗作品。此案技術難點在於三維列印並沒有翻模、拔模、脫模的限制，但製作青銅器卻有，於是得考慮設計過程中之脫模拔模開口與胚藤大小等等限制以達到最佳解。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(21, 1, '10', 'HOUSE TSAI ', '高雄鳳山 - 蔡宅', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', '此案業主位於高雄鳳山，為一四十年五樓公寓老舊建物翻修案，為期約十個月。原始案場十分老舊，包括所有電水管線、地平不均等等幾乎需要整個砍掉重練。走微工業風格。照片展示整修前、後對比。為莫比少數整體室內設計修改案例。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(22, 1, '6', 'Generative Pts', '程式藝術作品', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.<br><br>', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero&#39;s De Finibus Bonorum et Malorum for use in a type specimen book.', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(23, 1, '2', 'MODEL CREATION HALL', '楷模創生館', NULL, '此創生館為概念競圖時期設計，為2018年台中花博覽館場館之一。概念來自於創業楷模數十年如一日，永存在心中的創業家精神。旱地中拔地而起，撐起一片天。雖然其中有著各樣的困難與挑戰，也能在其之間，靠著實力與打拚的精神扭轉乾坤，勇往直前無退縮。縱使後來因預算胎死腹中，但在當時實務上為一結構創新設計，承重只有圖中接地一處，鋼構與皮層由電腦三為運算與模擬詳細尺寸，從粗到細從接地處延伸，以達到貌似懸浮於空中的視覺衝擊感。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(24, 1, '2', 'YEN-CHIA MEGA GARDEN', '杭州宴家花園', NULL, '宴家花園為一百公頃花園總體規劃概念設計案。莫比負責基地內所有植栽、建物、遊具、花園、廊帶，入口意象等等一切規劃設計，包括最終由Lumion軟體渲染動畫，為期半年。為莫比創意團隊之規劃設計、三維建模、後期渲染動畫出圖等綜合能力展現。觀看影片 請連結右下youtube連結。', 9999, '2022-01-05 14:38:06', '2022-01-05 14:49:31');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_project_attach`
--

CREATE TABLE `dc_project_attach` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `album` int(11) NOT NULL,
  `path` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover` tinyint(1) NOT NULL DEFAULT 0,
  `video_url` varchar(240) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ord` int(11) NOT NULL DEFAULT 0,
  `alt_en` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt_zh` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_project_attach`
--

INSERT INTO `dc_project_attach` (`id`, `type`, `album`, `path`, `filename`, `cover`, `video_url`, `ord`, `alt_en`, `alt_zh`, `counter`, `status`, `create_time`, `update_time`) VALUES
(162, 'image', 18, '7156006a820597be_0_154_737_881.jpg', 'rebult1-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(161, 'image', 18, '9666009bc2f318ff_276_342_1292_655.jpg', 'img_banner_colud_gate_theater_1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(36, 'image', 5, '9375ff338a5076da.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(37, 'image', 5, '9265ff338a5a7f57.jpg', 'P1020638.JPG', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(38, 'image', 5, '7905ff338a6b4e67.jpg', 'S__22863923.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(39, 'image', 5, '3845ff338a6cb9ed.jpg', 'TVM_persp eingang_140302.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(40, 'image', 5, '2115ff338a6d636e.jpg', 'TVMwall-AllFileIndex_頁面_1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(41, 'image', 5, '7675ff338a6df292.jpg', 'TVMwall-AllFileIndex_頁面_2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(42, 'image', 5, '9135ff338a6e7a28.jpg', 'TVMwall-AllFileIndex_頁面_3.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(43, 'image', 5, '1885ff338a6f20b8.jpg', 'TVMwall-AllFileIndex_頁面_4.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(44, 'image', 5, '4325ff338a708e18.jpg', 'TVMwall-AllFileIndex_頁面_5.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(45, 'image', 5, '6025ff338a712d71.jpg', 'TVMwall-AllFileIndex_頁面_6.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(46, 'image', 5, '7785ff338a71e1d1.jpg', '02 TVM_150416_Musterwand Erläuterung.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(47, 'image', 6, '335ff339c491425.jpg', 'factory2FORRender2Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(48, 'image', 6, '4035ff339c5126c3.jpg', 'factory2FORRender3fixCut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(49, 'image', 6, '6905ff339c58c4db.jpg', 'factory2FORRender4fixCut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(50, 'image', 6, '9315ff339c606a5e.jpg', 'factory2FORRender5fixCut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(51, 'image', 6, '3735ff339c66d34c.jpg', 'factory2FORRenderCut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(52, 'image', 6, '3545ff339c6bb095.jpg', 'factory2FORRender1Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(53, 'image', 7, '2255ff33b3918542.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(54, 'image', 7, '6435ff33b396b4b9.jpg', 'fish.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(55, 'image', 7, '9915ff33b39be211.jpg', 'fish2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(56, 'image', 7, '8795ff33b3a0973d.jpg', 'fish3.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(57, 'image', 8, '9615ff33c61cb941.jpg', 'FinalMixCut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(58, 'image', 8, '3385ff33c62e946d.jpg', 'FinalMixCut2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(79, 'image', 9, '481600d9b850fee4_0_110_860_637.jpg', '13094171_1707811716144886_5331189999168839587_nCut.jpg', 0, NULL, 5, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(78, 'image', 9, '613600d9b780475d_0_122_960_714.jpg', '13051580_999107223511818_939390213855680579_nCut.jpg', 0, NULL, 2, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(77, 'image', 9, '355ff33d99baafe.jpg', '13320436_1723031291289595_8399467170437329242_o.jpg', 1, NULL, 1, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(76, 'image', 8, '245ff33d01b7851.jpg', 'presen-06cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(75, 'image', 8, '7485ff33d00d833b.jpg', 'presen-05cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(74, 'image', 8, '8145ff33d0003c8f.jpg', 'presen-04cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(73, 'image', 8, '6455ff33cff271f2.jpg', 'presen-03cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(72, 'image', 8, '6195ff33cfe4ce50.jpg', 'presen-02cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(71, 'image', 8, '805ff33cfda2e18.jpg', 'presen-01cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(80, 'image', 9, '609600d9b905f26d_0_120_960_717.jpg', '13100950_999107303511810_2069945323195715624_nCut.jpg', 0, NULL, 3, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(197, 'image', 24, '74061d183b26dd0f.png', '12104snow-cut.png', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(82, 'image', 9, '249600d9ba24ed53_0_160_960_635.jpg', '13103477_1707812886144769_8063480543242123903_nCut.jpg', 0, NULL, 6, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(83, 'image', 9, '925600d9baee722b_162_0_637_959.jpg', '13119034_10204703784393024_8102407228752758063_nCut.jpg', 0, NULL, 4, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(84, 'image', 9, '66600d9bbe4b9e4_0_159_960_638.jpg', '13133220_1707811726144885_5944868160778005026_nCut.jpg', 0, NULL, 7, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(85, 'image', 9, '5075ff33dccc3dfa.jpg', '13308415_1723030994622958_8548374932067930601_oCover.jpg', 0, NULL, 8, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(86, 'image', 9, '922600d9bd1077d9_0_181_1125_751.jpg', '13323273_1723031144622943_2548667720435772912_oCut.jpg', 0, NULL, 10, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(87, 'image', 9, '377600d9bde7a185_156_0_639_960.jpg', '13333007_1723030644622993_7129969641257813974_nCut.jpg', 0, NULL, 9, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(88, 'image', 9, '1335ff33dcdacd8d.jpg', '13350419_1723027701289954_6879435643366728800_oCut.jpg', 0, NULL, 11, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(89, 'image', 9, '4185ff33dce0455d.jpg', 'DSC07309.JPG', 0, NULL, 12, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(90, 'image', 9, '4555ff33dcf163a0.jpg', 'DSC07320.JPG', 0, NULL, 13, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(201, 'image', 10, '76561d41f6ac723c.jpg', '6705ff341f048840.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(92, 'image', 9, '6145ff33dd02ea7c.jpg', 'DSC07330.JPG', 0, NULL, 14, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(93, 'image', 9, '3665ff33dd03727e.jpg', 'DSC07347cut.jpg', 0, NULL, 15, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(94, 'image', 10, '4815ff3419f9f281.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(95, 'image', 10, '2925ff341d3d44ce.jpg', 'DSC00574origin.JPG', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(97, 'image', 10, '7795ff341d507bb0.jpg', 'DSC00883.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(98, 'image', 10, '3945ff341d50fc42.jpg', 'DSC00900.JPG', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(99, 'image', 10, '8015ff341d5196de.jpg', 'forAll-05.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(100, 'image', 10, '3535ff341d52374d.jpg', 'forAll-07.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(101, 'image', 10, '7885ff341d5306b7.jpg', 'lay-out1-05.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(104, 'image', 11, '565ff34254f1f8a.jpg', 'superSrf4fix.jpg', 0, NULL, 2, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(105, 'image', 11, '4585ff3425560e4c.jpg', 'upload1.jpg', 0, NULL, 3, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(106, 'image', 11, '9405ff34255c5816.jpg', 'upload2.jpg', 0, NULL, 4, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(107, 'image', 11, '1005ff34255f1c1e.jpg', 'superSrf3fix.jpg', 0, NULL, 1, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(108, 'image', 11, '6175ff3428d371d7.jpg', 'exp1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(109, 'image', 11, '9285ff3428de46a6.jpg', 'exp2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(110, 'image', 11, '4465ff3428e4f1d0.jpg', 'exp3.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(111, 'image', 11, '5525ff3428ea7e70.jpg', 'process5.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(112, 'image', 11, '8135ff3428f46f83.jpg', 'process6.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(113, 'image', 11, '9125ff342904f2db.jpg', 'process7.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(114, 'image', 11, '3525ff342980e57b.jpg', 'process8Mix-01.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(115, 'image', 12, '5085ff342dc6ed8c.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(116, 'image', 12, '3395ff342e17e6f8.jpg', 'ex1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(117, 'image', 12, '3545ff342e1d6689.jpg', 'ex2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(118, 'image', 12, '5215ff342e22ccc5.jpg', 'ex3.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(119, 'image', 12, '9785ff342e2b0fec.jpg', 'ex4.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(120, 'image', 13, '2325ff3432792f6d.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(121, 'image', 13, '1105ff34327c3492.jpg', 'ex1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(122, 'image', 13, '679600ed7850062a_43_0_1347_794.jpg', 'ex2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(123, 'image', 13, '1045ff34328aecb4.jpg', 'ex3.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(129, 'image', 14, '531600ed7b49297a_69_115_1785_1185.jpg', 'change.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(125, 'image', 13, '8635ff343299db70.jpg', 'ex5.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(126, 'image', 13, '6045ff34329eea32.jpg', 'ex6.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(127, 'image', 13, '7095ff3432a457af.jpg', 'ex7.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(128, 'image', 13, '9465ff3432a918b2.jpg', 'ex8.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(130, 'image', 14, '4075ff343811769c.jpg', 'change2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(131, 'image', 14, '6245ff343816014f.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(132, 'image', 14, '1685ff343818ad40.jpg', 'ex1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(133, 'image', 14, '1505ff34381b93d5.jpg', 'ex2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(134, 'image', 14, '2605ff34381eb72d.jpg', 'ex3.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(135, 'image', 14, '3695ff343824c23d.jpg', 'ex4.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(136, 'image', 14, '4735ff3438274a79.jpg', 'ex5.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(137, 'image', 14, '3645ff343829cfc0.jpg', 'ex6.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(138, 'image', 14, '5175ff34382cd7d1.jpg', 'ex7.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(139, 'image', 15, '6575ff3442304257.jpg', 'DSC_8568Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(140, 'image', 15, '5605ff3442410a09.jpg', 'DSC08584Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(141, 'image', 15, '1475ff344241d2f8.jpg', 'DSC08585Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(142, 'image', 15, '6985ff34424264c1.jpg', 'DSC08611Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(143, 'image', 15, '9885ff344243032d.jpg', 'DSC08632Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(144, 'image', 15, '8885ff344243a24b.jpg', 'DSC08646Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(145, 'image', 15, '4455ff3442443241.jpg', 'DSC08647Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(146, 'image', 15, '3565ff344244d3b2.jpg', 'DSC08703Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(147, 'image', 15, '7725ff3442457cf0.jpg', 'DSC_8561Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(148, 'image', 15, '3855ff3444124d1c.jpg', 'DSC_8420Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(149, 'image', 15, '6445ff34442324ef.jpg', 'DSC_8421Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(150, 'image', 15, '1215ff344433d83c.jpg', 'DSC_8423Cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(151, 'image', 16, '3725ff344ce1d5ae.jpg', 'finalRen-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(152, 'image', 16, '35ff344ce6d35b.jpg', '65650001-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(153, 'image', 16, '9175ff344ce952d7.jpg', '65650003-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(154, 'image', 16, '6285ff344cebc660.jpg', 'DSC00750-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(155, 'image', 16, '4865ff344cf941ae.jpg', 'DSC01081.JPG', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(156, 'image', 17, '4365ff34529e7d70.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(157, 'image', 17, '4595ff3453d2038c.jpg', 'snake-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(158, 'image', 17, '2665ff3453d8b6ab.jpg', '65682009-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(159, 'image', 17, '4045ff3453e9b7e7.jpg', '65682011-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(160, 'image', 17, '2525ff345670d1ef.jpg', '65682009.11-頌-仰天俯地.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(163, 'image', 18, '5475ff34744b074c.jpg', 'div-cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(164, 'image', 18, '3965ff34753c80fb.jpg', 'session0304.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(165, 'image', 18, '4505ff3475c5b377.jpg', 'session0506.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(166, 'image', 18, '2475ff3476c59c4e.jpg', 'unroll1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(167, 'image', 18, '9555ff3477caa55e.jpg', 'unroll2cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(168, 'image', 18, '4085ff3478ceb98c.jpg', 'cover.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(169, 'image', 19, '2555ff348089609f.jpg', 'DDD5cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(170, 'image', 19, '6875ff348111575f.jpg', 'DDD6cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(171, 'image', 19, '9465ff348116fecd.jpg', 'DDD7cut.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(172, 'image', 19, '5335ff3481b45b74.jpg', 'swmpol.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(196, 'image', 23, '8561d18106642e1.jpg', '2456003314fdc549.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(179, 'image', 21, '626009b367e8dfc.jpg', '完工出租_210121_0.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(178, 'image', 22, '32160069f88d658d.jpg', 'maxresdefault.jpg', 0, 'https://youtu.be/CwvDD010wHo', 999, 'project GenerativePts', 'project GenerativePts', 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(195, 'image', 22, '100600ff78999d8a.jpg', 'weaving2.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(180, 'image', 21, '7676009b36901d35.jpg', '完工出租_210121_1.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(181, 'image', 21, '6886009b36985ce1.jpg', '完工出租_210121_3.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(182, 'image', 21, '3946009b36a0a75d.jpg', '完工出租_210121_4.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(183, 'image', 21, '8766009b36a8545c.jpg', '完工出租_210121_5.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(184, 'image', 21, '9436009b36b0aeef.jpg', '完工出租_210121_9.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(185, 'image', 21, '2326009b36b7f173.jpg', '完工出租_210121_10.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(186, 'image', 21, '3196009b36c02654.jpg', '完工出租_210121_12.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(187, 'image', 21, '5286009b36c78e74.jpg', '完工出租_210121_16.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(188, 'image', 21, '7096009b36cf250e.jpg', '完工出租_210121_17.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(189, 'image', 21, '4616009b36d6f603.jpg', '完工出租_210121_19.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(190, 'image', 21, '2236009b36de3b2d.jpg', '完工出租_210121_20.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(191, 'image', 21, '2326009b36e584ef.jpg', '完工出租_210121_22.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(192, 'image', 21, '6206009b36ed0577.jpg', '完工出租_210121_23.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(193, 'image', 21, '9406009b36f4f94a.jpg', '完工出租_210121_24.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(194, 'image', 21, '6996009b36fbb902.jpg', '完工出租_210121_25.jpg', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(202, 'image', 24, '34261d544dfac726.jpg', 'maxresdefault.jpg', 0, 'https://www.youtube.com/watch?v=ajAjjCROLks', 999, 'Lumion動畫+後製', 'Lumion動畫+後製', 0, '', '2022-01-05 15:12:31', '2022-01-05 15:12:32');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_project_cat`
--

CREATE TABLE `dc_project_cat` (
  `id` tinyint(4) NOT NULL,
  `title_en` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_zh` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent` tinyint(4) NOT NULL DEFAULT 0,
  `ord` tinyint(4) NOT NULL DEFAULT 0,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_project_cat`
--

INSERT INTO `dc_project_cat` (`id`, `title_en`, `title_zh`, `parent`, `ord`, `create_time`, `update_time`) VALUES
(1, 'ARCHITECTURE', '建築', 4, 3, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(2, 'INTERIOR / OTHER', '室內/其他', 4, 4, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(4, 'COMPUTATION', '運算設計', 0, 2, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(6, 'CODE WORK', '編程創作', 0, 5, '2022-01-05 14:38:06', '2022-01-05 14:49:31'),
(10, 'CLASSIC', '典型', 0, 1, '2022-01-05 14:38:06', '2022-01-05 14:49:31');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_settings`
--

CREATE TABLE `dc_settings` (
  `id` tinyint(4) NOT NULL,
  `contact_address_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address_zh` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_messenger` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_sender` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_receiver` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_header` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_signature` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_status` tinyint(1) NOT NULL DEFAULT 0,
  `smtp_host` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_secure` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_account` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_auth_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title_zh` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords_zh` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description_en` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description_zh` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_refresh_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_settings`
--

INSERT INTO `dc_settings` (`id`, `contact_address_en`, `contact_address_zh`, `contact_phone`, `contact_email`, `social_facebook`, `social_messenger`, `social_instagram`, `social_twitter`, `social_line`, `social_linkedin`, `social_youtube`, `mail_sender`, `mail_receiver`, `mail_from`, `mail_header`, `mail_signature`, `smtp_status`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_account`, `smtp_password`, `smtp_auth_type`, `meta_title_en`, `meta_title_zh`, `meta_keywords_en`, `meta_keywords_zh`, `meta_description_en`, `meta_description_zh`, `oauth_refresh_token`, `update_time`) VALUES
(1, '803 高雄市鹽埕區大勇 路11 號3 樓308 室', NULL, '0988378769', 'waterblue4019@hotmail.com', 'https://www.facebook.com/Actinia0103/', NULL, NULL, NULL, 'https://line.me/ti/p/-IFuHCCmDr', 'https://www.linkedin.com/in/yuwei-tsai-randy/', NULL, 'dozencreation.mailer@gmail.com', 'waterblue4019@hotmail.com', 'THEMOBIUSATION', '<u>THEMOBIUSATION</u>', '<u>THEMOBIUSATION</u>', 1, 'smtp.gmail.com', '587', 'tls', 'dozencreation.mailer@gmail.com', '!286BP6gk4ru4', 'XOAUTH2', 'THEMOBIUSATION', 'THEMOBIUSATION', 'Generative Design, Computation Design, Digital Fabrication, Parametric Architecture, Architecture, Interior, Programming Art, Code Art, Web Developer, Web Development, Full-Stack Developer, Full-Stack Development, Web Design, Web Visualization, Webpage Design.', '衍生設計, 運算設計, 數位構築, 參數式建築, 建築設計,  室內設計, 編程藝術, 程式藝術, 網站開發, 網站設計, 全端網站開發, 網站視覺設計。', 'THEMOBIUSATION - studio for Web design, Art creation , Architecture design, Interior design.\r\n\r\nMobiusation referencing from the form of the Mobius strip, we believe that design is the process of conflicting and correcting constantly, as a path that neither limit nor end. The studio is composed of a group of interdisciplinary designers who specialize in architecture and programming. Throughout the past projects, we are committed to pushing the limit of integrating space, computation, art, and the web visualization.\r\n\r\nAlthough we have done a number of projects for over six years, we would rather not define what we do. Somewhere between architecture / programming / art to date, but relatively, eager to carve the way unrestrictedly that we have never seen for the future.', '莫比創意 - 建築設計，室內設計，網站設計，工作室。\r\n\r\nTHEMOBIUSATION - 莫比創意，取自莫比烏斯環的形意而來，我們認為設計是個不斷碰撞修正的過程, 為一條無限持續無盡的環。工作室主要由一群跨建築與程式領域的設計者組成。 在過去的專案中，莫比致力於結合空間設計、程式運算、平面、網站，與互動經驗，將所學之型態設計與計算機概念推之極限。縱使迄今超過八年的專案累積，我們依然不去定義莫比的軌跡，能看見的是一直介於空間、程式語言、與藝術之間，也相對的期望在未來每次合作中，不受限的刻劃出未曾有過的道路。', '1//0eVsN3z0pPn0oCgYIARAAGA4SNwF-L9IrRMFVeu5daWSsE_ZgWJYFsBw-WcR0gjEJStAGpX24-rbBpwE54hlgw6dyg5IRTSEQUTA', '2022-01-05 15:26:35');

-- --------------------------------------------------------

--
-- 資料表結構 `dc_settings_attach`
--

CREATE TABLE `dc_settings_attach` (
  `id` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `album` int(11) NOT NULL,
  `path` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` tinyint(1) NOT NULL DEFAULT 0,
  `video_url` varchar(240) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ord` int(11) NOT NULL DEFAULT 0,
  `alt_en` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_zh` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT current_timestamp(),
  `update_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 傾印資料表的資料 `dc_settings_attach`
--

INSERT INTO `dc_settings_attach` (`id`, `type`, `album`, `path`, `filename`, `cover`, `video_url`, `ord`, `alt_en`, `alt_zh`, `counter`, `status`, `create_time`, `update_time`) VALUES
(2, 'image', 2, '77161d54337e9e64.png', 'fevicon.png', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 15:05:27', '2022-01-05 15:05:28'),
(3, 'image', 1, '6861d549b20a234.png', 'webphoto-01.png', 0, NULL, 999, NULL, NULL, 0, '', '2022-01-05 15:33:06', '2022-01-05 15:33:06');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `dc_about`
--
ALTER TABLE `dc_about`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`),
  ADD KEY `ord` (`ord`);

--
-- 資料表索引 `dc_about_attach`
--
ALTER TABLE `dc_about_attach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album` (`album`),
  ADD KEY `ord` (`ord`);

--
-- 資料表索引 `dc_about_cat`
--
ALTER TABLE `dc_about_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `ord` (`ord`);

--
-- 資料表索引 `dc_admin`
--
ALTER TABLE `dc_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- 資料表索引 `dc_admin_cat`
--
ALTER TABLE `dc_admin_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`,`ord`);

--
-- 資料表索引 `dc_gallery`
--
ALTER TABLE `dc_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ord` (`ord`);

--
-- 資料表索引 `dc_gallery_attach`
--
ALTER TABLE `dc_gallery_attach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album` (`album`,`ord`);

--
-- 資料表索引 `dc_log`
--
ALTER TABLE `dc_log`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `dc_project`
--
ALTER TABLE `dc_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`,`ord`);

--
-- 資料表索引 `dc_project_attach`
--
ALTER TABLE `dc_project_attach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album` (`album`,`ord`);

--
-- 資料表索引 `dc_project_cat`
--
ALTER TABLE `dc_project_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`,`ord`);

--
-- 資料表索引 `dc_settings`
--
ALTER TABLE `dc_settings`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `dc_settings_attach`
--
ALTER TABLE `dc_settings_attach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album` (`album`),
  ADD KEY `ord` (`ord`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_about`
--
ALTER TABLE `dc_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_about_attach`
--
ALTER TABLE `dc_about_attach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_about_cat`
--
ALTER TABLE `dc_about_cat`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_admin`
--
ALTER TABLE `dc_admin`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_admin_cat`
--
ALTER TABLE `dc_admin_cat`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_gallery`
--
ALTER TABLE `dc_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_gallery_attach`
--
ALTER TABLE `dc_gallery_attach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_log`
--
ALTER TABLE `dc_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=463;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_project`
--
ALTER TABLE `dc_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_project_attach`
--
ALTER TABLE `dc_project_attach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_project_cat`
--
ALTER TABLE `dc_project_cat`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_settings`
--
ALTER TABLE `dc_settings`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `dc_settings_attach`
--
ALTER TABLE `dc_settings_attach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
