-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2026 at 03:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freshmarket_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `Users_ID` varchar(20) DEFAULT NULL,
  `Address_description` text DEFAULT NULL,
  `Subdistrict` varchar(100) DEFAULT NULL,
  `District` varchar(100) DEFAULT NULL,
  `Province` varchar(100) DEFAULT NULL,
  `Zip_code` varchar(10) DEFAULT NULL,
  `Tel` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`Address_ID`, `Users_ID`, `Address_description`, `Subdistrict`, `District`, `Province`, `Zip_code`, `Tel`) VALUES
(5, 'USR-102', '19/8 ซอยรามอินทรา 82', 'มีนบุรี', 'มีนบุรี', 'กรุงเทพ', '10510', '0981234567'),
(6, 'USR-101', '40/2 รามอินทรา 87', 'มีนบุรี', 'มีนบุรี', 'กรุ่งเทพ', '10510', '0983230657'),
(7, 'EMP-001', '55 ซอยเสรีไทย26', 'บึงกุ่ม', 'คันนายาว', 'กรุงเทพ', '10260', '0987461793');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Category_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_ID`, `Category_name`) VALUES
(1, 'อาหารสด'),
(2, 'อาหารกึ่งสำเร็จรูป'),
(3, 'อาหารแช่แข็ง'),
(4, 'ขนมขบเคี้ยว');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `Delivery_ID` int(11) NOT NULL,
  `Address_ID` int(11) DEFAULT NULL,
  `Oder_ID` int(11) DEFAULT NULL,
  `Tracking_Number` varchar(50) DEFAULT NULL,
  `Shipping_status` varchar(50) DEFAULT NULL,
  `Delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`Delivery_ID`, `Address_ID`, `Oder_ID`, `Tracking_Number`, `Shipping_status`, `Delivery_date`) VALUES
