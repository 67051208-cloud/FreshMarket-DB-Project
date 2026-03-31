-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql301.infinityfree.com
-- Generation Time: Mar 31, 2026 at 08:26 AM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_41515479_freshmarket`
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
(1, 'user-102', '.', '.', '.', '.', '.', '.'),
(2, 'user-102', 'i', 'i', 'i', 'i', 'i', 'i'),
(3, 'user-102', 'i', 'i', 'i', 'i', 'i', 'i');

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
(4, 'ขนมขบเคี้ยว'),
(5, 'เครื่องดื่ม'),
(6, 'ของใช้ในบ้าน'),
(7, 'ของใช้ส่วนตัว'),
(8, 'ของใช้เบ็ดเตล็ด'),
(9, 'เครื่องเขียน'),
(10, 'ยาสามัญประจำบ้าน');

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
(1, 1, 3, 'TRACK-3010', 'Pending', '2026-03-31'),
(2, 2, 4, 'TRACK-1860', 'Pending', '2026-03-31'),
(3, 3, 5, 'TRACK-8434', 'Pending', '2026-03-31');

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
(12, 101, 50, 'In Stock', '2026-03-31', '60.00', '2026-05-15'),
(13, 102, 50, 'In Stock', '2026-03-31', '50.00', '2026-05-12'),
(14, 103, 50, 'In Stock', '2026-03-31', '45.00', '2026-05-10'),
(15, 201, 50, 'In Stock', '2026-03-31', '5.00', '2027-01-20'),
(16, 202, 50, 'In Stock', '2026-03-31', '5.00', '2027-02-15'),
(17, 203, 50, 'In Stock', '2026-03-31', '5.00', '2027-01-10'),
(18, 204, 50, 'In Stock', '2026-03-31', '11.00', '2027-03-05'),
(19, 301, 50, 'In Stock', '2026-03-31', '35.00', '2026-12-01'),
(20, 302, 50, 'In Stock', '2026-03-31', '35.00', '2026-11-15'),
(21, 303, 50, 'In Stock', '2026-03-31', '38.00', '2026-10-20'),
(22, 401, 50, 'In Stock', '2026-03-31', '15.00', '2026-09-10'),
(23, 402, 50, 'In Stock', '2026-03-31', '15.00', '2026-09-10'),
(24, 403, 50, 'In Stock', '2026-03-31', '38.00', '2026-08-25'),
(25, 404, 50, 'In Stock', '2026-03-31', '15.00', '2026-10-05'),
(26, 405, 50, 'In Stock', '2026-03-31', '15.00', '2026-11-20'),
(27, 406, 50, 'In Stock', '2026-03-31', '15.00', '2026-12-15'),
(28, 407, 50, 'In Stock', '2026-03-31', '7.50', '2027-04-10'),
(29, 408, 50, 'In Stock', '2026-03-31', '10.00', '2027-05-01'),
(30, 409, 50, 'In Stock', '2026-03-31', '24.00', '2027-06-15'),
(31, 410, 50, 'In Stock', '2026-03-31', '10.00', '2026-08-10'),
(32, 411, 50, 'In Stock', '2026-03-31', '15.00', '2026-07-20'),
(33, 501, 50, 'In Stock', '2026-03-31', '12.00', '2027-01-05'),
(34, 502, 50, 'In Stock', '2026-03-31', '12.00', '2027-02-10'),
(35, 503, 50, 'In Stock', '2026-03-31', '11.00', '2027-03-15'),
(36, 504, 50, 'In Stock', '2026-03-31', '11.00', '2027-04-20'),
(37, 505, 50, 'In Stock', '2026-03-31', '15.00', '2026-10-10'),
(38, 506, 50, 'In Stock', '2026-03-31', '15.00', '2026-11-11'),
(39, 507, 50, 'In Stock', '2026-03-31', '18.00', '2026-09-05'),
(40, 508, 50, 'In Stock', '2026-03-31', '11.00', '2027-05-25'),
(41, 509, 50, 'In Stock', '2026-03-31', '12.00', '2026-12-30'),
(42, 601, 50, 'In Stock', '2026-03-31', '18.00', '2028-01-01'),
(43, 602, 50, 'In Stock', '2026-03-31', '70.00', '2028-02-01'),
(44, 603, 50, 'In Stock', '2026-03-31', '22.00', '2028-03-01'),
(45, 604, 50, 'In Stock', '2026-03-31', '15.00', '2027-10-10'),
(46, 605, 50, 'In Stock', '2026-03-31', '15.00', '2027-11-15'),
(47, 606, 50, 'In Stock', '2026-03-31', '15.00', '2027-12-20'),
(48, 607, 50, 'In Stock', '2026-03-31', '15.00', '2028-01-25'),
(49, 608, 50, 'In Stock', '2026-03-31', '15.00', '2028-02-28'),
(50, 609, 50, 'In Stock', '2026-03-31', '32.00', '2028-05-15'),
(51, 701, 50, 'In Stock', '2026-03-31', '10.00', '2028-06-10'),
(52, 702, 50, 'In Stock', '2026-03-31', '10.00', '2028-07-15'),
(53, 703, 50, 'In Stock', '2026-03-31', '10.00', '2028-08-20'),
(54, 704, 50, 'In Stock', '2026-03-31', '32.00', '2027-05-05'),
(55, 705, 50, 'In Stock', '2026-03-31', '32.00', '2027-06-10'),
(56, 706, 50, 'In Stock', '2026-03-31', '25.00', '2028-01-15'),
(57, 707, 50, 'In Stock', '2026-03-31', '40.00', '2028-02-20'),
(58, 708, 50, 'In Stock', '2026-03-31', '28.00', '2028-09-10'),
(59, 801, 50, 'In Stock', '2026-03-31', '30.00', '2029-01-01'),
(60, 802, 50, 'In Stock', '2026-03-31', '10.00', '2029-12-31'),
(61, 803, 50, 'In Stock', '2026-03-31', '15.00', '2030-01-01'),
(62, 804, 50, 'In Stock', '2026-03-31', '10.00', '2027-08-15'),
(63, 805, 50, 'In Stock', '2026-03-31', '6.00', '2028-08-20'),
(64, 901, 50, 'In Stock', '2026-03-31', '3.00', '2029-01-01'),
(65, 902, 50, 'In Stock', '2026-03-31', '3.00', '2029-01-01'),
(66, 903, 50, 'In Stock', '2026-03-31', '3.00', '2029-01-01'),
(67, 904, 50, 'In Stock', '2026-03-31', '3.00', '2029-01-01'),
(68, 905, 50, 'In Stock', '2026-03-31', '32.00', '2030-01-01'),
(69, 906, 50, 'In Stock', '2026-03-31', '0.50', '2035-01-01'),
(70, 1001, 50, 'In Stock', '2026-03-31', '8.00', '2027-05-10'),
(71, 1002, 50, 'In Stock', '2026-03-31', '10.00', '2027-06-15'),
(72, 1003, 50, 'In Stock', '2026-03-31', '25.00', '2028-02-20'),
(73, 1004, 50, 'In Stock', '2026-03-31', '10.00', '2028-03-25'),
(74, 303, -1, 'Sold', '2026-03-31', NULL, NULL),
(75, 402, -1, 'Sold', '2026-03-31', NULL, NULL);

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
(1, 'user-101', 'POS', '2026-03-31', '70.00'),
(2, 'user-101', 'POS', '2026-03-31', '110.00'),
(3, 'user-102', 'Delivery', '2026-03-31', '120.00'),
(4, 'user-102', 'Delivery', '2026-03-31', '100.00'),
(5, 'user-102', 'Delivery', '2026-03-31', '100.00'),
(6, 'user-101', 'POS', '2026-03-31', '70.00');

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
(12, 6, 303, 1),
(13, 6, 402, 1);

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
(1, 1, '2026-03-31', '70.00', 'เงินสด', 'Paid'),
(2, 2, '2026-03-31', '110.00', 'เงินสด', 'Paid'),
(3, 3, '2026-03-31', '120.00', 'เก็บเงินปลายทาง', 'Paid'),
(4, 4, '2026-03-31', '100.00', 'สแกนจ่าย', 'Paid'),
(5, 5, '2026-03-31', '100.00', 'สแกนจ่าย', 'Paid'),
(6, 6, '2026-03-31', '70.00', 'เงินสด', 'Paid');

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
(101, 1, 'เนื้อหมูสไลด์', '80.00', 'fa-bacon'),
(102, 1, 'เนื้อหมูบด', '70.00', 'fa-burger'),
(103, 1, 'เนื้ออกไก่ชิ้น', '60.00', 'fa-drumstick-bite'),
(201, 2, 'มาม่ารสต้มยำน้ำข้น', '7.00', 'fa-bowl-food'),
(202, 2, 'มาม่ารสหมูสับ', '7.00', 'fa-bowl-food'),
(203, 2, 'ไวไวหมูสับ', '7.00', 'fa-bowl-food'),
(204, 2, 'มาม่าOKรสไข่เค็ม', '15.00', 'fa-bowl-food'),
(301, 3, 'ไก่ห่อสาหร่าย CP', '45.00', 'fa-snowflake'),
(302, 3, 'นักเก็ตไก่ CP', '45.00', 'fa-snowflake'),
(303, 3, 'เฟรนฟรายแช่แข็ง', '50.00', 'fa-snowflake'),
(401, 4, 'เลย์รสโนริสาหร่าย 50ก.', '20.00', 'fa-cookie-bite'),
(402, 4, 'เลย์รสซาวครีม 50ก.', '20.00', 'fa-cookie-bite'),
(403, 4, 'เลย์รสโนริสาหร่าย 180ก.', '52.00', 'fa-cookie-bite'),
(404, 4, 'สแน็คแจ็ค', '20.00', 'fa-cookie-bite'),
(405, 4, 'ชีโตส', '20.00', 'fa-cookie-bite'),
(406, 4, 'ซันไบทส์', '20.00', 'fa-cookie-bite'),
(407, 4, 'โอริโอ้', '10.00', 'fa-cookie'),
(408, 4, 'เฮอร์ชี่ดาร์คช็อคโกแลต', '15.00', 'fa-candy-cane'),
(409, 4, 'คิทแคท', '32.00', 'fa-candy-cane'),
(410, 4, 'ไอศกรีมไมโล', '15.00', 'fa-ice-cream'),
(411, 4, 'ไอศกรีมวอลล์ท็อปเทน', '20.00', 'fa-ice-cream'),
(501, 5, 'Coke Zero', '16.00', 'fa-bottle-droplet'),
(502, 5, 'Pepsi', '16.00', 'fa-bottle-droplet'),
(503, 5, 'Fanta รสส้ม', '15.00', 'fa-glass-water'),
(504, 5, 'Fanta รสองุ่น', '15.00', 'fa-glass-water'),
(505, 5, 'Oishi น้ำผึ้งมะนาว', '20.00', 'fa-bottle-water'),
(506, 5, 'Oishi ต้นตำรับ', '20.00', 'fa-bottle-water'),
(507, 5, 'น้ำมะพร้าว If', '25.00', 'fa-bottle-water'),
(508, 5, 'กาแฟลาเต้กระป๋อง', '15.00', 'fa-mug-hot'),
(509, 5, 'C-vit เลมอน', '16.00', 'fa-bottle-droplet'),
(601, 6, 'ผงซักฟอกบรีส 180ก.', '25.00', 'fa-box-open'),
(602, 6, 'ผงซักฟอกบรีส 900ก.', '90.00', 'fa-box-open'),
(603, 6, 'ผงซักฟอกเปา 250ก.', '30.00', 'fa-box-open'),
(604, 6, 'น้ำยาล้างจานซันไลต์', '20.00', 'fa-pump-soap'),
(605, 6, 'น้ำยาล้างจานทีโพล์', '20.00', 'fa-pump-soap'),
(606, 6, 'น้ำยาปรับผ้านุ่ม Downy', '20.00', 'fa-bottle-droplet'),
(607, 6, 'น้ำยาปรับผ้านุ่ม Fineline', '20.00', 'fa-bottle-droplet'),
(608, 6, 'น้ำยาปรับผ้านุ่ม Hygiene', '20.00', 'fa-bottle-droplet'),
(609, 6, 'น้ำยาล้างห้องน้ำ', '45.00', 'fa-spray-can'),
(701, 7, 'สบู่ Lux', '15.00', 'fa-soap'),
(702, 7, 'สบู่ Protect', '15.00', 'fa-soap'),
(703, 7, 'สบู่นกแก้ว', '15.00', 'fa-soap'),
(704, 7, 'ยาสีฟันดอกบัวคู่', '45.00', 'fa-tooth'),
(705, 7, 'ยาสีฟันคอลเกต', '45.00', 'fa-tooth'),
(706, 7, 'แชมพู', '35.00', 'fa-pump-soap'),
(707, 7, 'ครีมอาบน้ำ', '55.00', 'fa-pump-soap'),
(708, 7, 'ผ้าอนามัย Sofy', '40.00', 'fa-box'),
(801, 8, 'ถ่านก้อน', '45.00', 'fa-battery-full'),
(802, 8, 'ทิชชู่', '15.00', 'fa-toilet-paper'),
(803, 8, 'กรรไกร', '25.00', 'fa-scissors'),
(804, 8, 'กาวลาเท็กซ์', '15.00', 'fa-fill-drip'),
(805, 8, 'เทปใส', '10.00', 'fa-tape'),
(901, 9, 'ปากกาน้ำเงิน', '5.00', 'fa-pen'),
(902, 9, 'ปากกาแดง', '5.00', 'fa-pen'),
(903, 9, 'ปากกาดำ', '5.00', 'fa-pen'),
(904, 9, 'ดินสอ', '5.00', 'fa-pencil'),
(905, 9, 'สีไม้', '45.00', 'fa-palette'),
(906, 9, 'กระดาษ A4', '1.00', 'fa-file'),
(1001, 10, 'พาราเซตามอล', '12.00', 'fa-pills'),
(1002, 10, 'ยาแก้ท้องเสีย', '15.00', 'fa-capsules'),
(1003, 10, 'เบตาดีน', '35.00', 'fa-prescription-bottle-medical'),
(1004, 10, 'แอลกอฮอล์ล้างแผล', '15.00', 'fa-bottle-droplet');

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
(3, 'user-102', 303, '2026-03-31', 'ส่งไวใช่เลย\n', 4);

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
('user-101', 'เซตาฟาน', 'สุดหล่อ', 'เซตาฟาน', '0982134587'),
('user-102', 'ยินดี', 'สุดหล่อ', 'ยินดี', '0984567892');

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
  MODIFY `Address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `Delivery_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `Inventory_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Oder_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_process`
--
ALTER TABLE `order_process`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
