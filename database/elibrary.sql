-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2016 at 09:00 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elibrary`
--
CREATE DATABASE IF NOT EXISTS `elibrary` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `elibrary`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `name` char(50) NOT NULL DEFAULT 'Quản trị viên',
  `user` char(30) NOT NULL,
  `pass` char(100) NOT NULL DEFAULT 'd033e22ae348aeb5660fc2140aec35850c4da997',
  `last` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`name`, `user`, `pass`, `last`) VALUES
('Nguyễn Trung', 'root', '9c7a31a8336cabd3298dbfef065214245e4a4176', '2016-06-16 02:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` char(50) NOT NULL,
  `categoryid` char(50) NOT NULL,
  `dateadd` date NOT NULL,
  `title` varchar(1024) NOT NULL,
  `code` char(50) NOT NULL,
  `author` char(255) NOT NULL,
  `price` int(11) NOT NULL,
  `pubhouse` char(255) NOT NULL,
  `pubyear` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` int(11) NOT NULL,
  `page` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `categoryid`, `dateadd`, `title`, `code`, `author`, `price`, `pubhouse`, `pubyear`, `description`, `amount`, `page`) VALUES
('004554a287a3d89d81bd3d836806d935', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các khối kinh tế và mậu dịch trên thế giới ', '05fc4f76', 'Không, tác giả', 20000, 'Khoa học', 2005, 'Không có mô tả', 10, 285),
('00abaf773890947f477e529a039c7e54', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '57814f28', 'TT kinh tế châu Á - Thái Bình Dương', 20000, 'Quốc gia', 2009, 'Không có mô tả', 3, 98),
('012c9dfc8e9d3faf38d83ea8c6eb347b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', 'a5622f99', 'Tổng Cục Thuế', 20000, 'Trẻ', 2004, 'Không có mô tả', 3, 913),
('0324f984221e9c2f742042c6e9f73203', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 67', '526615f7', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 100000, 'Lao động', 2015, 'Không có mô tả', 4, 311),
('035384d869bb312eb68c7b15ebed79e3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '331a431d', 'Trung tâm KHTN và CN quốc gia', 100000, 'Thống kê', 2007, 'Không có mô tả', 2, 83),
('0389068587387494d760b9212be5fcef', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', '519eb1f6', 'Bộ Nông nghiệp và PTNT', 50000, 'Khoa học', 2004, 'Không có mô tả', 9, 293),
('03a901a5d946327accc2953f94a2a3a3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', '6de67b75', 'Bộ Nông nghiệp và PTNT', 80000, 'Trẻ', 2006, 'Không có mô tả', 5, 194),
('06d252592c48f5e523f9b1f5d3cf423b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', 'cb808bd3', 'Bộ Nông nghiệp và PTNT', 20000, 'Khoa học', 2014, 'Không có mô tả', 8, 217),
('083994abb440bed28d084b6c158f4c91', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp quy về giáo dục-Đào tạo : Mầm non-Phổ thông-Trung ho.', 'e5459c27', 'Triệu, Thạch Bảo', 50000, 'Thống kê', 2002, 'Không có mô tả', 2, 294),
('095ca461d77f8ac7f8cdfb53860793f0', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thông tin tài chính (Tháng 2 kỳ) = Financial bulletin', '84dea45a', 'Bộ Tài chính', 15000, 'Khoa học', 2001, 'Không có mô tả', 10, 158),
('0a0cea29bd0e8e4eb150b8946dd988d4', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Giáo trình quản trị dự án đầu tư quốc tế và doanh nghiệp có vốn đầu ', '70029722', 'Cục, Thống kê TP. HCM', 50000, 'Thống kê', 2007, 'Không có mô tả', 4, 403),
('0a8d5ff1965c64f3eb43e70b64fd7a2c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nhà quản lý', '27862860', 'Viện Nghiên cứu và đào tạo về quản lý', 50000, 'Khoa học', 2002, 'Không có mô tả', 4, 345),
('0aeace1ecac2bd56fd23c8c8c9f51855', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Phong cách người Nhật trong kinh doanh.', '1bde4ff4', 'D, Larue', 100000, 'Quốc gia', 2002, 'Không có mô tả', 2, 509),
('0afbd264667664c91333cbe93dc0e23f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '909be964', 'Trung tâm KHTN và CN quốc gia', 20000, 'Khoa học', 2001, 'Không có mô tả', 5, 189),
('0d467f764fc7ec8cdf483e71389ae1eb', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chế độ pháp lý về quản lý tài chính và cổ phần hóa trong doanh nghie ', 'ac6a76f2', 'Trần, Xuân Kiêm', 20000, 'Quốc gia', 2000, 'Không có mô tả', 8, 603),
('0d7397099ab825fb3e746f0e75ca4828', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kế hoạch hóa và quan hệ thị trường.', '82509777', 'Không, tác giả', 50000, 'Trẻ', 2001, 'Không có mô tả', 10, 75),
('1022f9075186d7b5b0cfd707083e076a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hiến pháp nước cộng hòa xã hội chủ nghĩa Việt Nam và các văn bản ph ', '610978c1', 'Nguyễn, Trung', 20000, 'Trẻ', 2004, 'Không có mô tả', 3, 913),
('102e9b951374bf61c572df770af814ee', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Văn bản pháp luật về xử lý vi phạm hành chính và giải quyết khiếu k.', 'd614b9c5', 'Đinh, Xuân Trình', 80000, 'Thống kê', 2012, 'Không có mô tả', 6, 970),
('103ac09bc8ddf5dc2b4a28744d88205a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Hàng hóa thương hiệuTP.HCM : Hiệp hội chống hàng giả và bảo vệ thương hiệu Việt Nam.- 5+6', '490ab7a8', 'Hàng hóa thương hiệuTP.HCM : Hiệp hội chống hàng giả và bảo vệ thương hiệu Việt Nam', 20000, 'Trẻ', 2015, 'Không có mô tả', 2, 350),
('106463e5a58de60c7b35598f666f83fd', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thông tin tài chính (Tháng 2 kỳ) = Financial bulletin', 'fb4731b2', 'Bộ Tài chính', 50000, 'Quốc gia', 2001, 'Không có mô tả', 2, 299),
('10bd61364ccf3721fbadb0954075d991', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nội dung cơ bản của Bộ Luật lao động và các văn bản hướng dẫn thi ha ', '243667d1', 'Không, tác giả', 15000, 'Khoa học', 2008, 'Không có mô tả', 2, 1399),
('11a58f58d897d9e99ec55538da639aca', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế.- 186', 'c8782fd2', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế', 80000, 'Lao động', 2002, 'Không có mô tả', 10, 475),
('11d48163abb55960703540f1e2748612', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nghệ thuật kinh doanh thời gian không chờ đơi chúng ta : Một số vấn đề ', 'e98c4fa1', 'Không, tác giả', 80000, 'Lao động', 2012, 'Không có mô tả', 10, 262),
('127011c5ea02c401201f2105df59d1bd', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tìm hiểu năng suất ', '1b77b7f6', 'Peters, Thomas J', 15000, 'Quốc gia', 2012, 'Không có mô tả', 1, 105),
('12b4bcad7825cc1e08f74810464280d9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', 'e02b93ed', 'TT kinh tế châu Á - Thái Bình Dương', 100000, 'Khoa học', 2014, 'Không có mô tả', 7, 167),
('12cc40535853da23381757f4a5b0ce83', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Quan hệ kinh tế đối ngoại Trung Quốc thời kỳ mở cửa ', '8289b134', 'Không, tác giả', 100000, 'Quốc gia', 2004, 'Không có mô tả', 7, 455),
('132ccbe04874033f7de1fef9d6192bf9', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Thâm nhập thị trường thế giới như thế nào? : Kinh nghiệm của các công ', '6bc7cd7f', 'Beaufils, B', 20000, 'Quốc gia', 2006, 'Không có mô tả', 8, 179),
('13adbd2333412880d7479c26c176edcc', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh.- 4', 'd56548d1', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh', 15000, 'Thống kê', 2002, 'Không có mô tả', 4, 268),
('14731c81dcf488eb2fca79165877d233', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế Mỹ vấn đề và triển vọng ', '8bc903ef', 'Lin, Justin Yifu', 50000, 'Lao động', 2005, 'Không có mô tả', 7, 149),
('15746abac813356c47141844a137934c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp luật về bảo hiểm.', '998b28e9', 'Không, tác giả', 100000, 'Trẻ', 2003, 'Không có mô tả', 9, 464),
('159d00dc9ad6a589097fee71a5865f5a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thông tin tài chính (Tháng 2 kỳ) = Financial bulletin', '172fa983', 'Bộ Tài chính', 20000, 'Quốc gia', 2006, 'Không có mô tả', 9, 392),
('1600462e79aa47027559aed5d2993a6f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp luật về xây dựng.', '0a62bdd6', 'Werther, William B', 20000, 'Thống kê', 2012, 'Không có mô tả', 8, 629),
('16190039a0d9243ff723e7c933411040', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các nền kinh tế đang phát triển và Nhật Bản : Những bài học về tăng ', 'a3f48452', 'Cormack, Mark Mc', 100000, 'Lao động', 2002, 'Không có mô tả', 8, 193),
('17ac55cf2af6b64998f19b7cbaefb285', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Tài chính doanh nghiệp (Tháng 1 kỳ)', 'ec23fece', 'Bộ Nông nghiệp và PTNT', 15000, 'Thống kê', 2015, 'Không có mô tả', 8, 343),
('18e314e9e672809d3623832661746085', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', '7c9d4ad7', 'Saigon Times Group', 100000, 'Lao động', 2002, 'Không có mô tả', 4, 260),
('1b39792905badcebf4d4c450cc236b63', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tiềm năng kinh tế vùng đông nam bộ : Phần 1.', 'e612bd01', 'Không, tác giả', 50000, 'Quốc gia', 2009, 'Không có mô tả', 3, 562),
('1b85c67eb09cb69fcf5c4db61309a6d8', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', 'b4c03878', 'Bộ Nông nghiệp và PTNT', 80000, 'Quốc gia', 2012, 'Không có mô tả', 2, 105),
('1b92cae75ceb229e9eefc23914e5080b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tiếp cận các học thuyết và chính sách tiền tệ trong nền kinh tế thị t ', 'a93a31ec', 'Yamamura, Kozo', 80000, 'Quốc gia', 2008, 'Không có mô tả', 8, 252),
('1ba1d3d4bfd48dc08952309ce645e6e2', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '8de8b5e5', 'TT kinh tế châu Á - Thái Bình Dương', 80000, 'Quốc gia', 2008, 'Không có mô tả', 8, 252),
('1d19baf070cda0d13b6b00788081027a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', '581fbd88', 'Bộ Nông nghiệp và PTNT', 100000, 'Quốc gia', 2004, 'Không có mô tả', 7, 455),
('1d84e2e5f23368b9ea83ecaf9ffc4c9a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Xây dựng đảng (Tháng 1 kỳ)', 'dfabfd6f', 'BTCTW ĐCSVN', 100000, 'Quốc gia', 2003, 'Không có mô tả', 6, 204),
('1f4117717cbbc451b194c0839c592fd3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế.- 183', '5b3e3fca', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế', 50000, 'Khoa học', 2000, 'Không có mô tả', 4, 122),
('1ffbf9ccd628365facb10605d7239bc2', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế hỗn hợp quốc doanh - tư doanh ', '1e27f0e8', 'Yamamura, Kozo', 80000, 'Lao động', 2011, 'Không có mô tả', 3, 153),
('201b81098eac2b8918b32d6c87c08180', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '49648c2a', 'Trung tâm KHTN và CN quốc gia', 20000, 'Quốc gia', 2000, 'Không có mô tả', 5, 144),
('2045392a21375e13217bc7ed990395ee', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Đổi mới cơ chế quản lý doanh nghiệp vừa và nhỏ trong nền kinh tế thị ', 'ecdc08bf', 'Lê, Quang Liêm', 100000, 'Lao động', 2015, 'Không có mô tả', 4, 311),
('2073562d7ee796f601fab77d5ffe15b0', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Tổ chức nhà nước (Tháng 1 kỳ)', 'a0326887', 'Ban TCCB Chính phủ', 15000, 'Trẻ', 2008, 'Không có mô tả', 7, 366),
('20ae6ee585da361faeea0c303b9bbe3d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'a05c5305', 'Trung tâm KHTN và CN quốc gia', 50000, 'Lao động', 2012, 'Không có mô tả', 9, 788),
('20de39caed1edf0c9c0053f395a3030b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp luật về thuế.', 'd344fedb', 'Schonberger, Richard J', 100000, 'Thống kê', 2012, 'Không có mô tả', 7, 868),
('20fea1806a3d5ecb26513cdd0761fee6', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', 'c26fbc2f', 'TT kinh tế châu Á - Thái Bình Dương', 15000, 'Khoa học', 2013, 'Không có mô tả', 7, 485),
('2228324ad8dff1607210cf251a878945', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những câu chuyện quản lý dành cho giám đốc.', '57bf07fc', 'Không, tác giả', 80000, 'Thống kê', 2004, 'Không có mô tả', 10, 146),
('234bb72a413c511cb1a2720d65e2c9f3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', '17419201', 'Bộ Nông nghiệp và PTNT', 20000, 'Khoa học', 2005, 'Không có mô tả', 10, 285),
('23d2961679ff462d605e18f332ae81c2', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 01(159)', '87ff2618', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 50000, 'Trẻ', 2001, 'Không có mô tả', 5, 249),
('242412fd50c1718ad25984fce0cdd1ff', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cuộc cách mạng trong xí nghiệp công doanh ', '5dd84a40', 'Albert, Michel', 80000, 'Trẻ', 2015, 'Không có mô tả', 2, 273),
('249cd16b3c60667a696339f77d5343f1', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế Trung Quốc bước vào thế kỷ XXI ', '889e22c9', 'Không, tác giả', 80000, 'Thống kê', 2003, 'Không có mô tả', 7, 335),
('24a80c1abbf80ffbf6e05f5ff7f8a38e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '1b49ff22', 'Tổng Cục Thuế', 50000, 'Trẻ', 2015, 'Không có mô tả', 4, 641),
('24b9be1518ce25b826d366d686c03b9b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '46944508', 'TT kinh tế châu Á - Thái Bình Dương', 20000, 'Thống kê', 2000, 'Không có mô tả', 2, 323),
('24c8ae30e37af5ceb6f8ed08af7cb565', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Hàng hóa thương hiệuTP.HCM : Hiệp hội chống hàng giả và bảo vệ thương hiệu Việt Nam.- 8', '4c5af0b6', 'Hàng hóa thương hiệuTP.HCM : Hiệp hội chống hàng giả và bảo vệ thương hiệu Việt Nam', 100000, 'Lao động', 2009, 'Không có mô tả', 9, 133),
('24f191d4494131e24d0ee5abfe3f6185', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tám xu hướng phát triển của Châu Á đang làm thay đổi thế giới ', '5e48a8e6', 'Không, tác giả', 80000, 'Trẻ', 2001, 'Không có mô tả', 2, 366),
('25ce66bf37c05d63e74f62199659404d', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những gì người ta không dạy bạn tại trường kinh doanh Harvard ', '58f8d31f', 'Trương, Văn Bản', 80000, 'Khoa học', 2000, 'Không có mô tả', 7, 145),
('261caefed34a2f7e9cf478e1a2b533ea', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 162', '28afc701', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 80000, 'Trẻ', 2015, 'Không có mô tả', 10, 395),
('26d933ec4a6be4f9492fdbc4d63ea66c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hệ thống ngân hàng các nước công nghiệp phát triển ', '6b70d0be', 'G., C. Allen', 100000, 'Khoa học', 2004, 'Không có mô tả', 3, 275),
('27599c8a50085eaf82de44cdee7dd476', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Giáo dục lý luận (Tháng 1 kỳ)', 'be60b644', 'Học viện chính trị quốc gia HCM', 100000, 'Lao động', 2010, 'Không có mô tả', 7, 495),
('2791ca1f01f8f0114aeb28aae5b4b5c5', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế thế giới tiến vào thế kỷ 21 ', 'a993c9ee', 'Trần, Đức Mậu', 80000, 'Lao động', 2005, 'Không có mô tả', 5, 155),
('27ac5531c87cbc47e31127621de005d0', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lý luận chính trị (Tháng 1 kỳ)', '8e1011e4', 'Học viện chính trị quốc gia HCM', 50000, 'Khoa học', 2008, 'Không có mô tả', 10, 280),
('27d3806928ccd9ca849b7979563331d8', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', 'ef027c8c', 'Bộ Lao động thương binh và xã hội', 80000, 'Quốc gia', 2010, 'Không có mô tả', 7, 646),
('282b361a64c5cca35d037166b8ba1020', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 64', '88b8f2fb', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 80000, 'Lao động', 2008, 'Không có mô tả', 5, 133),
('295bdc8c6bf4ecf5fec9151fdcd4ad75', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', '462358c9', 'Bộ Nông nghiệp và PTNT', 50000, 'Lao động', 2005, 'Không có mô tả', 7, 149),
('29f7886eb8fe4ee9cb760856dfcb2794', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Công nghệ quảng cáo ', 'ac044d70', 'Nguyễn, Đình Hựu', 15000, 'Quốc gia', 2009, 'Không có mô tả', 5, 47),
('2a03a0f1108cb599125484a3628e1ee4', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Hàng hóa thương hiệuTP.HCM : Hiệp hội chống hàng giả và bảo vệ thương hiệu Việt Nam.- 7', '9a3b6758', 'Hàng hóa thương hiệuTP.HCM : Hiệp hội chống hàng giả và bảo vệ thương hiệu Việt Nam', 20000, 'Khoa học', 2001, 'Không có mô tả', 3, 325),
('2a79567fa2f8491466c050e9def47fe3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học quốc tế : Lý thuyết và chính sách ', 'ac749331', 'Không, tác giả', 100000, 'Quốc gia', 2013, 'Không có mô tả', 10, 710),
('2b12471aa8259563ae011af3ca208d7c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Văn bản hướng dẫn thi hành pháp lệnh ngân hàng nhà nước việt nam. Ph.', '0abb9b95', 'Richet, Xavier', 15000, 'Thống kê', 2013, 'Không có mô tả', 4, 346),
('2b5d398b7cdace083c68eeb15002a1ba', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tìm hiểu luật quốc tế ', '932ba6d5', 'Không, tác giả', 50000, 'Thống kê', 2000, 'Không có mô tả', 4, 649),
('2bcf60b1eda087f40c19088c7fc05aa9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Khoa học và công nghệ (Tháng chẵn)', '709527f4', 'Trung tâm KHTN và CN quốc gia', 15000, 'Quốc gia', 2014, 'Không có mô tả', 3, 571),
('2bd8ee4408e327e9cbc3767f98cec2a4', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Triết học (Tháng 1 kỳ) = Philosophy', '1eaea5fd', 'Viện Triết học', 20000, 'Trẻ', 2009, 'Không có mô tả', 3, 367),
('2ed6dc0fbb695cb038e1feb66b46d508', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế CHDCND Lào nhà nước Kampuchea Liên Bang Myamar ', 'eac58b44', 'Quách, Thái', 80000, 'Quốc gia', 2012, 'Không có mô tả', 2, 132),
('305f542aed94c0e9d78fab289dc2b68a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kaizen chìa khóa của sự thành công về quản lý của Nhật Bản ', '1e90ed29', 'Kotler, Philip', 100000, 'Thống kê', 2007, 'Không có mô tả', 9, 166),
('30767054568f6ed2a9180ecf88d22c82', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Hoạt động khoa học (Tháng 1 kỳ)', 'c41e7973', 'Bộ Khoa Học Công Nghệ & Môi trường', 15000, 'Thống kê', 2005, 'Không có mô tả', 4, 488),
('30cc87f9cb074856ed7bafc9819734ec', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Quản lý Nhật Bản truyền thống và quá độ ', '75e5cdfd', 'Từ, Đức Chí', 15000, 'Thống kê', 2002, 'Không có mô tả', 8, 458),
('30debe25e8fceadd18624b99c4dce5b7', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Khối cộng đồng Nhật Bản ', '5256935', 'Hoàng, Đức Tảo', 100000, 'Quốc gia', 2011, 'Không có mô tả', 2, 166),
('3206b4f77cf2c6e5dee9b74cec9e0c43', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '9fb20605', 'Tổng Cục Thuế', 15000, 'Trẻ', 2009, 'Không có mô tả', 6, 215),
('336963c967c501cdebf81061c7a748a5', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Khái quát về kinh tế Mỹ ', '52ef40e2', 'Nguyễn, Khải', 80000, 'Quốc gia', 2014, 'Không có mô tả', 7, 149),
('33b88b5aba0fe9f4b3ddba680704c4e3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nhà nước và pháp luật (Tháng 1 kỳ) = State and law', 'e57bd4f3', 'Trung tâm KHXH và NV Quốc gia', 50000, 'Quốc gia', 2011, 'Không có mô tả', 2, 192),
('34c19ec344a345b5eb734544b9aa00b6', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Trao đổi ý kiến : Đổi mới kinh tế quốc doanh.', '87b7cda8', 'Không, tác giả', 20000, 'Lao động', 2011, 'Không có mô tả', 10, 234),
('34d7ff8f7e9e12d7d8b64ff7e4b30601', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chính sách tiền tệ của Cộng hòa liên bang Đức ', 'acc38ef0', 'Lê, Văn Tư', 80000, 'Lao động', 2011, 'Không có mô tả', 10, 268),
('35b032f3fe8989e5ed1fa8596cac7654', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Khôi phục doanh nghiệp cần biết.', 'ec6b157e', 'Không, tác giả', 100000, 'Thống kê', 2015, 'Không có mô tả', 5, 62),
('3636c5038d8aa646b58a13db68f62b1e', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chính sách tài chính xí nghiệp ', 'c701b3e5', 'Yamamura, Kozo', 50000, 'Khoa học', 2015, 'Không có mô tả', 8, 70),
('365005f62a3a7539e63b65d48e51d657', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Người Nhật thập kỷ 90 ', 'a66300cc', 'Đỗ, Đức Định', 20000, 'Khoa học', 2005, 'Không có mô tả', 5, 195),
('366cffd6dd632ae11898d6f32060fc6d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '226172bf', 'TT kinh tế châu Á - Thái Bình Dương', 15000, 'Quốc gia', 2010, 'Không có mô tả', 8, 223),
('374f0a1bdfa8a2645fef45a671f0fed6', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh.- 1', 'd0350fcf', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh', 100000, 'Trẻ', 2015, 'Không có mô tả', 4, 281),
('377a9b87888ec1e2783e461a4f97718d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Du lịch Việt Nam (Tháng 1 kỳ) = Vietnam tourism review', '6d3f5d36', 'Tổng Cục Du lịch', 80000, 'Khoa học', 2005, 'Không có mô tả', 8, 345),
('3896091d5ac6b7b606f952fa31de6f34', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Con số và sự kiện (Tháng 1 kỳ)', '0cf4161d', 'Tổng cục Thống kê', 15000, 'Lao động', 2004, 'Không có mô tả', 2, 502),
('38db77b37814dc9e626d897764cb2874', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Khu vực kinh tế quốc doanh ở các nước đang phát triển châu Á.', '3354d588', 'Không, tác giả', 50000, 'Lao động', 2006, 'Không có mô tả', 7, 212),
('3a03e96251b5197c18a86d918e995321', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Dân chủ và pháp luật (Tháng 1 kỳ)', '22d66f7e', 'Trung tâm KHTN và CN quốc gia', 50000, 'Khoa học', 2003, 'Không có mô tả', 2, 571),
('3a4026af7cab146a45c21e7aeff52715', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '3374789f', 'Tổng Cục Thuế', 15000, 'Trẻ', 2005, 'Không có mô tả', 3, 583),
('3a96cab468b328327117c6da5a24497c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các khu chế xuất Châu Á Thái Bình Dương và Việt Nam ', '7552d03c', 'Lê, Du Phong', 15000, 'Quốc gia', 2014, 'Không có mô tả', 9, 146),
('3abc9b2e8eb46b084a9e40dc84e9044d', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Quan hệ kinh tế Việt Nam - Nhật Bản đang phát triển ', '6e2097a0', 'Võ, Đại Lược', 15000, 'Lao động', 2006, 'Không có mô tả', 7, 313),
('3ae3ba6bfef92938586b1c738013cb0e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nhà nước và pháp luật (Tháng 1 kỳ) = State and law', '127fee9d', 'Trung tâm KHXH và NV Quốc gia', 50000, 'Quốc gia', 2004, 'Không có mô tả', 2, 251),
('3b99c19601eead04feaec05bccbabdc7', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu lập pháp (Tháng 1 kỳ) = Legislative Studies Magazine', 'a0857546', 'Văn phòng quốc hội', 50000, 'Lao động', 2000, 'Không có mô tả', 2, 210),
('3c9606dd7a5a2f873d352d60519329ed', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Giáo trình quan hệ kinh tế quốc tế ', '1bc0aa37', 'Hữu, Khánh', 20000, 'Lao động', 2015, 'Không có mô tả', 5, 238),
('3d9a387c1f6bb907f45e14daec677c7a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', '9a555cda', 'Bộ Lao động thương binh và xã hội', 50000, 'Thống kê', 2002, 'Không có mô tả', 2, 294),
('3e1f10251212f5696359c72f72a90749', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chuyển dịch cơ cấu kinh tế trong điều kiện hội nhập với khu vực và the ', '1e39152b', 'Nguyễn, Thiết Sơn', 80000, 'Khoa học', 2005, 'Không có mô tả', 8, 345),
('404b998ac7a26d6a0463a594f79ee36f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', '8139fe85', 'Bộ Thương Mại', 15000, 'Lao động', 2002, 'Không có mô tả', 3, 437),
('417300b764c5fc37775d94f760a86f69', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kỷ nguyên tăng trưởng nhanh : Những nhận xét về nền kinh tế Nhật Bản ', '117ec1c8', 'Võ, Sáng Nghiệp', 20000, 'Trẻ', 2001, 'Không có mô tả', 10, 331),
('41e9322e217c3388b271420559846155', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lý luận chính trị (Tháng 1 kỳ)', '902cf4a5', 'Học viện chính trị quốc gia HCM', 100000, 'Lao động', 2000, 'Không có mô tả', 8, 384),
('41f929978ad51081d486f9e3e9ae0f14', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', '301 ý tưởng hay về quản trị kinh doanh của các công ty Mỹ năng động nh ', 'c8285c84', 'Bloom, benJamin S', 20000, 'Khoa học', 2001, 'Không có mô tả', 5, 189),
('425948c737269f8f2c313e08a5ba4aa3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cân bằng lại giữa khu vực công cộng và khu vực tư nhân ', '58880d5e', 'Bouin, O', 80000, 'Thống kê', 2004, 'Không có mô tả', 2, 267),
('4349f2f37fe9b28858f80f12b74513fa', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Giáo trình thanh toán quốc tế trong ngoại thương ', 'acdd6b33', 'Jack, D. Schwager', 15000, 'Thống kê', 2015, 'Không có mô tả', 8, 343),
('4483ee3474d1b2538be942e0a5aeaee3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'afac9a27', 'Trung tâm KHTN và CN quốc gia', 20000, 'Thống kê', 2002, 'Không có mô tả', 10, 157),
('44e22fda55c50e074195aa70835a0c80', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chủ nghĩa tư bản hiện đại tư nhân hóa ở các nước tư bản phát triển ', '8449148c', 'Phạm, Ngọc Côn', 80000, 'Quốc gia', 2012, 'Không có mô tả', 2, 105),
('44fc3ce2ced868b34b020679c8dff50b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Xuất nhập khẩu : Đấu thầu quốc tế ', 'b706d4ad', 'W, D Hartmann', 20000, 'Thống kê', 2002, 'Không có mô tả', 10, 157),
('45257e861f5d12ebb726927cb40d1070', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', 'dafbba71', 'Saigon Times Group', 20000, 'Lao động', 2009, 'Không có mô tả', 10, 99),
('455ec9efb5601b7847be2d4dc22c04da', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', 'c2d8a1ee', 'Bộ Thương Mại', 50000, 'Lao động', 2003, 'Không có mô tả', 10, 793),
('4700dcca839c471b67623fe9fa7915ed', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'bb5ecad8', 'Trung tâm KHTN và CN quốc gia', 20000, 'Quốc gia', 2008, 'Không có mô tả', 9, 227),
('47cd6541fa00f3a619a9f12d7a250a93', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học chính trị Nhật Bản : Sự biến đổi trong nước ', 'a613de8d', 'Ngô, Văn Phương', 20000, 'Khoa học', 2001, 'Không có mô tả', 3, 325),
('480dda80020276e15b7e84d7b261fe7a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công nghệ Ngân hàngTP.HCM : Đại học Ngân hàng TP.HCM.- 8', '3a426920', 'Công nghệ Ngân hàngTP.HCM : Đại học Ngân hàng TP.HCM', 15000, 'Quốc gia', 2008, 'Không có mô tả', 8, 119),
('482687d91e12a9fc0eaaa321801d1bde', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu kinh tế (Tháng 1 kỳ) = Economic Studies', '33c3655e', 'Trung tâm KHXH và NV Quốc gia', 80000, 'Trẻ', 2015, 'Không có mô tả', 8, 99),
('483c858e8c08d1df5e81d37593d0cc28', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nhà quản lý giỏi khái luận về lãnh đạo và quản trị qui trình kiểm so ', 'c7a84be7', 'Yutaka, Kosai', 20000, 'Lao động', 2002, 'Không có mô tả', 8, 119),
('483ee3f374f0a84bea60b71a3030afe8', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '2d489dde', 'Tổng Cục Thuế', 100000, 'Quốc gia', 2007, 'Không có mô tả', 10, 324),
('48d41eec4cedac30e15747b211f44fa1', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Xây dựng đảng (Tháng 1 kỳ)', '763dc4eb', 'BTCTW ĐCSVN', 80000, 'Quốc gia', 2010, 'Không có mô tả', 2, 302),
('48d91b245c47e7ebedba333d8af9b41c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '5df8e757', 'TT kinh tế châu Á - Thái Bình Dương', 15000, 'Lao động', 2000, 'Không có mô tả', 3, 80),
('49d2911613f9a0c8177ed3b8a2b76387', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Vấn đề tuyển dụng, chính sách lương bổng trong các công ty - xí nghiệp.', 'c251f4fb', 'S., Charles Maurice', 15000, 'Quốc gia', 2008, 'Không có mô tả', 8, 119),
('4b059e7237d366e168af9ccd967eab8c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', 'fea06b6d', 'Trung tâm KHTN và CN quốc gia', 15000, 'Quốc gia', 2009, 'Không có mô tả', 5, 47),
('4b58cb60219f28e37d5cc50c6da29d8b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', '273135a1', 'Bộ Lao động thương binh và xã hội', 15000, 'Khoa học', 2007, 'Không có mô tả', 5, 342),
('4b9a3bbb69f36a4c00cacbbc83cbc00b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hệ thống ngân hàng Mỹ ', 'cdbfd81a', 'Yves, Enrègle', 50000, 'Lao động', 2003, 'Không có mô tả', 5, 159),
('4c22929b12f84195217f8533e936a59b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chủ nghĩa tư bản chống chủ nghĩa tư bản ', '84fe094d', 'Đỗ, Lộc Diệp', 20000, 'Lao động', 2012, 'Không có mô tả', 7, 310),
('4c58254c9341662a609cf932fe906686', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Sự thần kỳ Đông Á : Tăng trưởng kinh tế và chính sách công cộng ', '54e826da', 'Không, tác giả', 15000, 'Khoa học', 2013, 'Không có mô tả', 7, 485),
('4c7c4d6431d65fe3c6228922cc0ac933', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cổ phần hoá doanh nghiệp nhà nước kinh nghiệm thế giới ', 'a98d2c2d', 'Phạm, Thanh Bình', 50000, 'Khoa học', 2000, 'Không có mô tả', 4, 122),
('4cb3176d89a182a3fe5136ebeb2f9bda', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '8bf74b3b', 'Trung tâm KHTN và CN quốc gia', 80000, 'Lao động', 2012, 'Không có mô tả', 10, 262),
('4d1ef3d7cdd8fbf5cae8ea772b337af5', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hướng dẫn kỹ thuật đầu tư trực tiếp nước ngoài tại Việt Nam ', 'c7b6ae24', 'Harbulot, Christian', 50000, 'Khoa học', 2004, 'Không có mô tả', 9, 293),
('4d606198f794dfc47fd67a0c66c09ead', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Thị trường và doanh nghiệp ', '3a0a8290', 'Không, tác giả', 100000, 'Khoa học', 2000, 'Không có mô tả', 8, 228),
('4f4d93cec3e7e85b6603c307999069c7', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'aa4bc0f8', 'Trung tâm KHTN và CN quốc gia', 100000, 'Quốc gia', 2002, 'Không có mô tả', 2, 509),
('4fe61bb2dbc09feb841f4b4489e087c1', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', '14b93600', 'Bộ Thương Mại', 50000, 'Trẻ', 2000, 'Không có mô tả', 3, 114),
('5019b8be3194c41f4e57cfed41e4e4fa', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 160(02)', 'ce09ea8e', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 20000, 'Lao động', 2007, 'Không có mô tả', 3, 131),
('52247946d67f943de379d32ce1dc8d95', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế Nhật Bản giai đoạn " Thần kỳ" ', '6e978a61', 'Bộ, Tài chính', 50000, 'Thống kê', 2013, 'Không có mô tả', 9, 177),
('52687b0be82a287240244f5a4ef0006b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thông tin tài chính (Tháng 2 kỳ) = Financial bulletin', '43731fd7', 'Bộ Tài chính', 80000, 'Khoa học', 2005, 'Không có mô tả', 8, 208),
('538c05fb69f29e8375aae6e22f786d38', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Pháp luật về lao động, tiền lương và bảo hiểm xã hội.', 'd6a3a404', 'Trương, Xuân Lê', 15000, 'Thống kê', 2005, 'Không có mô tả', 4, 488),
('539e12ac7c6af80e15c1820f4ef87fa8', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Thái lan luật thương mại và pháp lý kinh doanh.', '40ad6be4', 'Không, tác giả', 15000, 'Quốc gia', 2014, 'Không có mô tả', 3, 571),
('541fa93164491f35a95fb7f945f14de9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '18b15b23', 'Trung tâm KHTN và CN quốc gia', 15000, 'Lao động', 2006, 'Không có mô tả', 7, 313),
('5422d6932da725b3034f66a66ee4b225', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Văn bản pháp luật về hình sự và tố tụng hình sự.', '0f32fac8', 'Lê, Văn Sang', 80000, 'Trẻ', 2003, 'Không có mô tả', 7, 890),
('54bf9f7b8afe4cc07350a5e24d0a6a6e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '768ad92a', 'Trung tâm KHTN và CN quốc gia', 80000, 'Lao động', 2001, 'Không có mô tả', 6, 352),
('550092b6a7060381e35760c85a6a261e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', 'b1907f66', 'Bộ Nông nghiệp và PTNT', 80000, 'Trẻ', 2015, 'Không có mô tả', 2, 273),
('56cf7bdfdca7a076180d8d8065220343', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Dân chủ và pháp luật (Tháng 1 kỳ)', '3c5d97fe', 'Trung tâm KHTN và CN quốc gia', 50000, 'Khoa học', 2008, 'Không có mô tả', 2, 303),
('56d3438a0bfa7431d4ccce5cbad831be', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '880fef3a', 'TT kinh tế châu Á - Thái Bình Dương', 100000, 'Trẻ', 2014, 'Không có mô tả', 9, 539),
('56feff7f498d9e8c2f495adc3744fb82', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp luật về bảo hiểm và hợp đồng bảo hiểm.', '398485f5', 'Naisbitt, John', 100000, 'Khoa học', 2014, 'Không có mô tả', 7, 167),
('5772b378c192694035d3d7586300161e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '9f051bc4', 'Trung tâm KHTN và CN quốc gia', 80000, 'Khoa học', 2006, 'Không có mô tả', 6, 309),
('57e0f58a74a69d158300dcebed1c67b2', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nguyên tắc phân loại mục tiêu giáo dục : Lãnh vực nhân thức ', '5bc1c9bb', 'Nguyễn, Trung Tín', 20000, 'Trẻ', 2010, 'Không có mô tả', 3, 175),
('5803a68bc7fe3eabc9582ede5f1f9b8f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'b1fe44e4', 'Trung tâm KHTN và CN quốc gia', 100000, 'Quốc gia', 2007, 'Không có mô tả', 3, 243),
('58387a0f85741c6ac554efbab36ed19b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Doanh nghiệp và thương hiệu', 'be0e8dc6', 'Hiệp hội doanh nghiệp nhỏ & vừa ngành nghề nông thôn Việt Nam', 50000, 'Lao động', 2009, 'Không có mô tả', 4, 259),
('590fecaa99bce064c083f2906cb20529', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các chế độ mới về quản lý tài chính đối với doanh nghiệp nhà nước.', '7f359d80', 'Nguyễn, Hải Hữu', 80000, 'Thống kê', 2013, 'Không có mô tả', 9, 333),
('5aaf0c02170ea6c18c660da86e3dc8ab', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học chính trị Nhật Bản : Sự biến đổi trong nước ', '110e1f89', 'Học, viện Chính trị quốc gia Hồ Chí Minh', 50000, 'Khoa học', 2002, 'Không có mô tả', 4, 345),
('5ba21f3930710c67006a86bff956d34c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 63', '30e2e71c', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 50000, 'Quốc gia', 2015, 'Không có mô tả', 8, 141),
('5cbdfaee843a579c3e53655ca8a57243', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Công ty cổ phần ở các nước phát triển : Quá trình thành lập tổ chức ', '7aa2191e', 'Trần, Qang Tuệ', 50000, 'Khoa học', 2007, 'Không có mô tả', 8, 128),
('5d7ad5230914af407b195d9d73443875', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', '1.81E+07', 'Bộ Nông nghiệp và PTNT', 20000, 'Trẻ', 2001, 'Không có mô tả', 10, 331),
('5dd53b5156caa7788b73ace2d519b737', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Văn bản pháp luật về chính sách xã hội và chính sách đối với người.', '64593fdf', 'Mulvaney, John', 100000, 'Trẻ', 2014, 'Không có mô tả', 9, 539),
('5f56cd632adade3843b9e2df33e8e81f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', '068dbe62', 'Saigon Times Group', 20000, 'Lao động', 2012, 'Không có mô tả', 7, 310),
('5f856aa4040ecc04ed7a24abc0a9cc07', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Sổ tay người quản lý : Kinh nghiệm quản lý Nhật Bản ', '70b58ae3', 'Keiko, Yamanaka', 20000, 'Quốc gia', 2008, 'Không có mô tả', 9, 227),
('5facda85bec9dad460d7c121a7da9d1e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'c47042f1', 'Trung tâm KHTN và CN quốc gia', 15000, 'Thống kê', 2002, 'Không có mô tả', 8, 458),
('6050775faa6d636e74ba76c133dfc618', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '8ea70c25', 'Trung tâm KHTN và CN quốc gia', 100000, 'Trẻ', 2014, 'Không có mô tả', 3, 446),
('60c78ea7e97e72bb03f0b9c80c27d2ab', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Bảo hiểm xã hội (Tháng 1 kỳ)', 'e3d337ec', 'Bảo hiểm xã hội Việt Nam', 50000, 'Khoa học', 2015, 'Không có mô tả', 8, 70),
('613dd7b80b73f12c89debd8e6dcabfef', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Bảo hộ lao động (Tháng 1 kỳ) = Labour Protection Review', '1798b442', 'Liên Đoàn Lao động Việt Nam', 100000, 'Quốc gia', 2015, 'Không có mô tả', 2, 256),
('6144aab66af654e84a3a1a15e3f3f80d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thông tin tài chính (Tháng 2 kỳ) = Financial bulletin', '3c84b1bd', 'Bộ Tài chính', 80000, 'Thống kê', 2003, 'Không có mô tả', 7, 335),
('63d0b2b3b7c4925217bbe903cefc9580', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Luật dầu khí và văn bản hướng dẫn thi hành.', '401a7625', 'Không, tác giả', 50000, 'Lao động', 2003, 'Không có mô tả', 10, 793),
('63d30b7d31eb9fa0b05280a12a500b93', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', 'fbf02c73', 'Trung tâm KHTN và CN quốc gia', 100000, 'Thống kê', 2012, 'Không có mô tả', 3, 384),
('64c7b87795ca8d07d14d59d0eeb18725', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', '20 năm thống nhất và phát triển ', '3ad3a4d3', 'Không, tác giả', 20000, 'Khoa học', 2010, 'Không có mô tả', 9, 404),
('65350040892f825300318a552fe34d9e', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Vai trò quản lý kinh tế của nhà nước trong cơ chế thị trường ở nước t ', '301d116d', 'Không, tác giả', 100000, 'Trẻ', 2014, 'Không có mô tả', 3, 446),
('65d358bcb0a9b2b0996ef3710a0f7804', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế Asean và khả năng hòa nhập của Việt Nam ', '45fd2cfa', 'Không, tác giả', 100000, 'Lao động', 2000, 'Không có mô tả', 5, 99),
('65de46dd4aa88be553ed229c39f7fe89', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các nước công nghiệp mới ở Châu Á.', 'ef95cc5a', 'Lâm, Quang Huyên', 50000, 'Khoa học', 2007, 'Không có mô tả', 6, 135),
('67489acdb3482bc927bbf7016305a0bc', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', 'e68370f2', 'Tổng Cục Thuế', 100000, 'Thống kê', 2007, 'Không có mô tả', 9, 166),
('67ddbc8e376d49ac583df7667a2ddc30', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế doanh nghiệp ', 'dc6d11ba', 'Lê, Văn Sang', 100000, 'Lao động', 2002, 'Không có mô tả', 4, 260),
('6814ffc1e059430b43b9e910325336d6', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những chỉ tiêu chủ yếu các nước Châu Á-Thái Bình Dương ', '81195392', 'Arthur, Young', 15000, 'Trẻ', 2010, 'Không có mô tả', 5, 238),
('687d6912df917042b32bbcff2518f55f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', 'a9047938', 'Bộ Nông nghiệp và PTNT', 100000, 'Lao động', 2000, 'Không có mô tả', 5, 99),
('68cc76ac4b4682397ae8e90e3a74535b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '1de11c3d', 'Trung tâm KHTN và CN quốc gia', 50000, 'Trẻ', 2011, 'Không có mô tả', 9, 456),
('68e95cfd6a0ec49709ad636581751f1a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Marketing quốc tế và quản lý xuất khẩu.', 'c2f80cf9', 'Từ, Đức Chí', 100000, 'Quốc gia', 2007, 'Không có mô tả', 3, 243),
('69443933e8b25ae41b5334bd7932c899', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Pháp luật về lao động, tiền lương và bảo hiểm xã hội.', '61be6500', 'Duro, Robert', 20000, 'Quốc gia', 2006, 'Không có mô tả', 9, 392),
('6b35a73a9e8c2f5cc56020af887b4fac', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Bảo hiểm xã hội (Tháng 1 kỳ)', 'f189840c', 'Bảo hiểm xã hội Việt Nam', 15000, 'Lao động', 2011, 'Không có mô tả', 8, 527),
('6c4ded6eb01ed0c053450d9106a9e66b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kỹ thuật chống đỡ rủi ro về lãi suất : Những công cụ tài chính mới ', '6ef9b1e3', 'Nguyễn, Trí Hòa', 80000, 'Thống kê', 2009, 'Không có mô tả', 8, 398),
('6de40fe6346243306574d6df6d44639c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 72', 'c788e6f0', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 100000, 'Trẻ', 2003, 'Không có mô tả', 9, 464),
('6e402cfd31934840f23dd0e1599507a5', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', 'cbeeb051', 'Saigon Times Group', 15000, 'Khoa học', 2002, 'Không có mô tả', 10, 96),
('6e464303e9fd2b67f3856ef55f23a1ea', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Vai trò của các doanh nghiệp vừa và nhỏ trong phát triển kinh tế Nhật ', 'd9e470e7', 'Hồ, Ngọc Cẩn', 100000, 'Thống kê', 2014, 'Không có mô tả', 6, 232),
('6eaf0660a730466f566ff9a6d8a2750f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Quản lý dự án bằng phương pháp mạng phân tích ', '14e94556', 'Nguyễn, Thiết Sơn', 100000, 'Lao động', 2009, 'Không có mô tả', 9, 133),
('6f8dbe8186023738a43d879bf3caecde', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cải cách doanh nghiệp nhà nước.', '354d5673', 'Không, tác giả', 80000, 'Trẻ', 2001, 'Không có mô tả', 9, 165),
('70f48d6eeb385dfc0bb46814a05253a8', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chiến lược quản lý và kinh doanh ', 'e95569e2', 'Không, tác giả', 80000, 'Trẻ', 2012, 'Không có mô tả', 10, 437),
('718560141e5c6ff777855611734571a0', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kiểm toán (Tháng chẵn) = Auditing review', '7cf37155', 'Kiểm toán nhà nước', 20000, 'Quốc gia', 2006, 'Không có mô tả', 8, 179),
('71943a903fa0a5790cec1617733c050d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'da229c32', 'Trung tâm KHTN và CN quốc gia', 80000, 'Quốc gia', 2001, 'Không có mô tả', 2, 283),
('72336b07b35d2d46b46a08e83c044d5a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học ', '00ac0868', 'Isarankura, P. N. Sharma-Watana', 50000, 'Lao động', 2012, 'Không có mô tả', 9, 788),
('7289c90f7a59340ede2ef49b7d9f4f2c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '390dd0e0', 'Tổng Cục Thuế', 15000, 'Lao động', 2008, 'Không có mô tả', 5, 520),
('7316e3752b6482aaf401bc89a8a2eeb8', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Mặt trái của những con rồng ', 'ef22d19b', 'Krugman, Paul R', 15000, 'Lao động', 2004, 'Không có mô tả', 2, 502),
('7356e0fa84038bcd411fc41831d6b34f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hỏi-đáp về kinh tế thị trường xã hội chủ nghĩa.', '51b861c4', 'Không, tác giả', 80000, 'Quốc gia', 2010, 'Không có mô tả', 7, 646),
('74039169cfb16ce797163267eab4d7cd', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Giáo dục lý luận (Tháng 1 kỳ)', 'a5d53258', 'Học viện chính trị quốc gia HCM', 50000, 'Lao động', 2008, 'Không có mô tả', 10, 160),
('741fd82cfce8eb9c2eee3c457b783af6', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thị trường giá cả (Tháng 1 kỳ)', '09134cc2', 'Ban vật giá Chính phủ', 50000, 'Thống kê', 2007, 'Không có mô tả', 4, 403),
('74c34eff8b54feec68a275385fb6b45a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', '3fa533ff', 'Bộ Thương Mại', 15000, 'Trẻ', 2012, 'Không có mô tả', 5, 447),
('74d615f48d0c146984ffe2a91b9add38', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nhà quản lý', '7303b877', 'Viện Nghiên cứu và đào tạo về quản lý', 50000, 'Quốc gia', 2015, 'Không có mô tả', 10, 219),
('7525a05a1432de25b3979b1dfb56372f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Mưu lược Châu Á ', '81ae4e53', 'Chu, Chin-ning', 100000, 'Trẻ', 2004, 'Không có mô tả', 6, 315),
('766fdc654c5afed440f222c27b5e5539', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Lý luận và thực tiễn thương mại quốc tế.', 'c2e6e93a', 'Ngô, Xuân Bình', 20000, 'Trẻ', 2015, 'Không có mô tả', 2, 350),
('767603647781808f90c12b7f0430515e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '22b854fc', 'Trung tâm KHTN và CN quốc gia', 80000, 'Thống kê', 2004, 'Không có mô tả', 10, 146),
('76c29f4f10389a1d530b71a2fe564bb3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kế toán (Tháng chẵn) = Accounting reviewChưa rõ : Hội Kế toán VN.- 58', '18df60a1', 'Kế toán (Tháng chẵn) = Accounting reviewChưa rõ : Hội Kế toán VN', 20000, 'Thống kê', 2012, 'Không có mô tả', 8, 629),
('76cbceff5d19557e7c899ae77f6c6840', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', '58a8a049', 'Bộ Nông nghiệp và PTNT', 80000, 'Trẻ', 2001, 'Không có mô tả', 9, 165),
('76e3e922c2009b10f8b633688b748aea', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '679fd30a', 'Trung tâm KHTN và CN quốc gia', 100000, 'Quốc gia', 2013, 'Không có mô tả', 10, 710),
('777cb8e717b5e70b23f722878462ba78', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cuộc cách mạng nâu đang tiếp bước ', '51d65a46', 'Không, tác giả', 15000, 'Khoa học', 2001, 'Không có mô tả', 10, 158),
('78448a4db628d454cd30c4b78ccd2074', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Đầu tư nước ngoài của Nhật Bản và sự phụ thuộc kinh tế lẫn nhau ở C ', '75fb283e', 'Matsushita, Konusuke', 100000, 'Lao động', 2000, 'Không có mô tả', 8, 384),
('78509c644f6c5b4c3e56c8f80440074d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '5.74E+14', 'Trung tâm KHTN và CN quốc gia', 100000, 'Trẻ', 2014, 'Không có mô tả', 5, 426),
('78dc0d9e8328fb31f93d492318438275', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu lập pháp (Tháng 1 kỳ) = Legislative Studies Magazine', '75c980b2', 'Văn phòng quốc hội', 100000, 'Trẻ', 2004, 'Không có mô tả', 6, 315),
('790554163dd8554d2dc9a40cda9a09e4', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Thị trường &ø kinh tế vi mô ', 'b238a831', 'Nguyễn, Khắc Thìn', 20000, 'Lao động', 2007, 'Không có mô tả', 3, 131),
('7949621b066abdb2067cf567711e9bcb', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '736d83f5', 'Trung tâm KHTN và CN quốc gia', 80000, 'Lao động', 2011, 'Không có mô tả', 10, 268),
('79af44b80176c80874fe22fd9ac46a68', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những câu chuyện quản lý dành cho giám đốc.', 'e0a2c6f8', 'Lasserre, Philippe', 100000, 'Trẻ', 2014, 'Không có mô tả', 5, 426),
('7a91d95502d6244b8edb53a0d97f4037', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh.- 2', '6728cecb', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh', 50000, 'Khoa học', 2007, 'Không có mô tả', 8, 128),
('7b921ed94450cda95986e88744f73196', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', '7099c7ac', 'Saigon Times Group', 80000, 'Lao động', 2012, 'Không có mô tả', 8, 339),
('7bfb7a10e39bc2666df62c43690d0fdd', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', 'f46eded3', 'TT kinh tế châu Á - Thái Bình Dương', 15000, 'Trẻ', 2008, 'Không có mô tả', 4, 264),
('7c2e4a4928b4dd5b8c2780ce0e374f01', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Du lịch Việt Nam (Tháng 1 kỳ) = Vietnam tourism review', 'c874cf8a', 'Tổng Cục Du lịch', 80000, 'Quốc gia', 2012, 'Không có mô tả', 2, 132),
('7c8530be39ca0a32e27e5c6aac1c3aed', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hiểu và sử dụng tốt thị trường hối đoái ', 'dcda0c7b', 'Lê, Văn Sang', 50000, 'Lao động', 2008, 'Không có mô tả', 10, 160),
('7d12239662e64acd58e1a618be1277eb', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cẩm nang nghiệp vụ xuất - nhập khẩu ', '52585d23', 'Lục, Bội Minh', 80000, 'Khoa học', 2005, 'Không có mô tả', 8, 208),
('7d532d7c8072cb23ae7dd87843f1d889', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế quản trị kinh doanh xây dựng ', '510f7c05', 'Không, tác giả', 50000, 'Khoa học', 2001, 'Không có mô tả', 2, 300),
('7fbb081a6544061155a40822b1eba4a9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', 'e5ccc932', 'Trung tâm KHTN và CN quốc gia', 20000, 'Lao động', 2011, 'Không có mô tả', 10, 234),
('817f98987a756e9cec0a776effe9bf3b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nguyên lý kinh tế nông nghiệp : Thị trường và giá cả trong các nước đan ', '2bc6aef3', 'Không, tác giả', 20000, 'Khoa học', 2013, 'Không có mô tả', 8, 211),
('828c963e6437cb33defddf138e6df5ce', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học hiện đại ', '5d6f5781', 'T, T', 15000, 'Quốc gia', 2006, 'Không có mô tả', 9, 308),
('8373747272d9d8369c1833e904523de9', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tư tưởng quản trị kinh doanh hiện đại.', 'd93d56a4', 'Samuelson, Paul A', 20000, 'Khoa học', 2014, 'Không có mô tả', 8, 217),
('83b92a0dca1b4f137fc0665752e12b57', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh nghiệm huấn luyện và phát triển các nhà doanh nghiệp ', '36b38f57', 'Patel, V. G', 20000, 'Trẻ', 2009, 'Không có mô tả', 9, 107),
('844c95e2bfe2f896378c39b3b489d979', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '3cea8a3f', 'Trung tâm KHTN và CN quốc gia', 100000, 'Thống kê', 2002, 'Không có mô tả', 3, 215),
('84d55eb2be6ea1c349c7064c31c8abbe', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chính sách kinh tế Nhật Bản ', 'd98a4b65', 'Hoàng, Trung Tiếu', 50000, 'Trẻ', 2008, 'Không có mô tả', 2, 158),
('84f8bc837cd4c6e3ba325d6a59a67028', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nghiên cứu marketing ', 'ea1cad07', 'Nguyễn, Đình Thọ', 80000, 'Trẻ', 2000, 'Không có mô tả', 7, 110);
INSERT INTO `books` (`id`, `categoryid`, `dateadd`, `title`, `code`, `author`, `price`, `pubhouse`, `pubyear`, `description`, `amount`, `page`) VALUES
('869b37d0fdebd6101e92da9e68694573', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '09a45103', 'Trung tâm KHTN và CN quốc gia', 80000, 'Quốc gia', 2006, 'Không có mô tả', 5, 499),
('86e49f66f70014cac27e2651f2975e6f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nhật Bản đường đi tới một siêu cường kinh tế ', 'c8466706', 'Thanh, Hà', 15000, 'Khoa học', 2007, 'Không có mô tả', 5, 342),
('87543c6b257dbf59adabebdd57bc5785', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '5479eb29', 'Tổng Cục Thuế', 20000, 'Quốc gia', 2000, 'Không có mô tả', 8, 603),
('881eeb8995ce232e0e82974e86322a25', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Đàm phán và ký kết hợp đồng kinh doanh quốc tế ', 'b82f3bcc', 'Tokunaga, Shojiro', 50000, 'Quốc gia', 2004, 'Không có mô tả', 2, 251),
('886c815fd5ea963a99a98d68d035e4cd', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế thế giới 1994 : đặc điểm và triển vọng ', '5d016c03', 'Kim, Ngọc', 15000, 'Quốc gia', 2009, 'Không có mô tả', 2, 245),
('889ad4a7cf899c9cef5f119e3ab5b2d7', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tìm hiểu các ngành luật Việt Nam : Chế độ thuế và lệ phí hiện hành ở ', '7f828041', 'Can, Robert L. Mc', 20000, 'Trẻ', 2010, 'Không có mô tả', 3, 1023),
('88c187c84ff9f1c8c764f6092835ac71', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', 'efdb5acf', 'Trung tâm KHTN và CN quốc gia', 20000, 'Trẻ', 2010, 'Không có mô tả', 3, 175),
('896635a7b261c8b5897326c5e05e9a5a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Từ kế hoạch đến thị trường : Sự chuyển đổi kinh tế ở Việt Nam ', '8700d069', 'Không, tác giả', 100000, 'Thống kê', 2007, 'Không có mô tả', 2, 83),
('8abda8ce047fd62693c7c8d70ba21a1e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '75727d2b', 'TT kinh tế châu Á - Thái Bình Dương', 80000, 'Trẻ', 2012, 'Không có mô tả', 10, 437),
('8c2533e0e3d3f8acb53497ac3afa7cca', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', '39bacd21', 'Bộ Lao động thương binh và xã hội', 15000, 'Thống kê', 2008, 'Không có mô tả', 8, 78),
('8db11184b82a754a7ad97fd8876143a9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thị trường giá cả (Tháng 1 kỳ)', 'c2d441b6', 'Ban vật giá Chính phủ', 80000, 'Thống kê', 2004, 'Không có mô tả', 2, 267),
('8df433c3a0423b4272599eb0e8fb1e9a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hỏi đáp về chuyển giao công nghệ nước ngoài đàm phán và thực hiện h.', 'a39abfd0', 'Haas, Robert W', 15000, 'Trẻ', 2012, 'Không có mô tả', 5, 447),
('8e44c0a6349675e485011c617c92dd19', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '73da9e34', 'Trung tâm KHTN và CN quốc gia', 50000, 'Trẻ', 2008, 'Không có mô tả', 2, 158),
('8f0df985ba193a3e60921ce4db27236b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', 'a3a4f704', 'TT kinh tế châu Á - Thái Bình Dương', 100000, 'Lao động', 2007, 'Không có mô tả', 8, 164),
('8f785d2161445fe4739081e106c9a938', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Đổi mới kinh tế quốc doanh.', 'e6cb9b42', 'Không, tác giả', 20000, 'Lao động', 2004, 'Không có mô tả', 8, 153),
('8f80908e58bb3c1dd0d42a52ff1c1e8c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thông tin tài chính (Tháng 2 kỳ) = Financial bulletin', '8b4056fa', 'Bộ Tài chính', 15000, 'Lao động', 2012, 'Không có mô tả', 8, 196),
('902c7cd8a2e861c6d6c31c5d7c817088', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', 'fe1776ac', 'Bộ Thương Mại', 20000, 'Lao động', 2015, 'Không có mô tả', 5, 238),
('903c70749e53f8979d3208743a428a6a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', '1d5601fc', 'Saigon Times Group', 20000, 'Khoa học', 2005, 'Không có mô tả', 5, 195),
('90f82fb957bf1623d1a60d982b8a7bfa', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chiến tranh kinh tế và các kỹ thuật tiến công ', 'c7d895a6', 'Lê, Du Phong', 80000, 'Trẻ', 2015, 'Không có mô tả', 10, 395),
('91e1acd7c214e742aa0b103843b9a631', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế quản lý : Ứng dụng trong kinh tế vi mô để ra quyết định ', '1b198c74', 'Nguyễn, Quang Quynh', 100000, 'Thống kê', 2012, 'Không có mô tả', 3, 384),
('92207db5d3162d1db418e86c286e3b74', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tích tụ và tập trung vốn trong nước ', '8e87a132', 'Trần, Xuân Kiên', 20000, 'Thống kê', 2006, 'Không có mô tả', 4, 197),
('9573027da33f814421ec2f61b9bb8f1c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', '70223a35', 'Bộ Thương Mại', 80000, 'Trẻ', 2001, 'Không có mô tả', 2, 366),
('95dabf20a18f468b959028b2aa3ca0b3', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', 'f4d9c312', 'Bộ Thương Mại', 50000, 'Trẻ', 2013, 'Không có mô tả', 6, 195),
('96186b2be1ed2a097336bcf3e5a5b658', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lý luận chính trị (Tháng 1 kỳ)', 'ac543e26', 'Học viện chính trị quốc gia HCM', 20000, 'Khoa học', 2010, 'Không có mô tả', 9, 404),
('967b9183eeb6bce001f3999900e23023', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'c197182e', 'Trung tâm KHTN và CN quốc gia', 20000, 'Lao động', 2013, 'Không có mô tả', 7, 419),
('96a55c46a46082b0605cfb79e74cee6c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tiềm năng kinh tế Tây Nguyên và Duyên Hải niền Trung.', 'e3f5e7de', 'Không, tác giả', 50000, 'Trẻ', 2015, 'Không có mô tả', 4, 641),
('96c28076e356289781aef0c9ffc70a5c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cơ năng của kinh tế tư bản chủ nghĩa ', 'ea729685', 'Silk, Leonard S', 20000, 'Lao động', 2009, 'Không có mô tả', 10, 99),
('975bfba97920ab5ea792b79736c64385', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Phép lạ Trung Quốc : Chiến lược phát triển và cải cách kinh tế ', '3f83e3cd', 'Không, tác giả', 15000, 'Lao động', 2002, 'Không có mô tả', 3, 437),
('979902a74e491c0524f362216d30b474', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh.- 3', '627889d5', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh', 50000, 'Lao động', 2003, 'Không có mô tả', 5, 159),
('985d491114f5fc652dbe56cae7d7d7d0', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh doanh với người Mỹ ', '8e2e5930', 'Phan, Lạc Tuyên', 20000, 'Quốc gia', 2000, 'Không có mô tả', 5, 144),
('988e28dd1047787a5d6d72c35939450d', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kiểm toán căn bản ', '35fa4bb2', 'Kunio, Yoshihara', 50000, 'Quốc gia', 2011, 'Không có mô tả', 2, 192),
('988f53bdbb6d047f39cbab8b39f64e95', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Luật thương mại.', 'b898260d', 'Mulvaney, John', 15000, 'Trẻ', 2008, 'Không có mô tả', 7, 366),
('98eeaea5cfbed2a91838865edd0bdf55', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kiểm toán (Tháng chẵn) = Auditing review', '097d7740', 'Kiểm toán nhà nước', 50000, 'Lao động', 2006, 'Không có mô tả', 7, 212),
('9921cd309e27b5724d20eaf2d40be35b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Thị trường chứng khoán & công ty cổ phần.', '61674343', 'Phan, Hương Giang', 50000, 'Khoa học', 2000, 'Không có mô tả', 7, 123),
('9947b90d80bbcae29a1757e437b0dbc3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Đi tìm sự tuyệt hảo : Những bài học rút ra từ các công ty được quản ly ', 'a6a4c34c', 'Ngô, Thế Chi', 15000, 'Khoa học', 2013, 'Không có mô tả', 8, 455),
('9accbe50da63bc83b7d086bba0fe0710', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế.- 188', '7f65eed6', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế', 15000, 'Lao động', 2009, 'Không có mô tả', 3, 85),
('9b112718937966d879a3e121adb88bd1', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Quản lý khách sạn hiện đại ', '35947030', 'Không, tác giả', 15000, 'Quốc gia', 2001, 'Không có mô tả', 6, 294),
('9b2b51b486dfdd93095d02e71caef8a9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Hoạt động khoa học (Tháng 1 kỳ)', '84078219', 'Bộ Khoa Học Công Nghệ & Môi trường', 50000, 'Trẻ', 2001, 'Không có mô tả', 10, 75),
('9b2f1094d901e557bf9315ab9d4026d4', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', 'e045a86f', 'Bộ Thương Mại', 100000, 'Khoa học', 2009, 'Không có mô tả', 3, 358),
('9c30de30b137262f27a05fd9875fa23c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Văn bản pháp luật về dân sự, hôn nhân gia đình và tố tụng dân sự.', 'bd7f7cd2', 'Okita, Saburo', 20000, 'Khoa học', 2005, 'Không có mô tả', 7, 633),
('9c4f82b9d591d2e0acc52814cbfcb231', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '79a3364b', 'Trung tâm KHTN và CN quốc gia', 20000, 'Khoa học', 2014, 'Không có mô tả', 5, 1050),
('9cd8523dd75e3cc7a09ccd18c52b35f7', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Bảo hiểm xã hội (Tháng 1 kỳ)', '5758696b', 'Bảo hiểm xã hội Việt Nam', 50000, 'Khoa học', 2001, 'Không có mô tả', 2, 300),
('9cddedc5b2c542fdbc9f65eb11331515', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Quyết đoán trong kinh doanh ', '3c63df2a', 'Lasserre, Philippe', 100000, 'Quốc gia', 2007, 'Không có mô tả', 10, 324),
('9cffdfcdfff3d1f5a2025177b9eb5646', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Niên giám thống kê thành phố Hồ Chí Minh 1999 ', '1e8e08ea', 'Arthur, M. Whitehill', 15000, 'Thống kê', 2002, 'Không có mô tả', 4, 268),
('9d43591b7bba63bc2a3722d0e4da35d3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những phù thủy trên thương trường : Những cuộc phỏng vấn với những doa ', '39339834', 'Nguyễn, Đại', 50000, 'Trẻ', 2013, 'Không có mô tả', 6, 195),
('9dd216c16f392e27cde5d4baeaa0ecae', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Tài chính doanh nghiệp (Tháng 1 kỳ)', 'f13e99cd', 'Bộ Nông nghiệp và PTNT', 80000, 'Khoa học', 2000, 'Không có mô tả', 7, 145),
('9e113699470b46c3c19c42d916e37273', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'af1b87e6', 'Trung tâm KHTN và CN quốc gia', 15000, 'Trẻ', 2012, 'Không có mô tả', 4, 201),
('a026d2fcf7df37752c5b2415bac20dcb', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Châu Á - Thái Bình Dương tìm kiếm một hình thức hợp tác mới cho thế ky.', '0f85e709', 'Võ, Thanh Thu', 100000, 'Trẻ', 2003, 'Không có mô tả', 8, 328),
('a0ae6ef657df6d62d1c95104497aea10', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', '5d4ffa96', 'Bộ Lao động thương binh và xã hội', 15000, 'Quốc gia', 2001, 'Không có mô tả', 6, 294),
('a401fb6483568fbaec11fe8caa5b4fdb', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 165', 'efb5614d', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 100000, 'Thống kê', 2015, 'Không có mô tả', 5, 62),
('a4598f24275caf8caa5c588db3f24747', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kế toán hoạt động kinh doanh xuất nhập khẩu ', '8439cacd', 'Lê, Văn Toàn', 15000, 'Lao động', 2012, 'Không có mô tả', 8, 196),
('a4801ba9c32b123e2be42c807c1a5daf', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Đi tìm sự tuyệt hảo : Những bài học được rút ra từ cách quản lý các ', '11b90248', 'Thacker, Ronald J', 50000, 'Trẻ', 2003, 'Không có mô tả', 7, 473),
('a6a0644a5f5e40adcd3aadb5a5558870', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Marketing thực hành ', 'efe5121b', 'Nguyễn, Minh Hằng', 15000, 'Trẻ', 2008, 'Không có mô tả', 4, 264),
('a6ec39380fdf5454a8b39a9cc5d74343', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chính phủ và thị trường trong các chiến lược phát triển kinh tế : Những ', '7a65da9e', 'Phạm, Xuân Nam', 15000, 'Trẻ', 2009, 'Không có mô tả', 6, 215),
('a72bb85c6904ba44a017bb428bd14448', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Một số vấn đề về quản lý vĩ mô nền kinh tế thị trường ở nước ta ', '5e918ea5', 'Hoàng, Thế Liên', 15000, 'Lao động', 2002, 'Không có mô tả', 2, 255),
('a8f8ddb25c25caea7832e63e50017387', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học chính trị Nhật Bản : Sự biến đổi trong nước ', '145e5897', 'Đặng, Xuân Xuyến', 15000, 'Lao động', 2011, 'Không có mô tả', 8, 527),
('a9962408e68859879ca57a28fdbf979a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tại sao Nhật Bản thành công ? ', '754c35ff', 'Kleppner, Otto', 50000, 'Trẻ', 2001, 'Không có mô tả', 5, 249),
('aaacb58840b72c305409b136bc525a25', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chủ nghĩa tư bản ngày nay : Tự điều chỉnh kinh tế ', '33e3c849', 'Nguyễn, Khắc Thân', 100000, 'Quốc gia', 2003, 'Không có mô tả', 6, 204),
('aaf01a98e2320efd67480e1ad8cdc2ea', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', 'e09c8e2c', 'Bộ Thương Mại', 20000, 'Quốc gia', 2001, 'Không có mô tả', 10, 127),
('ab4661e7cbc2c8d900e5a98cd399e1e7', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những nhà doanh nghiệp cần biết thủ tục và phương pháp khi làm việc v ', '7ad2c75f', 'Đinh, Văn Tiến', 20000, 'Quốc gia', 2014, 'Không có mô tả', 5, 427),
('ac2fa9f43e77486aae1b691354a0a945', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Phương pháp soạn thảo văn bản hành chính ', 'e5825fa7', 'Krugman, Paul R', 15000, 'Trẻ', 2000, 'Không có mô tả', 3, 348),
('acaea87c3ef852df50fcccdee2050cd5', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', 'c78406a8', 'Bộ Nông nghiệp và PTNT', 20000, 'Thống kê', 2006, 'Không có mô tả', 4, 197),
('ace63de6301af3b34a7264cbe714ad6f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu lập pháp (Tháng 1 kỳ) = Legislative Studies Magazine', '68b63c6b', 'Văn phòng quốc hội', 15000, 'Khoa học', 2002, 'Không có mô tả', 10, 140),
('ad6fea4611aaec3237f2eafc9f44a353', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những nguyễn tắc kiểm soát và ứng dụng trong quản lý kinh tế-Xã hội ', '5b76d47a', 'Không, tác giả', 20000, 'Khoa học', 2004, 'Không có mô tả', 7, 214),
('aea03a55eb227bfb02d156e6ab336db2', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Người Nhật quản lý sản xuất như thế nào ', 'cdcf065b', 'Kato, Hiroki', 50000, 'Quốc gia', 2001, 'Không có mô tả', 2, 299),
('aecdf815b5a3950731b92c13799da7f8', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Bàn về cải cách toàn diện doanh nghiệp nhà nước ', 'e6a5a0c0', 'Không, tác giả', 15000, 'Quốc gia', 2000, 'Không có mô tả', 7, 348),
('af6d6f1a52fe0ca06d72a45e90d83a7c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các quy định pháp luật về đầu tư nước ngoài tại Việt Nam ', 'f707b721', 'Không, tác giả', 100000, 'Khoa học', 2003, 'Không có mô tả', 8, 177),
('b10efd36f897b70db609f043071eb674', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', 'ea523b92', 'TT kinh tế châu Á - Thái Bình Dương', 50000, 'Khoa học', 2003, 'Không có mô tả', 5, 1112),
('b151ede89b8f467669f747dbe07b9591', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những quy định pháp luật về quyền lợi và nghĩa vụ của công chức-viên.', '64ee221e', 'Không, tác giả', 80000, 'Thống kê', 2010, 'Không có mô tả', 9, 725),
('b1725ea504c1136b2d8d4aaae71c84cb', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các công ty xuyên quốc gia hiện đại ', '8e5e8771', 'Lê, Văn Sang', 15000, 'Khoa học', 2002, 'Không có mô tả', 10, 140),
('b1e7dfd2a2ce2f32131b0aa0e3a141ec', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Trao đổi ý kiến : Những vấn đề lý luận của CNXH ở VN ', 'e93b5260', 'Không, tác giả', 15000, 'Thống kê', 2008, 'Không có mô tả', 8, 78),
('b27981b3c6d82b3f6f31ad55b59df4fd', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nhà nước và pháp luật (Tháng 1 kỳ) = State and law', 'afc2a1a5', 'Trung tâm KHXH và NV Quốc gia', 80000, 'Trẻ', 2003, 'Không có mô tả', 7, 890),
('b3198259a5498b188a31d1aa6b88e2c5', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hướng phát triển thị trường xuất nhập khẩu Việt Nam tới năm 2010 ', '57a1e23f', 'Phạm, Quyền', 80000, 'Lao động', 2012, 'Không có mô tả', 8, 339),
('b32cd1f0c9710fed18ca05766c4cc916', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Hoạt động khoa học (Tháng 1 kỳ)', '957cb3bb', 'Bộ Khoa Học Công Nghệ & Môi trường', 100000, 'Lao động', 2002, 'Không có mô tả', 8, 193),
('b438927acdabcd2bf63987c1f96425af', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', '79142b8a', 'Bộ Nông nghiệp và PTNT', 100000, 'Trẻ', 2003, 'Không có mô tả', 8, 328),
('b4d1647872bd235b88a4a09058a12d6c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Nguyên lý kế toán Mỹ ', '33240bc9', 'Trần, Hoàng Kim', 50000, 'Khoa học', 2008, 'Không có mô tả', 10, 280),
('b5493efa3478bf911264ae479cb4cee1', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế Trung Quốc bước vào thế kỷ XXI ', '8dce65d7', 'Không, tác giả', 80000, 'Quốc gia', 2000, 'Không có mô tả', 3, 0),
('b58cc6225de30961fb917057b97cfd4f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', '03ddf97c', 'Saigon Times Group', 15000, 'Quốc gia', 2006, 'Không có mô tả', 9, 308),
('b59ed5272650aa606b9261f0e1152107', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', 'a9b364f9', 'Tổng Cục Thuế', 50000, 'Thống kê', 2000, 'Không có mô tả', 4, 649),
('b6ca830deadfa813ff4973fe9f4e4dbc', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', '1bf202bb', 'Bộ Nông nghiệp và PTNT', 80000, 'Trẻ', 2000, 'Không có mô tả', 7, 110),
('b6d947498eff11319255c8afd539c148', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Một số quan điểm về đổi mới chính sách kinh tế và cơ chế quản lý kin ', '30aa0cac', 'Vũ, Ngọc Nhung', 100000, 'Thống kê', 2002, 'Không có mô tả', 3, 215),
('b6dcdbff259fbc1301a97bf86f255519', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '0c430bdc', 'Trung tâm KHTN và CN quốc gia', 80000, 'Lao động', 2005, 'Không có mô tả', 5, 155),
('b70b991804fd7406d5a382d29f343b29', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hướng dẫn cơ bản về xuất khẩu hàng hóa và tiếp thị tại Mỹ.', 'e015db39', 'Trần, Đức', 20000, 'Thống kê', 2007, 'Không có mô tả', 9, 830),
('b7223a780fa9f7a564854392d62fc702', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'd082120e', 'Trung tâm KHTN và CN quốc gia', 15000, 'Quốc gia', 2014, 'Không có mô tả', 9, 146),
('b75a80d0f17b07caa77e611cdc38005f', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thời báo kinh tế Sài Gòn (Tháng 4 kỳ)', 'beb99007', 'Bộ Nông nghiệp và PTNT', 15000, 'Trẻ', 2000, 'Không có mô tả', 3, 348),
('b8eec6e9669333541d7369cd0e70017e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'aafcdd39', 'Trung tâm KHTN và CN quốc gia', 50000, 'Thống kê', 2013, 'Không có mô tả', 9, 177),
('b919f344f817cb81f2bb8ff450a5dcec', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế Nhật Bản sau chiến tranh thế giới thứ hai.', 'b7b1c96c', 'Heilbroner, Robert L', 50000, 'Trẻ', 2011, 'Không có mô tả', 9, 456),
('b92463bcf71b71ccb74149d2b8363ca7', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cẩm nang quản trị doanh nghiệp ', '529f9ea3', 'Mai, Ngọc Cường', 20000, 'Quốc gia', 2006, 'Không có mô tả', 8, 476),
('baa84075aff926afeb04a982d23026bd', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh.- 01', 'a9bf84a1', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh', 80000, 'Quốc gia', 2014, 'Không có mô tả', 4, 162),
('baf7ea7ced57396929af78e8e5b03b87', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tài sản quốc gia nhà, đất chế độ quản lý tài chính và thuế.', '2b71b332', 'Không, tác giả', 15000, 'Lao động', 2009, 'Không có mô tả', 3, 85),
('bb991f199f6265df6dea0dacf57f4082', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', '46fa7e8a', 'Bộ Nông nghiệp và PTNT', 20000, 'Quốc gia', 2014, 'Không có mô tả', 5, 427),
('bbcc02a1272c14adb16aba7e96f20e21', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chiến lược quản lý và kinh doanh ', '3f34fe0c', 'Không, tác giả', 15000, 'Trẻ', 2005, 'Không có mô tả', 3, 583),
('bc7e11ee1ac4fba895427e444dedaeda', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Lịch sử bang giao Việt Nam - Đông Nam Á(Trước công nguyên tới thế kỷ X ', '545f3b1b', 'Không, tác giả', 100000, 'Khoa học', 2009, 'Không có mô tả', 3, 358),
('bcb0b250b7ad41130c38b3eae0828a42', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế.- 187', '75c560ea', 'Phát triển kinh tế (Tháng 1 kỳ)TP.HCM : Trường Đại Học Kinh Tế', 50000, 'Thống kê', 2004, 'Không có mô tả', 8, 505),
('bf7563aee817c325f612c58324b877c0', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '1e19b83c', 'TT kinh tế châu Á - Thái Bình Dương', 100000, 'Khoa học', 2015, 'Không có mô tả', 8, 262),
('bf8898c6e3b4d87c06caf59383bbec5c', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Quản lý dự án bằng phương pháp mạng phân tích ABC ', '70ab6f20', 'Alam, M. Shahid', 80000, 'Lao động', 2008, 'Không có mô tả', 5, 133),
('bfec0fc4cdad560726d74975e2e0a08d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', 'e6346d33', 'Bộ Thương Mại', 80000, 'Thống kê', 2009, 'Không có mô tả', 8, 398),
('bffb6164c90c708bba13249e657168f3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Marketing gạo ', '8d797816', 'Không, tác giả', 80000, 'Trẻ', 2015, 'Không có mô tả', 8, 99),
('c169728aa270b0348fa1efba6b2603e1', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', '54cef6e8', 'Bộ Lao động thương binh và xã hội', 80000, 'Lao động', 2011, 'Không có mô tả', 3, 153),
('c1c98449d4aa6273d2cb656585deb131', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tìm hiểu để hợp tác và kinh doanh với Mỹ ', 'e5f281e6', 'Lý, Kinh Vân', 20000, 'Quốc gia', 2010, 'Không có mô tả', 8, 217),
('c1cfc2e4dee00ec5062be5bd700c7bb7', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '2dff801f', 'Trung tâm KHTN và CN quốc gia', 20000, 'Thống kê', 2005, 'Không có mô tả', 4, 195),
('c26824caaf3ff4872ca661b3f7fe7288', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chính sách tài chính và thị trường vốn ', 'f2e0edfe', 'Không, tác giả', 50000, 'Trẻ', 2000, 'Không có mô tả', 3, 114),
('c2d2a92f63f11ac2b548fadaf2794af1', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế doanh nghiệp ', '0ad5a017', 'Morishima, Michio', 50000, 'Lao động', 2000, 'Không có mô tả', 2, 210),
('c30f316f4a77df1b0b04b032d9d9bed7', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Xí nghiệp quản lý và sức cạnh tranh ', '8e9944f1', 'Colman, David', 15000, 'Lao động', 2008, 'Không có mô tả', 5, 520),
('c65bd129532f52460c4fae71617406a3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Lý thuyết kiểm toán ', '82e78ab6', 'Bhatt, V. V', 50000, 'Khoa học', 2008, 'Không có mô tả', 2, 303),
('c70e2d84909eefa857ef79b691278a28', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học quốc tế : Lý thuyết và chính sách ', 'c24f1138', 'Không, tác giả', 80000, 'Quốc gia', 2006, 'Không có mô tả', 5, 499),
('c781f513cd357d6d131059f3ec689cd2', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế thế giới bước vào thập kỷ 90 ', '1b695235', 'Hoàng, Hà', 80000, 'Quốc gia', 2001, 'Không có mô tả', 2, 283),
('c7fa6b67788e69f888ce62bca90582ff', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nông nghiệp và phát triển nông thôn (Tháng 1 kỳ) = Science & Technology Journal of Agriculture & Rural Development', 'c73ffb31', 'Bộ Nông nghiệp và PTNT', 20000, 'Khoa học', 2013, 'Không có mô tả', 8, 211),
('c9d020b70b438c638a4527938e7df116', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Triết học (Tháng 1 kỳ) = Philosophy', '95cbae7a', 'Viện Triết học', 50000, 'Trẻ', 2003, 'Không có mô tả', 7, 473),
('cc85794eb2f295dd78cf9f516ac0aa27', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Chiến lược tiếp thị ', '14877ed4', 'Yamamura, Kozo', 20000, 'Quốc gia', 2005, 'Không có mô tả', 3, 191),
('cce3b57ca4aa70028ad1b8ddfb1a3546', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Phát triển kinh tế theo hướng thị trường ', 'd67a8247', 'Putti, Joseph M', 100000, 'Quốc gia', 2015, 'Không có mô tả', 2, 256),
('ccec3c254ae624b1d53c43317f1686dc', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh.- 02', '1ea245a5', 'Công Báo (Những quy định của HĐND, UBND TP.HCM)TP.HCM : UBND thành phố Hồ Chí Minh', 15000, 'Quốc gia', 2009, 'Không có mô tả', 2, 245),
('cd27ebbe4684a47bc98ff43d64becb3f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế thị trường : Lý thuyết và thực tiễn ', '001b15a9', 'Guy, Cardineau', 80000, 'Lao động', 2001, 'Không có mô tả', 6, 352),
('cd2ffd03fc4233a6a9d0ddba7b44c00a', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp luật về thanh tra.', '993c3528', 'Không, tác giả', 50000, 'Thống kê', 2004, 'Không có mô tả', 8, 505),
('ce3ffdff3c1cae8040c8df662d1d5191', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học chính trị Nhật Bản : Sự biến đổi trong nước ', 'a3439993', 'Phạm, Văn Nghiêm', 15000, 'Lao động', 2006, 'Không có mô tả', 8, 374),
('cec04aa71e021f351d27a0010b00d289', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '3af574e1', 'TT kinh tế châu Á - Thái Bình Dương', 20000, 'Quốc gia', 2005, 'Không có mô tả', 3, 191),
('cfd5a752351aec98b19a2cd9eac8280b', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Bảo hiểm xã hội (Tháng 1 kỳ)', 'fe794d2e', 'Bảo hiểm xã hội Việt Nam', 80000, 'Thống kê', 2012, 'Không có mô tả', 10, 178),
('d057b5f0a9b7407088f698ddbbce1cd1', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tìm hiểu chế độ kinh tế trong hiến pháp ', 'c71f5626', 'Nguyễn, Đức Diệu', 100000, 'Trẻ', 2015, 'Không có mô tả', 4, 281),
('d068a05fa49d24f2e0c6fac0de4cb42f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Bản lĩnh kinh doanh của các doanh nghiệp Nhật Bản ', '054b52b7', 'Ngô, Đặng Tính', 15000, 'Trẻ', 2012, 'Không có mô tả', 4, 201),
('d1dca3a7b34122f282d659440192a666', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu kinh tế (Tháng 1 kỳ) = Economic Studies', 'cebef74f', 'Trung tâm KHXH và NV Quốc gia', 80000, 'Thống kê', 2010, 'Không có mô tả', 9, 725),
('d25083bfa4981d03c6b082ae382cd0fb', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thông tin khoa học xã hội (Tháng 1 kỳ)', 'd5d25510', 'Trung tâm KHXH và NV Quốc gia', 15000, 'Thống kê', 2007, 'Không có mô tả', 10, 278),
('d279a2e2e9e71efc30d6966122015c11', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tìm hiểu thị trường và luật lệ buôn bán của Nhật Bản.', 'b2e18e72', 'Tô, Xuân Dân', 15000, 'Khoa học', 2002, 'Không có mô tả', 10, 96),
('d2ff3c92a884436ceb37ce8194516785', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu Đông Nam Á (Tháng chẵn) = Southeast Asian studies', '12c8f35c', 'Viện nghiên cứu Đông Nam Á', 50000, 'Khoa học', 2000, 'Không có mô tả', 7, 123),
('d385b7551b75d285db2d3e6d774a8a5e', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Điều chỉnh kinh tế của nhà nước ở các nước tư bản phát triển ', '39434675', 'Braudel, Fernand', 80000, 'Trẻ', 2006, 'Không có mô tả', 5, 194),
('d4a40929c1834b8d3b72b37d73592946', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT.- 70', '36243f81', 'Thế giới vi tính (Tháng 1 kỳ) = PC World Việt NamTP.HCM : Sở KHCN và MT', 15000, 'Quốc gia', 2000, 'Không có mô tả', 7, 348),
('d734fcd7a1d609182d9a91481a2c81d4', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Thị trường Nhật Bản.', 'a924d42f', 'Lê, Xuân Nghĩa', 50000, 'Lao động', 2009, 'Không có mô tả', 4, 259),
('d7aff73856e3d96cf3bc0e79337fbde1', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh nghiệm quản trị doanh nghiệp những điều nhà quản lý cần nghe nhữn ', '7f5ba602', 'Lucron, Xavier', 15000, 'Quốc gia', 2010, 'Không có mô tả', 8, 223),
('d8da4a0525ad9cc0af6fb98300efccb7', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', '1bfee2e3', 'Bộ Lao động thương binh và xã hội', 100000, 'Khoa học', 2003, 'Không có mô tả', 8, 177),
('d9227e8c2ad3da4d6c51cfa368ed9d7a', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nhà quản lý', '8469b99b', 'Viện Nghiên cứu và đào tạo về quản lý', 50000, 'Quốc gia', 2009, 'Không có mô tả', 3, 562),
('d9235d46d0cbf3365dbea13946e3d4ff', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Triết học (Tháng 1 kỳ) = Philosophy', '36932240', 'Viện Triết học', 20000, 'Khoa học', 2004, 'Không có mô tả', 7, 214),
('d9bf13adee31fe00c46a4ef5c530d13b', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Những nguyên lý tiếp thị : Marketing căn bản ', '70c554a2', 'Fforde, Adam', 20000, 'Thống kê', 2005, 'Không có mô tả', 4, 195),
('da71b909ff02ca717ada56308f186c66', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '43c40216', 'Trung tâm KHTN và CN quốc gia', 20000, 'Thống kê', 2007, 'Không có mô tả', 9, 830),
('dbf5f067f08d9970a00a9d3f547e6419', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '95a595f8', 'Trung tâm KHTN và CN quốc gia', 80000, 'Quốc gia', 2014, 'Không có mô tả', 7, 149),
('dc6a9f8531dcb2130fd004d8e0969297', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', 'eae52653', 'Tổng Cục Thuế', 15000, 'Khoa học', 2006, 'Không có mô tả', 4, 135),
('dd6592f1b1888b6c0c9a180928c53c04', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', 'bbe9d719', 'Saigon Times Group', 20000, 'Quốc gia', 2006, 'Không có mô tả', 8, 476),
('dd7dea92d12dde3e36598125704b1316', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Căn bản marketing hiện đại ', '701c72e1', 'Peters, Tom', 50000, 'Quốc gia', 2015, 'Không có mô tả', 8, 141),
('df0a5858175e63d029eef9b745d8fd81', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Tổ chức nhà nước (Tháng 1 kỳ)', '818ee344', 'Ban TCCB Chính phủ', 20000, 'Lao động', 2004, 'Không có mô tả', 8, 153),
('df40ab6e73447c5dd6f257ff65f96dbc', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Văn bản hướng dẫn thực hiện Luật Ngân sách nhà nước ', 'd3f3e31a', 'Jean, Domonique Lafay', 50000, 'Quốc gia', 2015, 'Không có mô tả', 10, 219),
('dfc198bb068bfbb1d2c88872391dd91f', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hỏi đáp về cổ phần hóa và thị trường chứng khoán ', '2e21f42c', 'Không, tác giả', 80000, 'Lao động', 2002, 'Không có mô tả', 10, 475),
('e035a269a42e3c651146e8e1bdd80d01', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'The Saigon Times Weekly (Tháng 4 kỳ)', 'acefc3bf', 'Saigon Times Group', 20000, 'Trẻ', 2009, 'Không có mô tả', 9, 107),
('e2df8979dd526356e62b0ea91ea4bf86', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Văn hoá thể chế và tăng trưởng kinh tế : nghiên cứu so sánh Hàn quố ', 'f7b0aae0', 'Không, tác giả', 100000, 'Lao động', 2007, 'Không có mô tả', 8, 164),
('e42a110bd1cb03711c620a24e46907b8', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Bản lĩnh kinh doanh của các doanh nghiệp Nhật Bản ', 'b25693b3', 'Nguyễn, Phú Kỳ', 80000, 'Quốc gia', 2010, 'Không có mô tả', 2, 302),
('e43c2097ea7af272b89d4fe8880f6756', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế thị trường : Lý thuyết và thực tiễn ', 'bda65a91', 'Lê, Thành Nghiệp', 20000, 'Lao động', 2013, 'Không có mô tả', 7, 419),
('e5d07d027399ac18175a2083789df4b9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Con số và sự kiện (Tháng 1 kỳ)', 'c12005ef', 'Tổng cục Thống kê', 100000, 'Khoa học', 2004, 'Không có mô tả', 3, 275),
('e5dccd9a2ecb0224bec83f4c9822432d', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '58c69bcb', 'Trung tâm KHTN và CN quốc gia', 15000, 'Lao động', 2002, 'Không có mô tả', 2, 255),
('e673fa4ab4b6e18046f6241ca8dc0568', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Marketing công nghiệp ', 'cd781b9a', 'Lương, Xuân Quỳ', 20000, 'Thống kê', 2000, 'Không có mô tả', 2, 323),
('e6f288b1aab6d4818e880a1dba881965', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các địnhchế hướng dẫn kinh doanh bảo hiểm ', '2e96e9ed', 'Không, tác giả', 20000, 'Trẻ', 2009, 'Không có mô tả', 3, 367),
('e87f057ddf3c7c6d29a1f585c9ef8476', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu kinh tế (Tháng 1 kỳ) = Economic Studies', '52d10836', 'Trung tâm KHXH và NV Quốc gia', 100000, 'Khoa học', 2000, 'Không có mô tả', 8, 228),
('e88360808c17736b597a999000faf3e7', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Về chuyển dịch cơ cấu trong nông nghiệp nước ta hiện nay.', '5e269364', 'Không, tác giả', 20000, 'Quốc gia', 2001, 'Không có mô tả', 10, 127),
('e884051f1a03d091038f685cbc351d14', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', '3f122e3e', 'TT kinh tế châu Á - Thái Bình Dương', 20000, 'Khoa học', 2005, 'Không có mô tả', 7, 633),
('e8ded569a684ee0083e6b817c8fe8807', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Nghiên cứu kinh tế (Tháng 1 kỳ) = Economic Studies', 'ace323e7', 'Trung tâm KHXH và NV Quốc gia', 15000, 'Khoa học', 2008, 'Không có mô tả', 2, 1399),
('e9b0013eb8c72f8eec38ce62df3b26ca', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Giúp đỡ các doanh nghiệp nhỏ và vừa bằng cách nào?.', 'e342fa1f', 'Không, tác giả', 15000, 'Lao động', 2000, 'Không có mô tả', 3, 80),
('e9d31e1829d50b7a0ac4cd0127645fb9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', 'c4c75f30', 'Trung tâm KHTN và CN quốc gia', 15000, 'Thống kê', 2013, 'Không có mô tả', 4, 346),
('eb41aba738630250d00c692883e8a168', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp luật về quản lý tài chính doanh nghiệp.', 'c89f4145', 'Percerou, Do Roger', 50000, 'Khoa học', 2003, 'Không có mô tả', 2, 571),
('eb769ea4f5b263fd5863066c4851e4eb', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các khu chế xuất Châu Á.', '583f109f', 'Lê, Văn In', 15000, 'Thống kê', 2007, 'Không có mô tả', 10, 278),
('ebcf57db607e5871c27140d05b9bd702', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kế toán (Tháng chẵn) = Accounting reviewChưa rõ : Hội Kế toán VN.- 59', '2d26a65c', 'Kế toán (Tháng chẵn) = Accounting reviewChưa rõ : Hội Kế toán VN', 15000, 'Lao động', 2006, 'Không có mô tả', 8, 374),
('ec8ddb09ddd7dc211dcd3d38575200d9', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '7c446c94', 'Tổng Cục Thuế', 80000, 'Thống kê', 2012, 'Không có mô tả', 6, 970),
('ec9781487d48a14e3baa2b1ac88b331e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '9ae2411b', 'Trung tâm KHTN và CN quốc gia', 15000, 'Khoa học', 2003, 'Không có mô tả', 10, 241),
('ed1416cfdf9731c26b90b4cea538d100', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế Mỹ lí thuyết chính sách đổi mới và thực tiễn ', '8b7e1e2e', 'Nguyễn, Văn Chọn', 80000, 'Thống kê', 2012, 'Không có mô tả', 10, 178),
('ed48d8a5c5622c5550337db381d81e26', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '49bdaa69', 'Trung tâm KHTN và CN quốc gia', 80000, 'Thống kê', 2013, 'Không có mô tả', 9, 333),
('ee3a4394b54616fae1232a6392ec1311', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Bàn về cơ chế kinh tế thị trường Trung Quốc ', '88293f08', 'Không, tác giả', 50000, 'Khoa học', 2003, 'Không có mô tả', 5, 1112),
('ee8efe53e4bae470e47b33edfa446f8e', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Các văn bản pháp luật mới nhất về thuế ', 'bdc86113', 'Denis, Pettigrew', 20000, 'Khoa học', 2014, 'Không có mô tả', 5, 1050),
('f09c9812964ccb1441ebfba8fe798b4c', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Thuế nhà nước (Tháng 4 kỳ)', '5129ac37', 'Tổng Cục Thuế', 100000, 'Thống kê', 2012, 'Không có mô tả', 7, 868),
('f213ef407ea27ffa6e0e5a331b8b74e3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Cơ chế thị trường và vai trò nhà nước trong nền kinh tế Việt Nam ', '8d174394', 'Không, tác giả', 20000, 'Quốc gia', 2009, 'Không có mô tả', 3, 98),
('f223a082bc1a0055fb04faaa3edb1207', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '4ceded77', 'Trung tâm KHTN và CN quốc gia', 15000, 'Khoa học', 2013, 'Không có mô tả', 8, 455),
('f273425c924b742ecff35e86833f2372', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Bảo hộ lao động (Tháng 1 kỳ) = Labour Protection Review', '62cf9414', 'Liên Đoàn Lao động Việt Nam', 15000, 'Trẻ', 2010, 'Không có mô tả', 5, 238),
('f45c6d6ab37b1cd577b38c5265135f84', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Doanh nghiệp và thương hiệu', '7f690e8e', 'Hiệp hội doanh nghiệp nhỏ & vừa ngành nghề nông thôn Việt Nam', 50000, 'Khoa học', 2007, 'Không có mô tả', 6, 135),
('f52a56837d2e5ee55a9a38adc597d232', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Hàng ngày/1)', '06e385e0', 'Trung tâm KHTN và CN quốc gia', 20000, 'Lao động', 2002, 'Không có mô tả', 8, 119),
('f5c13419023fad5e8d30747b77e1fee0', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Ngoại thương (Tháng 4 kỳ)', 'cb59ad90', 'Bộ Thương Mại', 100000, 'Quốc gia', 2011, 'Không có mô tả', 2, 166),
('f5cbdc6ce01e5878249d7267927acd10', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Hoạt động khoa học (Tháng 1 kỳ)', '8d5fa824', 'Bộ Khoa Học Công Nghệ & Môi trường', 15000, 'Quốc gia', 2012, 'Không có mô tả', 4, 105),
('f73d1cc3ffe91dc012be23dfded894a2', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế thị trường và nghề giám đốc ', '9cdb6ff7', 'Không, tác giả', 100000, 'Khoa học', 2015, 'Không có mô tả', 8, 262),
('f8c432c556dc8122bf9dbc4504eca639', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hội nhập với Afta : Cơ hội và thách thức ', 'e0bc233b', 'Tô, Xuân Dân', 80000, 'Quốc gia', 2014, 'Không có mô tả', 4, 162),
('f915914409b26233645928d5d7c450ac', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Hiểu và làm việc với thế giới thương mại của Nhật Bản ', '3cd4c2eb', 'Lý, Kinh Vân', 80000, 'Khoa học', 2006, 'Không có mô tả', 6, 309),
('fa08c6b28e882cc777c78305a9bd3119', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Lao động và xã hội = Labour and social affairs review', 'f1e7bf8e', 'Bộ Lao động thương binh và xã hội', 20000, 'Trẻ', 2010, 'Không có mô tả', 3, 1023),
('fa2dc36ada595ed29cdcb8b3caba7c06', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Tìm hiểu về marketing basic marketing.', '3a64b912', 'Không, tác giả', 15000, 'Khoa học', 2006, 'Không có mô tả', 4, 135),
('fa4a3b7c3f5e0b499b1fc6799221d44e', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Dân chủ và pháp luật (Tháng 1 kỳ)', '8b9970b9', 'Trung tâm KHTN và CN quốc gia', 80000, 'Quốc gia', 2000, 'Không có mô tả', 3, 0),
('fa5d959b5c4d211bf4ba9ae411cd712d', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Trách nhiệm hình sự đối với các tội xâm phạm hoạt động tư pháp ', '57081a3d', 'Đỗ, Quang Chuyền', 15000, 'Khoa học', 2003, 'Không có mô tả', 10, 241),
('fcf3bf3be10eaebf03a291a774c80626', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Kinh tế châu Á Thái Bình Dương (Tháng 4 kỳ) = Asia-Pacific economic review', 'e3642a2d', 'TT kinh tế châu Á - Thái Bình Dương', 100000, 'Thống kê', 2014, 'Không có mô tả', 6, 232),
('ff6e52f128d7d1b53a51401d7d898708', 'dc2703a295fff72609e7860371a6d203', '2016-06-10', 'Công báo (Cách ngày)', '2818dac0', 'Trung tâm KHTN và CN quốc gia', 20000, 'Quốc gia', 2010, 'Không có mô tả', 8, 217),
('ffb2cb189cb6d11ff5ae63ae09d4e1b3', '816be864bf1ff2e4d04b154cc43cd8c7', '2016-06-10', 'Kinh tế học đô thị ', '36049296', 'Bello, Walden', 100000, 'Lao động', 2010, 'Không có mô tả', 7, 495);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(50) NOT NULL,
  `name` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
('816be864bf1ff2e4d04b154cc43cd8c7', 'STK'),
('dc2703a295fff72609e7860371a6d203', 'Báo / Tạp chí');

-- --------------------------------------------------------

--
-- Table structure for table `issuedetails`
--

CREATE TABLE `issuedetails` (
  `id` char(50) NOT NULL,
  `issueid` char(50) NOT NULL,
  `bookid` char(50) NOT NULL,
  `state` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issuedetails`
