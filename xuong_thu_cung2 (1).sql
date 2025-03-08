-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 08, 2025 at 04:59 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xuong_thu_cung2`
--

-- --------------------------------------------------------

--
-- Table structure for table `binh_luans`
--

CREATE TABLE `binh_luans` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `noi_dung` text NOT NULL,
  `ngay_dang` date NOT NULL,
  `trang_thai` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `binh_luans`
--

INSERT INTO `binh_luans` (`id`, `san_pham_id`, `tai_khoan_id`, `noi_dung`, `ngay_dang`, `trang_thai`) VALUES
(1, 1, 1, 'Hahahahh', '2024-11-18', 2),
(2, 1, 1, 'ngon ngon ngon', '2024-11-18', 1),
(3, 3, 7, '1234', '2024-12-07', 1),
(4, 3, 7, '1234', '2024-12-07', 1),
(5, 6, 7, '', '2024-12-07', 1),
(6, 6, 7, 'aa', '2024-12-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hangs`
--

CREATE TABLE `chi_tiet_don_hangs` (
  `id` int NOT NULL,
  `don_hang_id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `don_gia` decimal(10,2) NOT NULL,
  `so_luong` int NOT NULL,
  `thanh_tien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chi_tiet_don_hangs`
--

INSERT INTO `chi_tiet_don_hangs` (`id`, `don_hang_id`, `san_pham_id`, `don_gia`, `so_luong`, `thanh_tien`) VALUES
(1, 1, 6, '12345.00', 1, '12345.00'),
(2, 1, 5, '123456.00', 2, '1234567.00'),
(3, 2, 6, '12345.00', 1, '12345.00'),
(4, 2, 3, '123456.00', 2, '1234567.00'),
(5, 4, 3, '100000.00', 26, '2600000.00'),
(6, 4, 1, '10000000.00', 3, '30000000.00'),
(7, 4, 2, '18000000.00', 1, '18000000.00'),
(8, 5, 3, '100000.00', 26, '2600000.00'),
(9, 5, 1, '10000000.00', 3, '30000000.00'),
(10, 5, 2, '18000000.00', 1, '18000000.00'),
(11, 6, 4, '900000.00', 5, '4500000.00'),
(12, 7, 4, '900000.00', 4, '3600000.00'),
(13, 7, 3, '100000.00', 8, '800000.00'),
(14, 8, 3, '180000.00', 1, '180000.00'),
(15, 9, 12, '400000.00', 4, '1600000.00'),
(16, 10, 2, '20000000.00', 4, '80000000.00'),
(17, 11, 3, '180000.00', 7, '1260000.00'),
(18, 11, 2, '20000000.00', 4, '80000000.00'),
(19, 12, 2, '20000000.00', 4, '80000000.00'),
(20, 12, 11, '20000000.00', 4, '80000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_gio_hangs`
--

CREATE TABLE `chi_tiet_gio_hangs` (
  `id` int NOT NULL,
  `gio_hang_id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `so_luong` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chi_tiet_gio_hangs`
--

INSERT INTO `chi_tiet_gio_hangs` (`id`, `gio_hang_id`, `san_pham_id`, `so_luong`) VALUES
(8, 4, 1, 1),
(9, 4, 2, 4),
(10, 4, 4, 5),
(14, 7, 3, 9),
(16, 7, 11, 8),
(17, 7, 2, 7),
(18, 4, 12, 2),
(19, 7, 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `chuc_vus`
--

CREATE TABLE `chuc_vus` (
  `id` int NOT NULL,
  `ten_chuc_vu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chuc_vus`
--

INSERT INTO `chuc_vus` (`id`, `ten_chuc_vu`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `danh_mucs`
--

CREATE TABLE `danh_mucs` (
  `id` int NOT NULL,
  `ten_danh_muc` varchar(255) NOT NULL,
  `mo_ta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `danh_mucs`
--

INSERT INTO `danh_mucs` (`id`, `ten_danh_muc`, `mo_ta`) VALUES
(1, 'IPHONE 16', 'Danh mục Iphone'),
(2, 'Sạc Pin điện thoại', 'Danh mục Sạc Pin điện thoại'),
(3, 'Realmi', 'Danh mục realmi'),
(6, 'SAMSUNG', 'Danh mục Samsung'),
(7, 'XIAOMI', 'DANH MỤC XIAOMI'),
(8, 'Tai Nghe', 'Danh mục Tai nghe');

-- --------------------------------------------------------

--
-- Table structure for table `don_hangs`
--

CREATE TABLE `don_hangs` (
  `id` int NOT NULL,
  `ma_don_hang` varchar(50) NOT NULL,
  `tai_khoan_id` int NOT NULL,
  `ten_nguoi_nhan` varchar(255) NOT NULL,
  `email_nguoi_nhan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sdt_nguoi_nhan` varchar(15) NOT NULL,
  `dia_chi_nguoi_nhan` text NOT NULL,
  `ngay_dat` date NOT NULL,
  `tong_tien` decimal(20,2) NOT NULL,
  `ghi_chu` text,
  `phuong_thuc_thanh_toan_id` int NOT NULL,
  `trang_thai_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `don_hangs`
--

INSERT INTO `don_hangs` (`id`, `ma_don_hang`, `tai_khoan_id`, `ten_nguoi_nhan`, `email_nguoi_nhan`, `sdt_nguoi_nhan`, `dia_chi_nguoi_nhan`, `ngay_dat`, `tong_tien`, `ghi_chu`, `phuong_thuc_thanh_toan_id`, `trang_thai_id`) VALUES
(1, 'DH-123', 1, 'Nguyễn Quang Nam', 'namnqph12345@gmail.com', '0913578642', '13 Trịnh Văn Bô, Hà Nội', '2024-11-15', '900000.00', 'Vui lòng cho chó vào giỏ trước khi giao hàng', 1, 9),
(2, 'DH-124', 1, 'Nguyễn Quang Nam', 'namnqph12345@gmail.com', '0913578642', '13 Trịnh Văn Bô, Hà Nội', '2024-11-15', '1000000.00', 'Vui lòng cho thức ăn vào 2 túi trước khi giao hàng', 1, 10),
(3, 'DH-6165', 2, 'Phạm Huyền Trang', 'xzwybhuyen@gmail.com', '0566916233', 'Thanh Trì, Hà Nội', '2024-11-25', '50630000.00', '', 1, 11),
(4, 'DH-6755', 2, 'Trans', 'xzwybhuyen@gmail.com', '0566916233', 'Thanh Trì, Hà Nội', '2024-11-25', '50630000.00', 'Mô Phật', 1, 4),
(5, 'DH-4720', 2, 'Phạm Huyền Trang', 'xzwybhuyen@gmail.com', '0566916233', 'Thanh Trì, Hà Nội', '2024-11-25', '50630000.00', 'Nam MÔ', 1, 4),
(6, 'DH-2770', 2, 'Phạm Huyền Trang', 'xzwybhuyen@gmail.com', '0566916233', 'Thanh Trì, Hà Nội', '2024-11-26', '4530000.00', 'SFFFĐ', 1, 1),
(7, 'DH-2374', 2, 'Phạm Huyền Trang', 'xzwybhuyen@gmail.com', '0566916233', 'Thanh Trì, Hà Nội', '2024-12-03', '256430000.00', '123123123', 2, 1),
(8, 'DH-6167', 7, 'www', 'xzwybtrans@gmail.com', '0973839922', 'Hfad Tây', '2024-12-09', '135210000.00', '', 1, 1),
(9, 'DH-8144', 11, 'Nguyễn Quang Nam', 'namnq@gmail.com', '0987654321', '13 Trịnh Văn Bô, Hà Nội, Việt Nam', '2024-12-11', '1630000.00', '', 2, 11),
(10, 'DH-8277', 11, 'Nguyễn Quang Nam', 'namnq@gmail.com', '0987654321', '13 Trịnh Văn Bô, Hà Nội, Việt Nam', '2024-12-12', '575020000.00', '', 1, 9),
(11, 'DH-1898', 11, 'Nguyễn Quang Nam', 'namnq@gmail.com', '0987654321', '13 Trịnh Văn Bô, Hà Nội, Việt Nam', '2024-12-12', '81280000.00', '', 1, 6),
(12, 'DH-8001', 11, 'Nguyễn Quang Nam', 'namnq@gmail.com', '0987654321', '13 Trịnh Văn Bô, Hà Nội, Việt Nam', '2024-12-12', '160020000.00', '', 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `gio_hangs`
--

CREATE TABLE `gio_hangs` (
  `id` int NOT NULL,
  `tai_khoan_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gio_hangs`
--

INSERT INTO `gio_hangs` (`id`, `tai_khoan_id`) VALUES
(4, 2),
(5, 9),
(7, 7),
(12, 11);

-- --------------------------------------------------------

--
-- Table structure for table `hinh_anh_san_phams`
--

CREATE TABLE `hinh_anh_san_phams` (
  `id` int NOT NULL,
  `san_pham_id` int NOT NULL,
  `link_hinh_anh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hinh_anh_san_phams`
--

INSERT INTO `hinh_anh_san_phams` (`id`, `san_pham_id`, `link_hinh_anh`) VALUES
(5, 1, './uploads/1733928156iphone-16-pro-titan-sa-mac-1-638638979065595000-750x500.jpg'),
(11, 3, './uploads/1733928276bo-adapter-sac-3-cong-gan5-pro-fast-140w-kem-cap-type-c-type-c-1m-baseus-ccgan140cs-1-750x500.jpg'),
(13, 3, './uploads/1733928276bo-adapter-sac-3-cong-gan5-pro-fast-140w-kem-cap-type-c-type-c-1m-baseus-ccgan140cs-2-750x500.jpg'),
(22, 1, './uploads/1733928156iphone-16-pro-titan-sa-mac-2-638638979074194078-750x500.jpg'),
(23, 1, './uploads/1733928156iphone-16-pro-titan-sa-mac-3-638638979080345262-750x500.jpg'),
(24, 1, './uploads/1733928156iphone-16-pro-titan-sa-mac-5-638638979095787393-750x500.jpg'),
(28, 11, './uploads/1733928355iphone-16-xanh-luu-ly-1-638639088268837180-750x500.jpg'),
(29, 11, './uploads/1733928355iphone-16-xanh-luu-ly-2-638639088274865173-750x500.jpg'),
(30, 11, './uploads/1733928355iphone-16-xanh-luu-ly-3-638639088281993338-750x500.jpg'),
(31, 11, './uploads/1733928355iphone-16-xanh-luu-ly-4-638639088289686755-750x500.jpg'),
(32, 2, './uploads/1733928213iphone-16-pro-max-titan-den-1-638638962017739954-750x500.jpg'),
(33, 2, './uploads/1733928213iphone-16-pro-max-titan-den-2-638638962024629957-750x500.jpg'),
(34, 2, './uploads/1733928213iphone-16-pro-max-titan-den-3-638638962030196121-750x500.jpg'),
(35, 2, './uploads/1733928213iphone-16-pro-max-titan-den-4-638638962037014080-750x500.jpg'),
(36, 3, './uploads/1733928276bo-adapter-sac-3-cong-gan5-pro-fast-140w-kem-cap-type-c-type-c-1m-baseus-ccgan140cs-3-750x500.jpg'),
(38, 12, './uploads/1733928687bo-adapter-sac-kem-cap-type-c-type-c-pd-45w-samsung-ep-t4511xb-1-750x500.jpg'),
(39, 12, './uploads/1733928687bo-adapter-sac-kem-cap-type-c-type-c-pd-45w-samsung-ep-t4511xb-2-750x500.jpg'),
(40, 12, './uploads/1733928687bo-adapter-sac-kem-cap-type-c-type-c-pd-45w-samsung-ep-t4511xb-3-750x500.jpg'),
(42, 1, './uploads/1733928156iphone-16-pro-titan-sa-mac-4-638638979090032976-750x500.jpg'),
(43, 2, './uploads/1733928213iphone-16-pro-max-titan-den-5-638638962043284415-750x500.jpg'),
(44, 11, './uploads/1733928355iphone-16-xanh-luu-ly-5-638639088298271455-750x500.jpg'),
(45, 13, './uploads/1733929246realme-note-60-den-1-638618431980020061-750x500.jpg'),
(46, 13, './uploads/1733929246realme-note-60-den-2-638618431985747383-750x500.jpg'),
(47, 13, './uploads/1733929246realme-note-60-den-3-638618431991209096-750x500.jpg'),
(48, 13, './uploads/1733929246realme-note-60-den-4-638618431996507899-750x500.jpg'),
(49, 13, './uploads/1733929246realme-note-60-den-5-638618432002065977-750x500.jpg'),
(50, 14, './uploads/1733929326realme-note-50-xanh-1-750x500.jpg'),
(51, 14, './uploads/1733929326realme-note-50-xanh-2-750x500.jpg'),
(52, 14, './uploads/1733929326realme-note-50-xanh-3-750x500.jpg'),
(53, 14, './uploads/1733929326realme-note-50-xanh-4-750x500.jpg'),
(54, 14, './uploads/1733929326realme-note-50-xanh-5-750x500.jpg'),
(55, 15, './uploads/1733929514samsung-galaxy-a55-5g-xanh-1-1-750x500.jpg'),
(56, 15, './uploads/1733929514samsung-galaxy-a55-5g-xanh-2-1-750x500.jpg'),
(57, 15, './uploads/1733929514samsung-galaxy-a55-5g-xanh-3-1-750x500.jpg'),
(58, 15, './uploads/1733929514samsung-galaxy-a55-5g-xanh-4-1-750x500.jpg'),
(59, 15, './uploads/1733929514samsung-galaxy-a55-5g-xanh-5-1-750x500.jpg'),
(60, 16, './uploads/1733929639samsung-galaxy-s23-fe-xanh-1-750x500.jpg'),
(61, 16, './uploads/1733929639samsung-galaxy-s23-fe-xanh-2-750x500.jpg'),
(62, 16, './uploads/1733929639samsung-galaxy-s23-fe-xanh-3-750x500.jpg'),
(63, 16, './uploads/1733929639samsung-galaxy-s23-fe-xanh-4-750x500.jpg'),
(64, 16, './uploads/1733929639samsung-galaxy-s23-fe-xanh-5-750x500.jpg'),
(65, 17, './uploads/1733930058xiaomi-14t-xam-1-638635700973443455-750x500.jpg'),
(66, 17, './uploads/1733930058xiaomi-14t-xam-2-638635700979069226-750x500.jpg'),
(67, 17, './uploads/1733930058xiaomi-14t-xam-3-638635700984506402-750x500.jpg'),
(68, 17, './uploads/1733930058xiaomi-14t-xam-4-638635700990191021-750x500.jpg'),
(69, 17, './uploads/1733930058xiaomi-14t-xam-5-638635700999858814-750x500.jpg'),
(70, 18, './uploads/1733930125xiaomi-14t-pro-blue-1-638660517348794541-750x500.jpg'),
(71, 18, './uploads/1733930125xiaomi-14t-pro-blue-2-638660517355312257-750x500.jpg'),
(72, 18, './uploads/1733930125xiaomi-14t-pro-blue-3-638660517367904364-750x500.jpg'),
(73, 18, './uploads/1733930125xiaomi-14t-pro-blue-4-638660517378613487-750x500.jpg'),
(74, 18, './uploads/1733930125xiaomi-14t-pro-blue-5-638660517386952402-750x500.jpg'),
(75, 19, './uploads/1733930228pin-sac-du-phong-polymer-20000mah-type-c-10-5w-ava-g-289-1-638671770968032829-750x500.jpg'),
(76, 19, './uploads/1733930228pin-sac-du-phong-polymer-20000mah-type-c-10-5w-ava-g-289-2-638671770976174363-750x500.jpg'),
(77, 19, './uploads/1733930228pin-sac-du-phong-polymer-20000mah-type-c-10-5w-ava-g-289-3-638671770981895483-750x500.jpg'),
(78, 20, './uploads/1733930328tai-nghe-bluetooth-chup-taai-marshall-major-v-den-1-750x500.jpg'),
(79, 20, './uploads/1733930328tai-nghe-bluetooth-chup-taai-marshall-major-v-den-2-750x500.jpg'),
(80, 20, './uploads/1733930328tai-nghe-bluetooth-chup-taai-marshall-major-v-den-3-750x500.jpg'),
(81, 21, './uploads/1733930415tai-nghe-bluetooth-open-ear-tws-ava-freego-ows02-den-1-638628741819028957-750x500.jpg'),
(82, 21, './uploads/1733930415tai-nghe-bluetooth-open-ear-tws-ava-freego-ows02-den-2-638628741826406944-750x500.jpg'),
(83, 21, './uploads/1733930415tai-nghe-bluetooth-open-ear-tws-ava-freego-ows02-den-3-638628741833741746-750x500.jpg'),
(84, 22, './uploads/1733930479tai-nghe-co-day-ep-type-c-xiaomi-den-1-638630299770505716-750x500.jpg'),
(85, 22, './uploads/1733930479tai-nghe-co-day-ep-type-c-xiaomi-den-2-638630299775983447-750x500.jpg'),
(86, 22, './uploads/1733930479tai-nghe-co-day-ep-type-c-xiaomi-den-3-638630299782143485-750x500.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `phuong_thuc_thanh_toans`
--

CREATE TABLE `phuong_thuc_thanh_toans` (
  `id` int NOT NULL,
  `ten_phuong_thuc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phuong_thuc_thanh_toans`
--

INSERT INTO `phuong_thuc_thanh_toans` (`id`, `ten_phuong_thuc`) VALUES
(1, 'COD(Thanh toán khi nhận hàng)'),
(2, 'Thanh toán online');

-- --------------------------------------------------------

--
-- Table structure for table `san_phams`
--

CREATE TABLE `san_phams` (
  `id` int NOT NULL,
  `ten_san_pham` varchar(255) NOT NULL,
  `gia_san_pham` decimal(10,2) NOT NULL,
  `gia_khuyen_mai` decimal(10,2) DEFAULT NULL,
  `hinh_anh` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `so_luong` int NOT NULL,
  `luot_xem` int DEFAULT '0',
  `ngay_nhap` date NOT NULL,
  `mo_ta` text,
  `danh_muc_id` int NOT NULL,
  `trang_thai` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `san_phams`
--

INSERT INTO `san_phams` (`id`, `ten_san_pham`, `gia_san_pham`, `gia_khuyen_mai`, `hinh_anh`, `so_luong`, `luot_xem`, `ngay_nhap`, `mo_ta`, `danh_muc_id`, `trang_thai`) VALUES
(1, 'Iphone 16 Promax Black Titan', '50000000.00', '45000000.00', './uploads/1733928164iphone-16-pro-titan-sa-mac.png', 10, 10, '2024-12-04', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Phasellus id nisi quis justo tempus mollis sed et dui. In hac habitasse platea dictumst.', 1, 1),
(2, 'Iphone 16 Promax Titan Sa Mạc', '23000000.00', '20000000.00', './uploads/1733928219iphone-16-pro-max-black-thumb-600x600.jpg', 30, 1000, '2024-12-07', 'IPhone', 1, 1),
(3, 'Bộ Adapter Sạc 3cổng gắn 5 Pro fast 140W', '200000.00', '180000.00', './uploads/1733928283bo-adapter-sac-3-cong-gan5-pro-fast-140w-kem-cap-type-c-type-c-1m-baseus-ccgan140cs-thumb-600x600.jpg', 20, 0, '2024-11-13', 'Bộ Adapter Sạc 3cổng gắn 5 Pro fast 140W kèm cặp type C, type C1 ', 2, 1),
(11, 'Iphone 16', '23000000.00', '20000000.00', './uploads/1733928362iphone-16-xanh-600x600.png', 9, 0, '2024-12-09', 'nothing', 1, 1),
(12, 'Pin Sạc Dự Phòng 20000mah type c pd qc3022 5w xmobile ym 672', '430000.00', '400000.00', './uploads/1733928693bo-adapter-sac-kem-cap-type-c-type-c-pd-45w-samsung-ep-t4511xb-600x600.jpg', 40, 0, '2024-12-06', 'sạc pin trâu', 2, 1),
(13, 'Realme note 60', '13900000.00', '13490000.00', './uploads/1733929246realme-note-60-black-thumb-600x600.jpg', 120, 0, '2024-12-11', '', 3, 1),
(14, 'Realme note 50', '14990000.00', '14390000.00', './uploads/1733929326realme-note-50-blue-thumb-600x600.jpg', 130, 0, '2024-12-11', '', 3, 1),
(15, 'Samsung galaxy A55', '10900000.00', '10490000.00', './uploads/1733929514samsung-galaxy-a55-5g-xanh-thumb-1-600x600.jpg', 140, 0, '2024-12-11', '', 6, 1),
(16, 'Samsung galaxy S23', '9900000.00', '9490000.00', './uploads/1733929639samsung-galaxy-s23-fe-mint-thumbnew-600x600.jpg', 150, 0, '2024-12-11', '', 6, 1),
(17, 'Xiaomi 14T', '8900000.00', '8490000.00', './uploads/1733930058xiaomi-14t-grey-thumb-600x600.jpg', 55, 0, '2024-12-11', '', 7, 1),
(18, 'Xiaomi 14T Pro', '10900000.00', '10490000.00', './uploads/1733930125xiaomi-14t-pro-blue-thumb-600x600.jpg', 65, 0, '2024-12-11', '', 7, 1),
(19, 'Pin sac du phong 2000mAh', '600000.00', '490000.00', './uploads/1733930228pin-sac-du-phong-polymer-20000mah-type-c-10-5w-ava-g-289-thumb-638649544000708683-600x600.jpg', 134, 0, '2024-12-11', '', 2, 1),
(20, 'Tai nghe chup tai Bluetooth Marshall', '3000000.00', '2500000.00', './uploads/1733930328tai-nghe-bluetooth-chup-tai-marshall-major-v-thumb-600x600.jpg', 150, 0, '2024-12-11', '', 8, 1),
(21, 'Tai nghe chup tai Bluetooth true Wireless', '800000.00', '500000.00', './uploads/1733930415tai-nghe-bluetooth-true-wireless-rezo-k50-040924-103457-600x600.jpg', 100, 0, '2024-12-11', '', 8, 1),
(22, 'Tai nghe co day Xiaomi type C', '200000.00', '150000.00', './uploads/1733930479tai-nghe-co-day-ep-type-c-xiaomi-260924-015107-500-600x600.jpg', 80, 0, '2024-12-11', '', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoans`
--

CREATE TABLE `tai_khoans` (
  `id` int NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `anh_dai_dien` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ngay_sinh` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `so_dien_thoai` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gioi_tinh` tinyint(1) NOT NULL DEFAULT '1',
  `dia_chi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `mat_khau` varchar(255) NOT NULL,
  `chuc_vu_id` int NOT NULL,
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tai_khoans`
--

INSERT INTO `tai_khoans` (`id`, `ho_ten`, `anh_dai_dien`, `ngay_sinh`, `email`, `so_dien_thoai`, `gioi_tinh`, `dia_chi`, `mat_khau`, `chuc_vu_id`, `trang_thai`) VALUES
(1, 'Phạm Văn Mạnh Đạt', './uploads/173152594865d0d901c19d92bded2e1a0defa3b95e_original.jpg', '2015-10-25', 'datpvmph55077@gmail.com', '0901670099', 1, 'Hoài Đức, Hà Nội', '$2y$10$2Vmwp5dRXSp8suYPvkKgI.ql3KczZ2caDs90ImS1ODGEiH1yhxb9K', 1, 1),
(2, 'Phạm Huyền Trang', './uploads/173152594865d0d901c19d92bded2e1a0defa3b95e_original.jpg', '2015-10-25', 'xzwybhuyen@gmail.com', '0566916233', 2, 'Thanh Trì, Hà Nội', '123456', 2, 1),
(3, 'www', NULL, '2024-12-10', 'xzwybtrang@gmail.com', '', 1, '', '111111', 2, 1),
(6, 'trans', NULL, NULL, 'xzwybaky@gmail.com', '', 1, '', '222222', 2, 1),
(7, 'www', NULL, NULL, 'xzwybtrans@gmail.com', NULL, 1, NULL, '111', 2, 1),
(8, 'mô Phật', NULL, NULL, 'xzwyb@gmail.com', NULL, 1, NULL, '777777', 2, 1),
(9, 'uyy', NULL, NULL, 'xzwybtran@gmail.com', NULL, 1, NULL, '111', 2, 1),
(11, 'Nguyễn Quang Nam', NULL, NULL, 'namnq@gmail.com', NULL, 1, NULL, '123456', 2, 1),
(12, 'Nguyễn Quang Nam123', NULL, NULL, 'namnq123@gmail.com', ' ', 1, NULL, '$2y$10$5T5yJNc8bYNbktjSPtCD0uyaES6mCmd5dNB6qeJDEFhr5FzFotip6', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trang_thai_don_hangs`
--

CREATE TABLE `trang_thai_don_hangs` (
  `id` int NOT NULL,
  `ten_trang_thai` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trang_thai_don_hangs`
--

INSERT INTO `trang_thai_don_hangs` (`id`, `ten_trang_thai`) VALUES
(1, 'Chưa xác nhận'),
(2, 'Đã xác nhận'),
(3, 'Chưa thanh toán'),
(4, 'Đã thanh toán'),
(5, 'Đang chuẩn bị hàng'),
(6, 'Đang giao'),
(7, 'Đã giao'),
(8, 'Đã nhận'),
(9, 'Thành công'),
(10, 'Hoàn hàng'),
(11, 'Hủy đơn hàng');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binh_luans`
--
ALTER TABLE `binh_luans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chuc_vus`
--
ALTER TABLE `chuc_vus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `danh_mucs`
--
ALTER TABLE `danh_mucs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `don_hangs`
--
ALTER TABLE `don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gio_hangs`
--
ALTER TABLE `gio_hangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `san_phams`
--
ALTER TABLE `san_phams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tai_khoans`
--
ALTER TABLE `tai_khoans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binh_luans`
--
ALTER TABLE `binh_luans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `chuc_vus`
--
ALTER TABLE `chuc_vus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `danh_mucs`
--
ALTER TABLE `danh_mucs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `don_hangs`
--
ALTER TABLE `don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hinh_anh_san_phams`
--
ALTER TABLE `hinh_anh_san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `phuong_thuc_thanh_toans`
--
ALTER TABLE `phuong_thuc_thanh_toans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `san_phams`
--
ALTER TABLE `san_phams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tai_khoans`
--
ALTER TABLE `tai_khoans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