(5, 5, 25, 'TRACK-4609', 'Pending', '2026-03-30'),
(6, 6, 28, 'TRACK-5227', 'Pending', '2026-03-30'),
(7, 7, 29, 'TRACK-4040', 'Pending', '2026-03-30');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Inventory_ID` int(11) NOT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Inventory_qty` int(11) DEFAULT NULL,
  `Inventory_status` varchar(50) DEFAULT NULL,
  `Inventory_DateReceived` date DEFAULT NULL,
  `Inventory_unitcost` decimal(10,2) DEFAULT NULL,
  `Inventory_date_exp` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Inventory_ID`, `Product_ID`, `Inventory_qty`, `Inventory_status`, `Inventory_DateReceived`, `Inventory_unitcost`, `Inventory_date_exp`) VALUES
(1, 101, 50, 'In Stock', '2026-03-30', 56.00, '2026-04-29'),
(2, 102, 50, 'In Stock', '2026-03-30', 49.00, '2026-04-29'),
(3, 103, 50, 'In Stock', '2026-03-30', 42.00, '2026-04-29'),
(4, 201, 50, 'In Stock', '2026-03-30', 4.90, '2026-04-29'),
(5, 202, 50, 'In Stock', '2026-03-30', 4.90, '2026-04-29'),
(6, 203, 50, 'In Stock', '2026-03-30', 4.90, '2026-04-29'),
(7, 204, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(8, 301, 50, 'In Stock', '2026-03-30', 31.50, '2026-04-29'),
(9, 302, 50, 'In Stock', '2026-03-30', 31.50, '2026-04-29'),
(10, 303, 50, 'In Stock', '2026-03-30', 35.00, '2026-04-29'),
(11, 401, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(12, 402, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(13, 403, 50, 'In Stock', '2026-03-30', 36.40, '2026-04-29'),
(14, 404, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(15, 405, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(16, 406, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(17, 407, 50, 'In Stock', '2026-03-30', 7.00, '2026-04-29'),
(18, 408, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(19, 409, 50, 'In Stock', '2026-03-30', 22.40, '2026-04-29'),
(20, 410, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(21, 411, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(22, 501, 50, 'In Stock', '2026-03-30', 11.20, '2026-04-29'),
(23, 502, 50, 'In Stock', '2026-03-30', 11.20, '2026-04-29'),
(24, 503, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(25, 504, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(26, 505, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(27, 506, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(28, 507, 50, 'In Stock', '2026-03-30', 17.50, '2026-04-29'),
(29, 508, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(30, 509, 50, 'In Stock', '2026-03-30', 11.20, '2026-04-29'),
(31, 601, 50, 'In Stock', '2026-03-30', 17.50, '2026-04-29'),
(32, 602, 50, 'In Stock', '2026-03-30', 63.00, '2026-04-29'),
(33, 603, 50, 'In Stock', '2026-03-30', 21.00, '2026-04-29'),
(34, 604, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(35, 605, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(36, 606, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(37, 607, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(38, 608, 50, 'In Stock', '2026-03-30', 14.00, '2026-04-29'),
(39, 609, 50, 'In Stock', '2026-03-30', 31.50, '2026-04-29'),
(40, 701, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(41, 702, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(42, 703, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(43, 704, 50, 'In Stock', '2026-03-30', 31.50, '2026-04-29'),
(44, 705, 50, 'In Stock', '2026-03-30', 31.50, '2026-04-29'),
(45, 706, 50, 'In Stock', '2026-03-30', 24.50, '2026-04-29'),
(46, 707, 50, 'In Stock', '2026-03-30', 38.50, '2026-04-29'),
(47, 708, 50, 'In Stock', '2026-03-30', 28.00, '2026-04-29'),
(48, 801, 50, 'In Stock', '2026-03-30', 31.50, '2026-04-29'),
(49, 802, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(50, 803, 50, 'In Stock', '2026-03-30', 17.50, '2026-04-29'),
(51, 804, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(52, 805, 50, 'In Stock', '2026-03-30', 7.00, '2026-04-29'),
(53, 901, 50, 'In Stock', '2026-03-30', 3.50, '2026-04-29'),
(54, 902, 50, 'In Stock', '2026-03-30', 3.50, '2026-04-29'),
(55, 903, 50, 'In Stock', '2026-03-30', 3.50, '2026-04-29'),
(56, 904, 50, 'In Stock', '2026-03-30', 3.50, '2026-04-29'),
(57, 905, 50, 'In Stock', '2026-03-30', 31.50, '2026-04-29'),
(58, 906, 50, 'In Stock', '2026-03-30', 0.70, '2026-04-29'),
(59, 1001, 50, 'In Stock', '2026-03-30', 8.40, '2026-04-29'),
(60, 1002, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(61, 1003, 50, 'In Stock', '2026-03-30', 24.50, '2026-04-29'),
(62, 1004, 50, 'In Stock', '2026-03-30', 10.50, '2026-04-29'),
(64, 202, -1, 'Sold', '2026-03-30', 4.90, '2026-04-29'),
(65, 101, -1, 'Sold', '2026-03-30', 56.00, '2026-04-29'),
(66, 102, -1, 'Sold', '2026-03-30', 49.00, '2026-04-29'),
(67, 101, -1, 'Sold', '2026-03-30', 56.00, '2026-04-29'),
(68, 102, -1, 'Sold', '2026-03-30', 49.00, '2026-04-29'),
(69, 103, -1, 'Sold', '2026-03-30', 42.00, '2026-04-29'),
(70, 202, -2, 'Sold', '2026-03-30', 4.90, '2026-04-29'),
(71, 102, -1, 'Sold', '2026-03-30', 49.00, '2026-04-29'),
(72, 301, -1, 'Sold', '2026-03-30', 31.50, '2026-04-29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Oder_ID` int(11) NOT NULL,
  `Users_ID` varchar(20) DEFAULT NULL,
  `Oder_type` varchar(50) DEFAULT NULL,
  `Oder_date` date DEFAULT NULL,
  `Users_total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Oder_ID`, `Users_ID`, `Oder_type`, `Oder_date`, `Users_total`) VALUES