--

INSERT INTO `issuedetails` (`id`, `issueid`, `bookid`, `state`) VALUES
('162ba20a2646a8f7d0effae89ca6631d', '1c08f4755455093d0615a825e80ffc96', '41f929978ad51081d486f9e3e9ae0f14', 1),
('1d6622d8bb106a6d28cf90ef8478d2d5', '3aaf96a100f6efc26634821e391a9ec4', '083994abb440bed28d084b6c158f4c91', 1),
('2f25591437c4d72e3d3f258866f00087', '3aaf96a100f6efc26634821e391a9ec4', '012c9dfc8e9d3faf38d83ea8c6eb347b', 1),
('323d7ba99010ca5c549d66b70d3672b9', '1c08f4755455093d0615a825e80ffc96', '3b99c19601eead04feaec05bccbabdc7', 1),
('36bc0e6b89b7b7073d3a3aeefc8e66b6', '3aaf96a100f6efc26634821e391a9ec4', '0324f984221e9c2f742042c6e9f73203', 1),
('4b859696cafd4fa331c3b60aa93043c1', '3aaf96a100f6efc26634821e391a9ec4', '03a901a5d946327accc2953f94a2a3a3', 1),
('4f7650bf9729ac9391984302c342a197', '1c08f4755455093d0615a825e80ffc96', '767603647781808f90c12b7f0430515e', 1),
('53c065c2e9c7a23c441a539d9edc5f74', '3aaf96a100f6efc26634821e391a9ec4', '004554a287a3d89d81bd3d836806d935', 1),
('6c36eb3e5e112b9b1f83661466fa4ff8', '1c08f4755455093d0615a825e80ffc96', '404b998ac7a26d6a0463a594f79ee36f', 1),
('91136bfec93c8461d0aec76f8f3afda6', '1c08f4755455093d0615a825e80ffc96', '7d12239662e64acd58e1a618be1277eb', 1),
('b194971c9408f3601702bade21f1ed47', '3aaf96a100f6efc26634821e391a9ec4', '035384d869bb312eb68c7b15ebed79e3', 1),
('b4c9190c540d4a0d9e35f9ec55a2942a', '1c08f4755455093d0615a825e80ffc96', '56feff7f498d9e8c2f495adc3744fb82', 1),
('ca9f2d332ce23bbb73270087b8b4edd1', '3aaf96a100f6efc26634821e391a9ec4', '06d252592c48f5e523f9b1f5d3cf423b', 1),
('e8519edb50481fb7c1a29780945740cd', '3aaf96a100f6efc26634821e391a9ec4', '00abaf773890947f477e529a039c7e54', 1),
('f75d1869c2f3002f81fa593f3465900c', '3aaf96a100f6efc26634821e391a9ec4', '0389068587387494d760b9212be5fcef', 1);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` char(50) NOT NULL,
  `user` char(30) NOT NULL,
  `dateissue` datetime NOT NULL,
  `datesubmit` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issues`
