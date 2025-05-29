-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 29, 2025 at 09:52 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.20

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
(8, 1, 16, 'dep qua\r\n', '2025-04-05', 1),
(9, 11, 16, 'đẹp quá', '2025-04-07', 1),
(10, 3, 16, 'Sản phẩm tốt', '2025-04-23', 1),
(11, 2, 16, 'dien thoai xin', '2025-04-24', 1),
(12, 1, 16, 'san pham tuyet voi', '2025-05-29', 1);

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
(4, 2, 3, '123456.00', 2, '1234567.00'),
(24, 14, 1, '45000000.00', 1, '45000000.00'),
(25, 15, 1, '45000000.00', 1, '45000000.00'),
(26, 16, 12, '400000.00', 2, '800000.00'),
(27, 16, 2, '20000000.00', 3, '60000000.00'),
(28, 18, 13, '13490000.00', 3, '40470000.00'),
(29, 19, 13, '13490000.00', 3, '40470000.00');

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
(2, 'DH-124', 1, 'Nguyễn Quang Nam', 'namnqph12345@gmail.com', '0913578642', '13 Trịnh Văn Bô, Hà Nội', '2024-11-15', '1000000.00', 'Vui lòng cho thức ăn vào 2 túi trước khi giao hàng', 1, 10),
(14, 'DH-3883', 17, 'Nguyễn Quang Nam', 'namnq@gmail.com', '0566916233', 'Thanh Trì, Hà Nội', '2025-04-05', '45020000.00', '', 2, 1),
(15, 'DH-8265', 16, 'Nguyễn Hữu Thịnh', 'thinh@gmail.com', '0566916233', 'Thanh Trì, Hà Nội', '2025-04-05', '45020000.00', '', 2, 9),
(16, 'DH-8439', 16, 'Nguyễn Hữu Thịnh', 'thinh@gmail.com', '0566916233', '13 Trịnh Văn Bô, Hà Nội, Việt Nam', '2025-04-22', '60820000.00', '', 1, 6),
(18, 'DH-2918', 16, 'Nguyễn Hữu Thịnh', 'thinh@gmail.com', '0566916233', '13 Trịnh Văn Bô, Hà Nội, Việt Nam', '2025-04-24', '40490000.00', '', 2, 11),
(19, 'DH-7675', 16, 'Nguyễn Hữu Thịnh', 'thinh@gmail.com', '0566916233', '13 Trịnh Văn Bô, Hà Nội, Việt Nam', '2025-04-24', '40490000.00', '', 1, 9);

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
(20, 17),
(25, 16);

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
(1, 'Iphone 16 Promax Black Titan', '50000000.00', '45000000.00', './uploads/1733928164iphone-16-pro-titan-sa-mac.png', 10, 10, '2024-12-04', '📱 Tổng quan về iPhone 16 \r\n🧊 Thiết kế\r\nKích thước lớn hơn một chút so với iPhone 15 Pro/Pro Max (đặc biệt bản Pro Max có thể lên đến 6.9 inch).\r\n\r\nCụm camera sắp xếp dọc trở lại (tương tự iPhone X) – để hỗ trợ quay video Spatial Video cho Apple Vision Pro.\r\n\r\nCó thể sử dụng chất liệu Titanium như iPhone 15 Pro, giúp nhẹ hơn và bền hơn.\r\n\r\n⚙️ Phần cứng\r\niPhone 16 và 16 Plus có thể dùng chip A17 hoặc A18.\r\n\r\niPhone 16 Pro và Pro Max dự kiến được trang bị chip A18 Pro, tiến trình 3nm.\r\n\r\nTăng RAM (có thể đến 8GB cho bản Pro).\r\n\r\nTản nhiệt vapor chamber (buồng hơi) cho bản Pro để giảm nóng khi chơi game hoặc xử lý nặng.\r\n\r\n📸 Camera\r\niPhone 16 Pro Max có thể nâng cấp camera tele lên 5x hoặc 6x zoom quang học.\r\n\r\nCảm biến chính có thể lớn hơn, cải thiện chụp thiếu sáng.\r\n\r\nAI xử lý ảnh tốt hơn nhờ sức mạnh chip mới.\r\n\r\n🔋 Pin và sạc\r\nDung lượng pin cải thiện nhẹ.\r\n\r\nCó thể hỗ trợ sạc nhanh hơn (lên tới 40W) – nhưng chưa chắc Apple mở khoá mức sạc này.\r\n\r\nVẫn dùng cổng USB-C, tương thích nhiều phụ kiện hơn.\r\n\r\n🧠 Phần mềm & Tính năng\r\nChạy sẵn iOS 18, dự kiến tập trung vào AI nhiều hơn, đặc biệt là AI trên thiết bị.\r\n\r\nCó thể có thêm nút mới gọi là \"Capture Button\" (nút chuyên để quay/chụp nhanh).\r\n\r\nTối ưu tốt hơn cho Apple Vision Pro (Spatial video).', 1, 1),
(2, 'Iphone 16 Promax Titan Sa Mạc', '23000000.00', '20000000.00', './uploads/1733928219iphone-16-pro-max-black-thumb-600x600.jpg', 30, 1000, '2024-12-07', '📱 Tổng quan về iPhone 16 \r\n🧊 Thiết kế\r\nKích thước lớn hơn một chút so với iPhone 15 Pro/Pro Max (đặc biệt bản Pro Max có thể lên đến 6.9 inch).\r\n\r\nCụm camera sắp xếp dọc trở lại (tương tự iPhone X) – để hỗ trợ quay video Spatial Video cho Apple Vision Pro.\r\n\r\nCó thể sử dụng chất liệu Titanium như iPhone 15 Pro, giúp nhẹ hơn và bền hơn.\r\n\r\n⚙️ Phần cứng\r\niPhone 16 và 16 Plus có thể dùng chip A17 hoặc A18.\r\n\r\niPhone 16 Pro và Pro Max dự kiến được trang bị chip A18 Pro, tiến trình 3nm.\r\n\r\nTăng RAM (có thể đến 8GB cho bản Pro).\r\n\r\nTản nhiệt vapor chamber (buồng hơi) cho bản Pro để giảm nóng khi chơi game hoặc xử lý nặng.\r\n\r\n📸 Camera\r\niPhone 16 Pro Max có thể nâng cấp camera tele lên 5x hoặc 6x zoom quang học.\r\n\r\nCảm biến chính có thể lớn hơn, cải thiện chụp thiếu sáng.\r\n\r\nAI xử lý ảnh tốt hơn nhờ sức mạnh chip mới.\r\n\r\n🔋 Pin và sạc\r\nDung lượng pin cải thiện nhẹ.\r\n\r\nCó thể hỗ trợ sạc nhanh hơn (lên tới 40W) – nhưng chưa chắc Apple mở khoá mức sạc này.\r\n\r\nVẫn dùng cổng USB-C, tương thích nhiều phụ kiện hơn.\r\n\r\n🧠 Phần mềm & Tính năng\r\nChạy sẵn iOS 18, dự kiến tập trung vào AI nhiều hơn, đặc biệt là AI trên thiết bị.\r\n\r\nCó thể có thêm nút mới gọi là \"Capture Button\" (nút chuyên để quay/chụp nhanh).\r\n\r\nTối ưu tốt hơn cho Apple Vision Pro (Spatial video).', 1, 1),
(3, 'Bộ Adapter Sạc 3cổng gắn 5 Pro fast 140W', '200000.00', '180000.00', './uploads/1733928283bo-adapter-sac-3-cong-gan5-pro-fast-140w-kem-cap-type-c-type-c-1m-baseus-ccgan140cs-thumb-600x600.jpg', 20, 0, '2024-11-13', '⚙️ Thông số kỹ thuật\r\nModel: CCGAN140CC​\r\n\r\nCổng sạc: 2 cổng Type-C + 1 cổng USB-A​\r\n\r\nCông suất tối đa: 140W​\r\nThế Giới Di Động\r\n\r\nCông nghệ: GaN5 Pro, hỗ trợ PD 3.1, QC 4.0/3.0, AFC, FCP​\r\nBaseus Sài Gòn\r\n+1\r\nTechMall Vietnam Distribution\r\n+1\r\n\r\nKích thước: 90 x 59.5 x 30 mm​\r\nBaseus Sài Gòn\r\n+2\r\nTrung Tâm Bảo Hành\r\n+2\r\nTechMall Vietnam Distribution\r\n+2\r\n\r\nTrọng lượng: Khoảng 304g​\r\nTrung Tâm Bảo Hành\r\n+2\r\nTechMall Vietnam Distribution\r\n+2\r\nBaseus Sài Gòn\r\n+2\r\n\r\nChất liệu: Nhựa PC cao cấp​\r\n\r\nMàu sắc: Đen hoặc Trắng​\r\nTrung Tâm Bảo Hành\r\n+1\r\nBaseus Sài Gòn\r\n+1\r\n\r\nXuất xứ: Trung Quốc​\r\n\r\n🔌 Công suất đầu ra\r\nType-C1: Lên đến 140W (28V/5A)​\r\nTrung Tâm Bảo Hành\r\n+3\r\nTechMall Vietnam Distribution\r\n+3\r\nBaseus Sài Gòn\r\n+3\r\n\r\nType-C2: Lên đến 100W (20V/5A)​\r\nHepsiburada Global\r\n+7\r\nTrung Tâm Bảo Hành\r\n+7\r\nTrung Tâm Bảo Hành\r\n+7\r\n\r\nUSB-A: Lên đến 60W (20V/3A)​\r\nTrung Tâm Bảo Hành\r\n\r\nKhi sử dụng đồng thời:\r\n\r\nType-C1 + Type-C2: 100W + 30W​\r\nTrung Tâm Bảo Hành\r\n+3\r\nTechMall Vietnam Distribution\r\n+3\r\nTrung Tâm Bảo Hành\r\n+3\r\n\r\nType-C1 + USB-A: 100W + 30W​\r\nTechMall Vietnam Distribution\r\n+1\r\nTrung Tâm Bảo Hành\r\n+1\r\n\r\nType-C1 + Type-C2 + USB-A: 100W + 20W + 18W​\r\nBaseus Sài Gòn\r\n+2\r\nTechMall Vietnam Distribution\r\n+2\r\nTrung Tâm Bảo Hành\r\n+2\r\n\r\n🎁 Phụ kiện đi kèm\r\nCáp sạc nhanh Type-C to Type-C công suất 240W, dài 1m​\r\n\r\n💡 Ưu điểm nổi bật\r\nCông nghệ GaN5 Pro: Giúp giảm kích thước và tăng hiệu suất sạc.​\r\n\r\nHỗ trợ sạc nhanh PD 3.1: Phù hợp với các thiết bị hiện đại như MacBook Pro, iPhone, iPad, v.v.​\r\n\r\nSạc đồng thời 3 thiết bị: Tiết kiệm thời gian và không gian.​\r\n\r\nThiết kế nhỏ gọn: Dễ dàng mang theo khi di chuyển.​', 2, 1),
(11, 'Iphone 16', '23000000.00', '20000000.00', './uploads/1733928362iphone-16-xanh-600x600.png', 9, 0, '2024-12-09', '📱 Tổng quan về iPhone 16 \r\n🧊 Thiết kế\r\nKích thước lớn hơn một chút so với iPhone 15 Pro/Pro Max (đặc biệt bản Pro Max có thể lên đến 6.9 inch).\r\n\r\nCụm camera sắp xếp dọc trở lại (tương tự iPhone X) – để hỗ trợ quay video Spatial Video cho Apple Vision Pro.\r\n\r\nCó thể sử dụng chất liệu Titanium như iPhone 15 Pro, giúp nhẹ hơn và bền hơn.\r\n\r\n⚙️ Phần cứng\r\niPhone 16 và 16 Plus có thể dùng chip A17 hoặc A18.\r\n\r\niPhone 16 Pro và Pro Max dự kiến được trang bị chip A18 Pro, tiến trình 3nm.\r\n\r\nTăng RAM (có thể đến 8GB cho bản Pro).\r\n\r\nTản nhiệt vapor chamber (buồng hơi) cho bản Pro để giảm nóng khi chơi game hoặc xử lý nặng.\r\n\r\n📸 Camera\r\niPhone 16 Pro Max có thể nâng cấp camera tele lên 5x hoặc 6x zoom quang học.\r\n\r\nCảm biến chính có thể lớn hơn, cải thiện chụp thiếu sáng.\r\n\r\nAI xử lý ảnh tốt hơn nhờ sức mạnh chip mới.\r\n\r\n🔋 Pin và sạc\r\nDung lượng pin cải thiện nhẹ.\r\n\r\nCó thể hỗ trợ sạc nhanh hơn (lên tới 40W) – nhưng chưa chắc Apple mở khoá mức sạc này.\r\n\r\nVẫn dùng cổng USB-C, tương thích nhiều phụ kiện hơn.\r\n\r\n🧠 Phần mềm & Tính năng\r\nChạy sẵn iOS 18, dự kiến tập trung vào AI nhiều hơn, đặc biệt là AI trên thiết bị.\r\n\r\nCó thể có thêm nút mới gọi là \"Capture Button\" (nút chuyên để quay/chụp nhanh).\r\n\r\nTối ưu tốt hơn cho Apple Vision Pro (Spatial video).', 1, 1),
(12, 'Pin Sạc Dự Phòng 20000mah type c pd qc3022 5w xmobile ym 672', '430000.00', '400000.00', './uploads/1733928693bo-adapter-sac-kem-cap-type-c-type-c-pd-45w-samsung-ep-t4511xb-600x600.jpg', 40, 0, '2024-12-06', '🔋 Thông số kỹ thuật chính\r\nDung lượng pin: 20.000 mAh​\r\n\r\nLõi pin: Li-Ion​\r\n\r\nHiệu suất sạc: 60%​\r\n\r\nCông nghệ sạc nhanh: Power Delivery (PD) và Quick Charge 3.0 (QC 3.0)​\r\nĐiện Máy Xanh\r\n+2\r\nTrung Tâm Bảo Hành\r\n+2\r\nĐiện Máy Xanh\r\n+2\r\n\r\nCông suất tối đa: 22.5W​\r\n\r\nCổng sạc:\r\n\r\n2 cổng USB-A: 5V - 3A, 9V - 2A, 10V - 2.25A, 12V - 1.5A​\r\nTrung Tâm Bảo Hành\r\n+2\r\nĐiện Máy Xanh\r\n+2\r\nĐiện Máy Xanh\r\n+2\r\n\r\n2 cổng Type-C: 5V - 3A, 9V - 2.22A, 12V - 1.67A​\r\nĐiện Máy Xanh\r\n+1\r\nĐiện Máy Xanh\r\n+1\r\n\r\nThời gian sạc đầy: 5 - 6 giờ (sử dụng Adapter 3A)​\r\nTrung Tâm Bảo Hành\r\n+3\r\nĐiện Máy Xanh\r\n+3\r\nĐiện Máy Xanh\r\n+3\r\n\r\nKích thước: Dài 9.5 cm x Rộng 5.2 cm x Dày 4.8 cm​\r\nĐiện Máy Xanh\r\n+1\r\nĐiện Máy Xanh\r\n+1\r\n\r\nTrọng lượng: 343 g​\r\nĐiện Máy Xanh\r\n\r\nMàn hình hiển thị: LED hiển thị mức pin còn lại​\r\nĐiện Máy Xanh\r\n+2\r\nĐiện Máy Xanh\r\n+2\r\nĐiện Máy Xanh\r\n+2\r\n\r\nThương hiệu: Xmobile (thuộc Thế Giới Di Động)​\r\nTrung Tâm Bảo Hành\r\n+4\r\nĐiện Máy Xanh\r\n+4\r\nĐiện Máy Xanh\r\n+4\r\n\r\nSản xuất tại: Trung Quốc​\r\nĐiện Máy Xanh\r\n\r\n✅ Ưu điểm nổi bật\r\nDung lượng lớn: Với 20.000 mAh, pin sạc có thể cung cấp năng lượng cho nhiều lần sạc, phù hợp cho những chuyến đi dài ngày hoặc khi không có nguồn điện gần.​\r\n\r\nSạc nhanh hiệu quả: Hỗ trợ công nghệ PD và QC 3.0, đảm bảo sạc nhanh và an toàn cho các thiết bị tương thích.​\r\n\r\nThiết kế tiện lợi: Kích thước nhỏ gọn với dây đeo tích hợp, dễ dàng mang theo bên mình.​\r\nĐiện Máy Xanh\r\n\r\nMàn hình LED: Giúp người dùng dễ dàng theo dõi dung lượng pin còn lại.​\r\nĐiện Máy Xanh\r\n+1\r\nĐiện Máy Xanh\r\n+1\r\n\r\nĐa cổng sạc: Cho phép sạc đồng thời nhiều thiết bị, tiết kiệm thời gian.​\r\nĐiện Máy Xanh', 2, 1),
(13, 'Realme note 60', '13900000.00', '13490000.00', './uploads/1733929246realme-note-60-black-thumb-600x600.jpg', 120, 0, '2024-12-11', '📱 Thiết kế & Màn hình\r\nMàn hình: IPS LCD 6.74 inch, độ phân giải HD+ (1600 x 720 pixels), tần số quét 90Hz, độ sáng tối đa 560 nits .​\r\nClickbuy\r\n+1\r\nCellphoneS\r\n+1\r\n\r\nThiết kế: Khung và mặt lưng bằng nhựa, mặt trước kính.​\r\nClickbuy\r\n+1\r\nKalvo\r\n+1\r\n\r\nKích thước: 167.3 x 76.7 x 7.8 mm; trọng lượng 187g .​\r\nKalvo\r\n\r\nChống bụi/nước: Chuẩn IP64 – chống bụi và chống bắn nước nhẹ .​\r\nCellphoneS\r\n+8\r\nKalvo\r\n+8\r\nClickbuy\r\n+8\r\n\r\n⚙️ Hiệu năng & Bộ nhớ\r\nVi xử lý: Unisoc Tiger T612 (8 nhân: 2x Cortex-A75 & 6x Cortex-A55, xung nhịp 1.8 GHz) .​\r\nHoàng Hà Mobile\r\n+6\r\nMobileCity\r\n+6\r\nThế Giới Di Động\r\n+6\r\n\r\nGPU: Mali-G57 .​\r\nClickbuy\r\n+3\r\nMobileCity\r\n+3\r\nĐiện Máy Xanh\r\n+3\r\n\r\nRAM: Tùy chọn 4GB hoặc 6GB.​\r\n\r\nBộ nhớ trong: 64GB hoặc 128GB, hỗ trợ thẻ nhớ microSD tối đa 2TB .​\r\n\r\nHệ điều hành: Android 14 với giao diện Realme UI 5.0 .​\r\nMobileCity\r\n+1\r\nHoàng Hà Mobile\r\n+1\r\n\r\n📸 Camera\r\nCamera sau: Chính 32MP (f/1.8), hỗ trợ quay video 1080p@30fps, có đèn flash LED, HDR và panorama .​\r\nMobileCity\r\n+1\r\nThế Giới Di Động\r\n+1\r\n\r\nCamera trước: 5MP (góc rộng), hỗ trợ quay video và các tính năng làm đẹp .​\r\nMobileCity\r\n\r\n🔋 Pin & Sạc\r\nDung lượng pin: 5000mAh, duy trì hơn 80% dung lượng sau 1000 chu kỳ sạc .​\r\nRealme\r\n\r\nSạc nhanh: Hỗ trợ sạc nhanh 10W qua cổng USB Type-C .​', 3, 1),
(14, 'Realme note 50', '14990000.00', '14390000.00', './uploads/1733929326realme-note-50-blue-thumb-600x600.jpg', 130, 0, '2024-12-11', '📱 Thiết kế & Màn hình\r\nMàn hình: IPS LCD 6.74 inch, độ phân giải HD+ (720 x 1600 pixels), tần số quét 90Hz, độ sáng tối đa 560 nits, tỷ lệ hiển thị 20:9 .​\r\nMobileCity\r\n\r\nThiết kế: Khung nhựa vuông vức, mặt lưng nhựa giả kính, mặt trước kính cường lực Panda.​\r\n\r\nKích thước & Trọng lượng: 167.2 x 76.7 x 8 mm; 186g \r\nMobileCity\r\n.​\r\n\r\nKháng nước & bụi: Chuẩn IP54 .​\r\nKhang Nhung\r\n+4\r\nMobileCity\r\n+4\r\nThương Gia Đỗ\r\n+4\r\n\r\n⚙️ Hiệu năng & Bộ nhớ\r\nChipset: Unisoc Tiger T612 (12nm), 8 nhân (2x Cortex-A75 1.8GHz + 6x Cortex-A55 1.8GHz) .​\r\nthephonetalks.com\r\n+8\r\nMobileCity\r\n+8\r\nWikipedia\r\n+8\r\n\r\nGPU: Mali-G57 .​\r\nĐiện Máy Xanh\r\n+4\r\nMobileCity\r\n+4\r\nKalvo\r\n+4\r\n\r\nRAM: 3GB hoặc 4GB LPDDR4X, hỗ trợ mở rộng RAM ảo lên đến 8GB .​\r\nMobileCity\r\n+1\r\nKalvo\r\n+1\r\n\r\nBộ nhớ trong: 64GB hoặc 128GB eMMC 5.1, hỗ trợ thẻ nhớ microSD lên đến 2TB .​\r\nWikipedia\r\n+2\r\nMobileCity\r\n+2\r\nKalvo\r\n+2\r\n\r\nHệ điều hành: Android 13 với giao diện Realme UI T Edition .​\r\nKalvo\r\n+2\r\nWikipedia\r\n+2\r\nMobileCity\r\n+2\r\n\r\n📸 Camera\r\nCamera sau: Cảm biến chính 13MP (f/2.2) + cảm biến phụ 0.08MP, hỗ trợ lấy nét PDAF, quay video 1080p@30fps .​\r\nKhang Nhung\r\n+2\r\nWikipedia\r\n+2\r\nCellphoneS\r\n+2\r\n\r\nCamera trước: 5MP (f/2.2), hỗ trợ HDR, quay video 720p@30fps .​\r\nMobileCity\r\n\r\n🔋 Pin & Sạc\r\nDung lượng pin: 5.000 mAh .​\r\nWikipedia\r\n\r\nSạc: Hỗ trợ sạc 10W qua cổng USB-C .​\r\nMobileCity\r\n\r\n📶 Kết nối & SIM\r\nSIM: 2 Nano SIM, hỗ trợ 4G .​\r\nMobileCity\r\n+1\r\nKhang Nhung\r\n+1\r\n\r\nKết nối: Wi-Fi, Bluetooth, GPS, cổng 3.5mm .​\r\n\r\n🎨 Màu sắc & Giá bán\r\nMàu sắc: Sky Blue (Xanh Trời) và Midnight Black (Đen Nửa Đêm) .​\r\nThương Gia Đỗ\r\n\r\nGiá bán: Khoảng 2.490.000₫ cho phiên bản 4GB RAM + 128GB ROM .', 3, 1),
(15, 'Samsung galaxy A55', '10900000.00', '10490000.00', './uploads/1733929514samsung-galaxy-a55-5g-xanh-thumb-1-600x600.jpg', 140, 0, '2024-12-11', '📱 Thiết kế & Màn hình\r\nMàn hình: Super AMOLED 6.6 inch, độ phân giải Full HD+ (1080 x 2340 pixels), tần số quét 120Hz, độ sáng tối đa 1.000 nits, hỗ trợ HDR10+ .​\r\n\r\nChất liệu: Khung nhôm, mặt trước Gorilla Glass Victus+, mặt lưng kính Gorilla Glass .​\r\nKalvo\r\n+1\r\nWikipedia, l\'enciclopedia libera\r\n+1\r\n\r\nKích thước & Trọng lượng: 161.1 x 77.4 x 8.2 mm; 213g .​\r\nKalvo\r\n\r\nKháng nước & bụi: Chuẩn IP67 – chịu được ngâm nước ở độ sâu 1m trong 30 phút \r\nKalvo\r\n.​\r\n\r\n⚙️ Hiệu năng & Bộ nhớ\r\nChipset: Samsung Exynos 1480 (4nm), CPU 8 nhân (4x Cortex-A78 2.75GHz + 4x Cortex-A55 2.0GHz), GPU Xclipse 530 \r\nWikipedia, l\'enciclopedia libera\r\n.​\r\n\r\nRAM: 8GB hoặc 12GB \r\nThế Giới Di Động\r\n.​\r\n\r\nBộ nhớ trong: 128GB hoặc 256GB, hỗ trợ thẻ nhớ microSD lên đến 1TB \r\nThế Giới Di Động\r\n.​\r\n\r\nHệ điều hành: Android 14 với giao diện One UI 6.1 .​\r\nThế Giới Di Động\r\n+2\r\nWikipedia, l\'enciclopedia libera\r\n+2\r\nThế Giới Di Động\r\n+2\r\n\r\n📸 Camera\r\nCamera sau:\r\n\r\nChính: 50MP (f/1.8), hỗ trợ OIS và PDAF​\r\n\r\nGóc siêu rộng: 12MP (f/2.2)​\r\nThế Giới Di Động\r\n+2\r\nCellphoneS\r\n+2\r\nThế Giới Di Động\r\n+2\r\n\r\nMacro: 5MP (f/2.4)​\r\nWikipedia, l\'enciclopedia libera\r\n\r\nQuay video: 4K@30fps, 1080p@30/60fps với chống rung điện tử (gyro-EIS) .​\r\nWikipedia, l\'enciclopedia libera\r\n\r\nCamera trước: 32MP (f/2.2), quay video 4K@30fps hoặc 1080p@30/60fps .​\r\nWikipedia, l\'enciclopedia libera\r\n\r\n🔋 Pin & Sạc\r\nDung lượng pin: 5.000 mAh​\r\nSamsung\r\n+4\r\nSamsung\r\n+4\r\nSamsung\r\n+4\r\n\r\nSạc nhanh: 25W qua cổng USB-C .​\r\n\r\n📶 Kết nối & Tính năng khác\r\nKết nối: 5G, Wi-Fi 6, Bluetooth 5.3, NFC (tùy khu vực), GPS, GLONASS, GALILEO, BDS, QZSS .​\r\nWikipedia, l\'enciclopedia libera\r\n\r\nSIM: Hỗ trợ 2 SIM (Nano SIM hoặc eSIM) .​\r\n\r\nCảm biến: Vân tay dưới màn hình, gia tốc, con quay hồi chuyển, tiệm cận, la bàn .​\r\n\r\n🎨 Màu sắc & Giá bán\r\nMàu sắc: Xanh Iceblue, Tím Lilac, Xanh Navy, Vàng Lemon .​\r\nWikipedia, l\'enciclopedia libera\r\n+5\r\nSamsung\r\n+5\r\nSamsung\r\n+5\r\n\r\nGiá bán: Khoảng 11.100.000₫ cho phiên bản 8GB RAM + 128GB ROM .', 6, 1),
(16, 'Samsung galaxy S23', '9900000.00', '9490000.00', './uploads/1733929639samsung-galaxy-s23-fe-mint-thumbnew-600x600.jpg', 150, 0, '2024-12-11', '📱 Thiết kế & Màn hình\r\nKích thước: 146.3 x 70.9 x 7.6 mm​\r\nKalvo\r\n\r\nTrọng lượng: 168g​\r\nKalvo\r\n\r\nChất liệu: Khung nhôm Armor Aluminum, mặt trước và sau bằng kính Gorilla Glass Victus 2​\r\n\r\nChuẩn kháng nước & bụi: IP68​\r\n\r\nMàn hình: Dynamic AMOLED 2X 6.1 inch, độ phân giải Full HD+ (1080 x 2340 pixels), tần số quét 120Hz, hỗ trợ HDR10+​\r\n\r\n⚙️ Hiệu năng & Bộ nhớ\r\nVi xử lý: Qualcomm Snapdragon 8 Gen 2 for Galaxy (4nm)​\r\n\r\nRAM: 8GB​\r\n\r\nBộ nhớ trong: 128GB hoặc 256GB (không hỗ trợ thẻ nhớ microSD)​\r\n\r\nHệ điều hành: Android 13 với giao diện One UI 5.1​\r\n\r\n📸 Camera\r\nCamera sau:\r\n\r\nChính: 50MP, khẩu độ f/1.8, hỗ trợ OIS​\r\n\r\nGóc siêu rộng: 12MP, khẩu độ f/2.2​\r\nSamsung\r\n\r\nTelephoto: 10MP, khẩu độ f/2.4, zoom quang học 3x​\r\n\r\nCamera trước: 12MP, khẩu độ f/2.2​\r\n\r\nQuay video: Hỗ trợ quay video 8K@24fps, 4K@30/60fps, 1080p@30/60/240fps, 720p@960fps​\r\n\r\n🔋 Pin & Sạc\r\nDung lượng pin: 3.900 mAh​\r\n\r\nSạc nhanh: 25W​\r\n\r\nSạc không dây: Hỗ trợ sạc không dây và sạc ngược không dây​\r\n\r\n📶 Kết nối & Tính năng khác\r\nKết nối: 5G, Wi-Fi 6E, Bluetooth 5.3, NFC, USB Type-C​\r\n\r\nCảm biến: Vân tay dưới màn hình, gia tốc, con quay hồi chuyển, tiệm cận, la bàn​\r\n\r\nÂm thanh: Loa stereo hỗ trợ Dolby Atmos​\r\n\r\n🎨 Màu sắc & Giá bán\r\nMàu sắc: Phantom Black, Cream, Green, Lavender​\r\nwired.com\r\n+1\r\nCroma Điện Tử\r\n+1\r\n\r\nGiá bán: Khoảng 20.990.000₫ cho phiên bản 128GB', 6, 1),
(17, 'Xiaomi 14T', '8900000.00', '8490000.00', './uploads/1733930058xiaomi-14t-grey-thumb-600x600.jpg', 55, 0, '2024-12-11', '📱 Thiết kế & Màn hình\r\nMàn hình: AMOLED 6.67 inch, độ phân giải 2712 x 1220 pixels, tần số quét lên đến 144Hz, mật độ điểm ảnh 446 ppi .​\r\nXiaomi\r\n\r\nKhung viền: Viền màn hình mỏng chỉ 1.9mm, mang lại trải nghiệm hiển thị cân đối và sống động .​\r\nAmazon\r\n\r\nKích thước & Trọng lượng: 193g hoặc 195g, độ dày 7.8mm .​\r\nGSMArena\r\n\r\nKhả năng kháng nước & bụi: Chuẩn IP68, bảo vệ thiết bị khỏi nước và bụi bẩn \r\nWIRED\r\n.​\r\n\r\n⚙️ Hiệu năng & Bộ nhớ\r\nVi xử lý: MediaTek Dimensity 8300 Ultra, sản xuất trên tiến trình 4nm, mang lại hiệu suất mạnh mẽ và tiết kiệm năng lượng \r\nGSMArena\r\n.​\r\n\r\nRAM & Bộ nhớ trong: Tùy chọn 12GB hoặc 16GB RAM, bộ nhớ trong 256GB hoặc 512GB, không hỗ trợ thẻ nhớ microSD \r\nGSMArena\r\n.​\r\n\r\nHệ điều hành: Android 14 với giao diện HyperOS, hỗ trợ cập nhật phần mềm trong 4 năm và bản vá bảo mật trong 5 năm \r\nWIRED\r\n.​\r\n\r\n📸 Camera\r\nCamera sau:\r\n\r\nChính: 50MP, hỗ trợ quay video 2160p \r\nGSMArena\r\n.​\r\n\r\nGóc siêu rộng: 12MP \r\nWikipedia, l\'enciclopedia libera\r\n.​\r\n\r\nỐng kính Leica, hỗ trợ các bộ lọc và chế độ chụp ảnh chuyên nghiệp \r\nReddit\r\n.​\r\n\r\nCamera trước: Thông tin chi tiết chưa được công bố.​\r\n\r\n🔋 Pin & Sạc\r\nDung lượng pin: 5.000 mAh, sử dụng chip quản lý pin Xiaomi Surge G1, giúp kéo dài tuổi thọ pin lên đến 1.600 chu kỳ sạc \r\nXiaomi\r\n.​\r\n\r\nSạc nhanh: Hỗ trợ sạc nhanh 67W, giúp nạp đầy pin trong thời gian ngắn \r\nGSMArena\r\n.​\r\n\r\n📶 Kết nối & Tính năng khác\r\nKết nối: Hỗ trợ 5G, Wi-Fi, Bluetooth, NFC và cổng USB-C \r\nGSMArena\r\n.​\r\n\r\nTính năng đặc biệt: Hỗ trợ tính năng \"Circle to Search\" của Google, cho phép tìm kiếm nhanh chóng bằng cách khoanh vùng trên màn hình \r\nWikipedia, l\'enciclopedia libera\r\n.​\r\n\r\n🎨 Màu sắc & Giá bán\r\nMàu sắc: Titan Black, Titan Blue, Titan Gray và Lemon Green (chỉ có ở phiên bản 14T) .​\r\nWIRED\r\n\r\nGiá bán: Khoảng 649 EUR cho phiên bản tiêu chuẩn .​', 7, 1),
(18, 'Xiaomi 14T Pro', '10900000.00', '10490000.00', './uploads/1733930125xiaomi-14t-pro-blue-thumb-600x600.jpg', 65, 0, '2024-12-11', '📱 Thiết kế & Màn hình\r\nMàn hình: AMOLED 6.67 inch, độ phân giải 1.5K (2712 x 1220 pixels), tần số quét 144Hz, độ sáng tối đa 4000 nits, hỗ trợ HDR10+ và Dolby Vision .​\r\nXiaomi\r\n\r\nThiết kế: Khung nhôm, mặt kính Gorilla Glass Victus 2, đạt chuẩn kháng nước và bụi IP68 .​\r\n\r\nMàu sắc: Titan Black, Titan Blue, Titan Gray.​\r\nKalvo\r\n\r\n⚙️ Hiệu năng & Bộ nhớ\r\nVi xử lý: MediaTek Dimensity 9300+ (4nm), CPU 8 nhân (1x3.4GHz + 3x2.85GHz + 4x2.0GHz), GPU Immortalis-G720 MC12 .​\r\nMobileCity\r\n+1\r\nThế Giới Di Động\r\n+1\r\n\r\nRAM: 12GB hoặc 16GB LPDDR5X.​\r\nMobileCity\r\n\r\nBộ nhớ trong: 256GB, 512GB hoặc 1TB UFS 4.0 (không hỗ trợ thẻ nhớ ngoài).​\r\n\r\nHệ điều hành: HyperOS (Android 14), hỗ trợ cập nhật phần mềm trong 4 năm và bản vá bảo mật trong 5 năm .​\r\nWIRED\r\n\r\n📸 Camera\r\nCamera sau:\r\n\r\nChính: 50MP (Light Fusion 900), khẩu độ f/1.6, chống rung quang học OIS.​\r\nXiaomi\r\n+3\r\nXiaomi\r\n+3\r\nViettelStore.vn\r\n+3\r\n\r\nTele: 50MP, khẩu độ f/2.0, zoom quang học 2x.​\r\n\r\nGóc siêu rộng: 12MP, khẩu độ f/2.2, góc nhìn 120°.​\r\n\r\nTính năng: Hợp tác với Leica, hỗ trợ các chế độ chụp chuyên nghiệp như Leica Authentic, Leica Vibrant, ProFocus, ProCut, quay video 8K@24/30fps, 4K@60fps, chế độ quay đêm Ultra Night Video .​\r\nXiaomi\r\n\r\nCamera trước: 32MP, khẩu độ f/2.0, hỗ trợ quay video 4K@30fps, HDR10+ .​\r\nMobileCity\r\n\r\n🔋 Pin & Sạc\r\nDung lượng pin: 5.000 mAh.​\r\nMobileCity\r\n+1\r\nWIRED\r\n+1\r\n\r\nSạc nhanh: 120W (có dây), sạc đầy 100% trong khoảng 19 phút.​\r\n\r\nSạc không dây: 50W .​\r\nXiaomiTime\r\n+8\r\nXiaomi\r\n+8\r\nXiaomi\r\n+8\r\n\r\n📶 Kết nối & Tính năng khác\r\nKết nối: 5G, Wi-Fi 6E, Bluetooth 5.4, NFC, USB-C.​\r\n\r\nSIM: Hỗ trợ 2 SIM Nano hoặc 1 Nano SIM + 1 eSIM .​\r\nMobileCity\r\n\r\nÂm thanh: Loa stereo kép, hỗ trợ Dolby Atmos.​', 7, 1),
(19, 'Pin Sạc Dự Phòng 20000mAh', '600000.00', '490000.00', './uploads/1733930228pin-sac-du-phong-polymer-20000mah-type-c-10-5w-ava-g-289-thumb-638649544000708683-600x600.jpg', 134, 0, '2024-12-11', '⚙️ Thông số kỹ thuật:\r\nDung lượng pin: 20.000mAh – cho phép sạc iPhone 2.5–4 lần, iPad 1.5 lần, hoặc điện thoại Android từ 3–5 lần (tùy dung lượng pin thiết bị).\r\n\r\nCổng vào (Input):\r\n\r\nMicro USB: 5V/2A\r\n\r\nType-C: 5V/3A\r\n\r\nCổng ra (Output):\r\n\r\nUSB 1: 5V/2.4A\r\n\r\nUSB 2: 5V/3A (QC 3.0)\r\n\r\nType-C: Hỗ trợ sạc nhanh PD (Power Delivery) lên đến 18W/22.5W\r\n\r\n⚡ Tính năng nổi bật:\r\nSạc nhanh QC 3.0 và PD: Giúp rút ngắn thời gian sạc cho cả điện thoại và sạc lại pin dự phòng.\r\n\r\nHỗ trợ sạc 2–3 thiết bị cùng lúc mà vẫn đảm bảo ổn định dòng điện.\r\n\r\nTương thích cao: Dùng được cho hầu hết các thiết bị như iPhone, iPad, Samsung, Xiaomi, Oppo, tai nghe, máy chơi game cầm tay,...\r\n\r\nThiết kế nhỏ gọn nhưng vẫn chắc chắn, vỏ ngoài bằng nhựa ABS chống va đập nhẹ và trầy xước.\r\n\r\nTích hợp mạch bảo vệ thông minh: Ngăn ngừa quá nhiệt, quá áp, ngắn mạch, tự động ngắt khi đầy pin.\r\n\r\n🔌 Phù hợp cho:\r\nNgười thường xuyên đi du lịch, công tác dài ngày.\r\n\r\nNgười dùng nhiều thiết bị (điện thoại, tai nghe, đồng hồ thông minh).\r\n\r\nHọc sinh, sinh viên hoặc dân văn phòng cần sạc mọi lúc mọi nơi.\r\n\r\n🎨 Màu sắc phổ biến:\r\nĐen, Trắng, Xanh Navy, Hồng Pastel.', 2, 1),
(20, 'Tai nghe chụp tai Bluetooth Marshall', '3000000.00', '2500000.00', './uploads/1733930328tai-nghe-bluetooth-chup-tai-marshall-major-v-thumb-600x600.jpg', 150, 0, '2024-12-11', 'Marshall Major IV:\r\n\r\nThiết kế: Phong cách cổ điển với màu đen và chi tiết vàng, logo Marshall nổi bật.​\r\nTín Đồ Tai Nghe\r\n\r\nThời lượng pin: Khoảng 80 giờ sử dụng liên tục, sạc đầy trong 3 giờ.​\r\nThế Giới Di Động\r\n+1\r\nThế Giới Di Động\r\n+1\r\n\r\nKết nối: Bluetooth 5.0, hỗ trợ kết nối cùng lúc 2 thiết bị.​\r\nThế Giới Di Động\r\n+1\r\nThế Giới Di Động\r\n+1\r\n\r\nĐiều khiển: Nút joystick và các phím chức năng để tăng/giảm âm lượng, chuyển bài hát, nhận/ngắt cuộc gọi.​\r\n\r\nMarshall Monitor II A.N.C.:\r\n\r\nThiết kế: Over-ear với chất liệu cao cấp, đệm tai mềm mại.​\r\n\r\nChống ồn: Công nghệ chống ồn chủ động (ANC) hiệu quả.​\r\nThế Giới Di Động\r\n\r\nThời lượng pin: Lên đến 30 giờ với ANC bật, sạc nhanh trong 15 phút cho 5 giờ sử dụng.​\r\n\r\nKết nối: Bluetooth 5.0, hỗ trợ aptX Adaptive.\r\n\r\nMarshall Major V:\r\n\r\nThiết kế: Nhẹ nhàng, hiện đại với khung nhôm và đệm tai thoải mái.​\r\n\r\nThời lượng pin: Lên đến 100 giờ sử dụng, sạc đầy trong 3 giờ.​\r\nThế Giới Di Động\r\n\r\nKết nối: Bluetooth 5.0, có thể kết nối cùng lúc 2 thiết bị.​\r\nThế Giới Di Động\r\n+1\r\nThế Giới Di Động\r\n+1\r\n\r\nĐiều khiển: Nút joystick và các phím chức năng tiện lợi.', 8, 1),
(21, 'Tai nghe chụp tai Bluetooth True Wireless', '800000.00', '500000.00', './uploads/1733930415tai-nghe-bluetooth-true-wireless-rezo-k50-040924-103457-600x600.jpg', 100, 0, '2024-12-11', 'Tai nghe chụp tai Bluetooth True Wireless kết hợp thiết kế chụp tai với khả năng kết nối không dây hoàn toàn, mang lại sự tiện lợi và chất lượng âm thanh vượt trội. Dưới đây là một số mẫu tai nghe đáng chú ý trong phân khúc này:​\r\n\r\nSony WH-1000XM4\r\nĐược trang bị công nghệ chống ồn hàng đầu, chất lượng âm thanh Hi-Res và thời lượng pin lên đến 30 giờ. ​\r\nMyshoes.vn - Giày Chính Hãng\r\n\r\n\r\nBose QuietComfort 35 II\r\nNổi bật với khả năng chống ồn hiệu quả, thiết kế thoải mái và tích hợp trợ lý ảo Google Assistant.​\r\n\r\n\r\nSennheiser Momentum 3\r\nMang lại chất lượng âm thanh tuyệt hảo, thiết kế sang trọng và tính năng tự động tắt khi không sử dụng.​\r\n\r\n\r\nJabra Elite 85h\r\nCó khả năng chống ồn thông minh, chất lượng cuộc gọi rõ ràng và thời lượng pin ấn tượng.​\r\n\r\n\r\nMarshall Monitor II A.N.C.\r\nKết hợp giữa thiết kế cổ điển và công nghệ hiện đại, mang lại chất lượng âm thanh đặc trưng của Marshall.', 8, 1),
(22, 'Tai nghe có dây Xiaomi Type-C', '200000.00', '150000.00', './uploads/1733930479tai-nghe-co-day-ep-type-c-xiaomi-260924-015107-500-600x600.jpg', 80, 0, '2024-12-11', 'Tai nghe có dây Xiaomi Type-C là lựa chọn lý tưởng cho người dùng muốn trải nghiệm âm thanh chất lượng cao thông qua kết nối USB Type-C ổn định. Dưới đây là một số thông tin chi tiết về sản phẩm:​\r\nXiaoMingHeAn\r\n+3\r\nCellphoneS\r\n+3\r\nxiaomihaiduong.vn\r\n+3\r\n\r\nThiết kế và chất lượng âm thanh:\r\n\r\nDriver 12.4mm: Trang bị driver lớn giúp tái tạo âm thanh chân thực, sống động với dải bass mạnh mẽ và treble trong trẻo. ​\r\nxiaomihaiduong.vn\r\n+2\r\nXiaoMingHeAn\r\n+2\r\nCellphoneS\r\n+2\r\n\r\nThiết kế in-ear: Đảm bảo vừa vặn, thoải mái khi đeo và giảm thiểu tiếng ồn từ môi trường xung quanh. ​\r\nChiếc Tàu Mobile\r\n+2\r\nViettelStore.vn\r\n+2\r\nXiaomi\r\n+2\r\n\r\nTính năng nổi bật:\r\n\r\nMicro HD tích hợp: Hỗ trợ cuộc gọi rõ ràng nhờ công nghệ khử tiếng ồn hiệu quả. ​\r\nXiaomi\r\n\r\nKhả năng chống nước và bụi IP54: Bảo vệ tai nghe khỏi nước và bụi, phù hợp cho hoạt động thể thao và di chuyển. ​\r\nViettelStore.vn\r\n\r\nĐiều khiển dễ dàng: Ba nút vật lý trên dây giúp điều chỉnh âm lượng và quản lý cuộc gọi thuận tiện. ​\r\nXiaomi\r\n\r\nKết nối và tương thích:\r\n\r\nCổng Type-C: Đảm bảo kết nối nhanh chóng và ổn định với các thiết bị hỗ trợ cổng USB Type-C. ​\r\n\r\nChiều dài dây 1.25m: Tạo sự linh hoạt và thoải mái khi sử dụng. ​\r\n\r\nThông số kỹ thuật:\r\n\r\nTrở kháng: 32Ω​\r\nChiếc Tàu Mobile\r\n\r\nĐộ nhạy: ≥125dB SPL@1mW, 1000Hz​\r\nChiếc Tàu Mobile\r\n+1\r\nViettelStore.vn\r\n+1\r\n\r\nChiều dài cáp: 1.25m​\r\nXiaoMingHeAn\r\n+2\r\nChiếc Tàu Mobile\r\n+2\r\nHoco Việt Nam\r\n+2\r\n\r\nTrọng lượng: 13.5g', 8, 1);

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
(1, 'Phạm Văn Mạnh Đạt', NULL, '2015-10-25', 'datpvmph55077@gmail.com', '0901670099', 1, 'Hoài Đức, Hà Nội', '$2y$10$.owl2d.FqCqT49Q7TyEbJ.Wz5Kh7KKadKupjXqXvJIckVR7G4sTRG', 1, 1),
(12, 'Nguyễn Quang Nam', NULL, NULL, 'namnq123@gmail.com', '     ', 1, NULL, '$2y$10$p5jEd1aun.vU.HxYvJJLh.wyBPpAci/jMZqDu8J9qrffDu5k4dQT6', 1, 1),
(16, 'Nguyễn Hữu Thịnh', 'uploads/avatars/1748463575back-end-development-1.jpg', '2009-06-21', 'thinh@gmail.com', '0978563431', 1, 'Hà Nội', '$2y$10$noE0FffbPVKp5GL52uOVae9LxxTeVLWPl9k6TYviBdrrcyZV7h/Ze', 2, 1),
(17, 'Nguyễn Quang Nam', NULL, NULL, 'namnq@gmail.com', NULL, 1, NULL, '$2y$10$Q4XPB22w5NppDnkA1EZOkOQGkaWy8AlagxAjgrTjBLqbCg6ZP6AJS', 2, 1);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hangs`
--
ALTER TABLE `chi_tiet_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `chi_tiet_gio_hangs`
--
ALTER TABLE `chi_tiet_gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `gio_hangs`
--
ALTER TABLE `gio_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `trang_thai_don_hangs`
--
ALTER TABLE `trang_thai_don_hangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