(2, 'EMP-001', 'POS', '2026-03-29', 77.00),
(3, 'EMP-001', 'POS', '2026-03-29', 41.00),
(4, 'EMP-001', 'POS', '2026-03-29', 35.00),
(5, 'EMP-001', 'POS', '2026-03-29', 165.00),
(6, 'EMP-001', 'POS', '2026-03-29', 54.00),
(7, 'EMP-001', 'POS', '2026-03-29', 167.00),
(8, 'EMP-001', 'Delivery', '2026-03-29', 230.00),
(9, 'EMP-001', 'POS', '2026-03-30', 70.00),
(10, 'EMP-001', 'POS', '2026-03-30', 255.00),
(11, 'EMP-001', 'POS', '2026-03-30', 21.00),
(12, 'EMP-001', 'Delivery', '2026-03-30', 305.00),
(15, 'USR-101', 'Delivery', '2026-03-30', 84.00),
(16, 'EMP-001', 'POS', '2026-03-30', 7.00),
(17, 'USR-104', 'Delivery', '2026-03-30', 160.00),
(18, 'USR-105', 'Delivery', '2026-03-30', 84.00),
(19, 'EMP-001', 'POS', '2026-03-30', 7.00),
(20, 'EMP-001', 'POS', '2026-03-30', 14.00),
(21, 'EMP-001', 'POS', '2026-03-30', 7.00),
(22, 'EMP-001', 'POS', '2026-03-30', 20.00),
(23, 'EMP-001', 'Delivery', '2026-03-30', 100.00),
(24, 'EMP-001', 'POS', '2026-03-30', 14.00),
(25, 'USR-102', 'Delivery', '2026-03-30', 160.00),
(26, 'EMP-001', 'POS', '2026-03-30', 7.00),
(27, 'EMP-001', 'POS', '2026-03-30', 150.00),
(28, 'USR-101', 'Delivery', '2026-03-30', 240.00),
(29, 'EMP-001', 'Delivery', '2026-03-30', 159.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_process`
--

CREATE TABLE `order_process` (
  `ID` int(11) NOT NULL,
  `Oder_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_process`
--

INSERT INTO `order_process` (`ID`, `Oder_ID`, `Product_ID`, `Quantity`) VALUES
(2, 2, 201, 1),
(4, 3, 201, 2),
(11, 9, 401, 1),
(13, 10, 101, 1),
(15, 11, 201, 1),
(17, 12, 101, 2),
(19, 15, 201, 1),
(20, 15, 202, 1),
(21, 15, 401, 2),
(22, 16, 202, 1),
(23, 17, 102, 1),
(24, 17, 103, 1),
(25, 18, 401, 2),
(26, 18, 202, 2),
(27, 19, 203, 1),
(28, 20, 203, 2),
(29, 21, 203, 1),
(30, 22, 402, 1),
(31, 23, 102, 1),
(32, 24, 201, 1),
(33, 24, 202, 1),
(34, 25, 103, 1),
(35, 25, 102, 1),
(36, 26, 202, 1),
(37, 27, 101, 1),
(38, 27, 102, 1),
(39, 28, 101, 1),
(40, 28, 102, 1),
(41, 28, 103, 1),
(42, 29, 202, 2),
(43, 29, 102, 1),
(44, 29, 301, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Oder_ID` int(11) DEFAULT NULL,
  `Payment_date` date DEFAULT NULL,
  `Total_amount` decimal(10,2) DEFAULT NULL,
  `Payment_method` varchar(50) DEFAULT NULL,
  `Payment_status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Oder_ID`, `Payment_date`, `Total_amount`, `Payment_method`, `Payment_status`) VALUES