--

INSERT INTO `issues` (`id`, `user`, `dateissue`, `datesubmit`) VALUES
('1c08f4755455093d0615a825e80ffc96', '734148', '2016-06-16 02:53:02', '2016-12-16'),
('3aaf96a100f6efc26634821e391a9ec4', 'scila1996', '2016-06-16 02:44:21', '2016-12-16');

-- --------------------------------------------------------

--
-- Table structure for table `issue_rule`
--

CREATE TABLE `issue_rule` (
  `month` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_rule`
--

INSERT INTO `issue_rule` (`month`, `total`) VALUES
(6, 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user` char(30) NOT NULL,
  `pass` char(100) NOT NULL,
  `name` char(50) NOT NULL,
  `state` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user`, `pass`, `name`, `state`) VALUES
('734148', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Ng Trung', b'11'),
('aaa', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'aaa', b'11'),
('scila1996', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Nguyen Trung', b'11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD UNIQUE KEY `user` (`user`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoryid` (`id`);

--
-- Indexes for table `issuedetails`
--
ALTER TABLE `issuedetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issueid` (`issueid`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user` (`user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user`),
  ADD UNIQUE KEY `user` (`user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`);

--
-- Constraints for table `issuedetails`
--
ALTER TABLE `issuedetails`
  ADD CONSTRAINT `issuedetails_ibfk_1` FOREIGN KEY (`issueid`) REFERENCES `issues` (`id`),
  ADD CONSTRAINT `issuedetails_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `books` (`id`);

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