(1, 15, '2026-03-30', 84.00, 'QR', 'Paid'),
(2, 16, '2026-03-30', 7.00, 'Cash', 'Paid'),
(3, 17, '2026-03-30', 160.00, 'QR', 'Paid'),
(4, 18, '2026-03-30', 84.00, 'QR', 'Paid'),
(5, 19, '2026-03-30', 7.00, 'Cash', 'Paid'),
(6, 20, '2026-03-30', 14.00, 'สแกนจ่าย', 'Paid'),
(7, 21, '2026-03-30', 7.00, 'เงินสด', 'Paid'),
(8, 22, '2026-03-30', 20.00, 'สแกนจ่าย', 'Paid'),
(9, 23, '2026-03-30', 100.00, 'สแกนจ่าย', 'Paid'),
(10, 24, '2026-03-30', 14.00, 'สแกนจ่าย', 'Paid'),
(11, 25, '2026-03-30', 160.00, 'สแกนจ่าย', 'Paid'),
(12, 26, '2026-03-30', 7.00, 'เงินสด', 'Paid'),
(13, 27, '2026-03-30', 150.00, 'เงินสด', 'Paid'),
(14, 28, '2026-03-30', 240.00, 'เก็บเงินปลายทาง', 'Paid'),
(15, 29, '2026-03-30', 159.00, 'สแกนจ่าย', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Product_name` varchar(255) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Product_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Category_ID`, `Product_name`, `Price`, `Product_image`) VALUES
(101, 1, 'เนื้อหมูสไลด์', 80.00, 'fa-bacon'),
(102, 1, 'เนื้อหมูบด', 70.00, 'fa-burger'),
(103, 1, 'เนื้ออกไก่ชิ้น', 60.00, 'fa-drumstick-bite'),
(201, 2, 'มาม่ารสต้มยำน้ำข้น', 7.00, 'fa-bowl-food'),
(202, 2, 'มาม่ารสหมูสับ', 7.00, 'fa-bowl-food'),
(203, 2, 'ไวไวหมูสับ', 7.00, 'fa-bowl-food'),
(204, 2, 'มาม่าOKรสไข่เค็ม', 15.00, 'fa-bowl-food'),
(301, 3, 'ไก่ห่อสาหร่าย CP', 45.00, 'fa-snowflake'),
(302, 3, 'นักเก็ตไก่ CP', 45.00, 'fa-snowflake'),
(303, 3, 'เฟรนฟรายแช่แข็ง', 50.00, 'fa-snowflake'),
(401, 4, 'เลย์รสโนริสาหร่าย 50ก.', 20.00, 'fa-cookie-bite'),
(402, 4, 'เลย์รสซาวครีม 50ก.', 20.00, 'fa-cookie-bite'),
(403, 4, 'เลย์รสโนริสาหร่าย 180ก.', 52.00, 'fa-cookie-bite'),
(404, 4, 'สแน็คแจ็ค', 20.00, 'fa-cookie-bite'),
(405, 4, 'ชีโตส', 20.00, 'fa-cookie-bite'),
(406, 4, 'ซันไบทส์', 20.00, 'fa-cookie-bite'),
(407, 4, 'โอริโอ้', 10.00, 'fa-cookie'),
(408, 4, 'เฮอร์ชี่ดาร์คช็อคโกแลต', 15.00, 'fa-candy-cane'),
(409, 4, 'คิทแคท', 32.00, 'fa-candy-cane'),
(410, 4, 'ไอศกรีมไมโล', 15.00, 'fa-ice-cream'),
(411, 4, 'ไอศกรีมวอลล์ท็อปเทน', 20.00, 'fa-ice-cream'),
(501, 5, 'Coke Zero', 16.00, 'fa-bottle-droplet'),
(502, 5, 'Pepsi', 16.00, 'fa-bottle-droplet'),
(503, 5, 'Fanta รสส้ม', 15.00, 'fa-glass-water'),
(504, 5, 'Fanta รสองุ่น', 15.00, 'fa-glass-water'),
(505, 5, 'Oishi น้ำผึ้งมะนาว', 20.00, 'fa-bottle-water'),
(506, 5, 'Oishi ต้นตำรับ', 20.00, 'fa-bottle-water'),
(507, 5, 'น้ำมะพร้าว If', 25.00, 'fa-bottle-water'),
(508, 5, 'กาแฟลาเต้กระป๋อง', 15.00, 'fa-mug-hot'),
(509, 5, 'C-vit เลมอน', 16.00, 'fa-bottle-droplet'),
(601, 6, 'ผงซักฟอกบรีส 180ก.', 25.00, 'fa-box-open'),
(602, 6, 'ผงซักฟอกบรีส 900ก.', 90.00, 'fa-box-open'),
(603, 6, 'ผงซักฟอกเปา 250ก.', 30.00, 'fa-box-open'),
(604, 6, 'น้ำยาล้างจานซันไลต์', 20.00, 'fa-pump-soap'),
(605, 6, 'น้ำยาล้างจานทีโพล์', 20.00, 'fa-pump-soap'),
(606, 6, 'น้ำยาปรับผ้านุ่ม Downy', 20.00, 'fa-bottle-droplet'),
(607, 6, 'น้ำยาปรับผ้านุ่ม Fineline', 20.00, 'fa-bottle-droplet'),
(608, 6, 'น้ำยาปรับผ้านุ่ม Hygiene', 20.00, 'fa-bottle-droplet'),
(609, 6, 'น้ำยาล้างห้องน้ำ', 45.00, 'fa-spray-can'),
(701, 7, 'สบู่ Lux', 15.00, 'fa-soap'),
(702, 7, 'สบู่ Protect', 15.00, 'fa-soap'),
(703, 7, 'สบู่นกแก้ว', 15.00, 'fa-soap'),
(704, 7, 'ยาสีฟันดอกบัวคู่', 45.00, 'fa-tooth'),
(705, 7, 'ยาสีฟันคอลเกต', 45.00, 'fa-tooth'),
(706, 7, 'แชมพู', 35.00, 'fa-pump-soap'),
(707, 7, 'ครีมอาบน้ำ', 55.00, 'fa-pump-soap'),
(708, 7, 'ผ้าอนามัย Sofy', 40.00, 'fa-box'),
(801, 8, 'ถ่านก้อน', 45.00, 'fa-battery-full'),
(802, 8, 'ทิชชู่', 15.00, 'fa-toilet-paper'),
(803, 8, 'กรรไกร', 25.00, 'fa-scissors'),
(804, 8, 'กาวลาเท็กซ์', 15.00, 'fa-fill-drip'),
(805, 8, 'เทปใส', 10.00, 'fa-tape'),
(901, 9, 'ปากกาน้ำเงิน', 5.00, 'fa-pen'),
(902, 9, 'ปากกาแดง', 5.00, 'fa-pen'),
(903, 9, 'ปากกาดำ', 5.00, 'fa-pen'),
(904, 9, 'ดินสอ', 5.00, 'fa-pencil'),
(905, 9, 'สีไม้', 45.00, 'fa-palette'),
(906, 9, 'กระดาษ A4', 1.00, 'fa-file'),
(1001, 10, 'พาราเซตามอล', 12.00, 'fa-pills'),
(1002, 10, 'ยาแก้ท้องเสีย', 15.00, 'fa-capsules'),
(1003, 10, 'เบตาดีน', 35.00, 'fa-prescription-bottle-medical'),
(1004, 10, 'แอลกอฮอล์ล้างแผล', 15.00, 'fa-bottle-droplet');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL,
  `Users_ID` varchar(20) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Review_date` date DEFAULT NULL,
  `Review_text` text DEFAULT NULL,
  `Review_rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`Review_ID`, `Users_ID`, `Product_ID`, `Review_date`, `Review_text`, `Review_rating`) VALUES
(7, 'USR-101', 201, '2026-03-30', 'ดี', 4),
(8, 'USR-102', 102, '2026-03-30', 'ดีมาก', 5),
(9, 'EMP-001', 301, '2026-03-30', 'ส่งไวมาก', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Users_ID` varchar(20) NOT NULL,
  `Firstname` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `Users_name` varchar(100) DEFAULT NULL,
  `Phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Users_ID`, `Firstname`, `Lastname`, `Users_name`, `Phone_number`) VALUES
('EMP-001', 'สมหมาย', 'ขายดี', 'sommai_k', '0811111111'),
('USR-101', 'ลูกค้า', 'ประจำ', 'customer_1', '0922222222'),
('USR-102', 'DEVID', 'ADERRSON', 'devid', '0983456789'),
('USR-104', 'SUKI', 'AROIMAK', 'suki', '0981234567'),
('USR-105', 'ิbenjamin', 'tenison', 'ิbenjamin', '0988765432');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`),
  ADD KEY `Users_ID` (`Users_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Delivery_ID`),
  ADD KEY `Address_ID` (`Address_ID`),
  ADD KEY `Oder_ID` (`Oder_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`Inventory_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Oder_ID`),
  ADD KEY `Users_ID` (`Users_ID`);

--
-- Indexes for table `order_process`
--
ALTER TABLE `order_process`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Oder_ID` (`Oder_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Oder_ID` (`Oder_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `Users_ID` (`Users_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Users_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `Delivery_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `Inventory_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Oder_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_process`
--
ALTER TABLE `order_process`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`Users_ID`) REFERENCES `users` (`Users_ID`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`Oder_ID`) REFERENCES `orders` (`Oder_ID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Users_ID`) REFERENCES `users` (`Users_ID`);

--
-- Constraints for table `order_process`
--
ALTER TABLE `order_process`
  ADD CONSTRAINT `order_process_ibfk_1` FOREIGN KEY (`Oder_ID`) REFERENCES `orders` (`Oder_ID`),
  ADD CONSTRAINT `order_process_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Oder_ID`) REFERENCES `orders` (`Oder_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Users_ID`) REFERENCES `users` (`Users_ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
