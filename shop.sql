-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2019 at 04:02 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `fname` varchar(35) DEFAULT NULL,
  `lname` varchar(35) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` char(10) NOT NULL,
  `alt_mobile` char(10) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(700) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `last_login` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `fname`, `lname`, `gender`, `age`, `email`, `mobile`, `alt_mobile`, `username`, `password`, `address`, `last_login`) VALUES
(19, 'Kamal', 'Sharma', 'Male', '23', 'kamalsharma.124@gmail.com', '8376100923', '9274538434', 'kamalbhai', '440f5c870c4f738892e9a65ac9e373f5c88ef5c8740f5c870c4f738892e9a65ac9e373f5c88ec4f738892e9a65ac9e373f5c88e', '102,C,Rushikesh Apartment, savarkar Road,Virar west , mumbai 400046', '28-Feb 2019 , 09:39:14 PM'),
(20, 'Zainul', 'Shaikh', 'Male', '19', 'zainul@gmail.com', '8376100923', '6846562846', 'zainulbhai', '6178666178784f6178666178784f06178226a09785d589d369856a96178226a6178666178784f06178226a09785d589d369856a99785d589d369856a9', '506,A,Rajkamal Apartment,Savitribai Road,Vadala west,mumbai 400057', '09-Mar 2019 , 12:31:05 PM');

-- --------------------------------------------------------

--
-- Table structure for table `customer_cart`
--

CREATE TABLE `customer_cart` (
  `product_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `item_count` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_weight` varchar(100) DEFAULT NULL,
  `product_price` decimal(50,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_mapping`
--

CREATE TABLE `customer_order_mapping` (
  `order_id` varchar(20) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `order_time` varchar(50) DEFAULT NULL,
  `delivery_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order_mapping`
--

INSERT INTO `customer_order_mapping` (`order_id`, `cust_id`, `order_time`, `delivery_status`) VALUES
('53CFZ6B2SGD55TKW', 20, '09-Mar-2019 | 12:32:52 PM', 'Delivered'),
('9P7VMSQMYE601QA6', 19, '28-Feb-2019 | 09:40:43 PM', 'Undelivered');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` varchar(20) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `item_count` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_weight` varchar(100) NOT NULL,
  `product_price` decimal(50,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `item_count`, `product_name`, `product_weight`, `product_price`) VALUES
('9P7VMSQMYE601QA6', 100012, 4, 'Pista Lounge', '250 gm', '2400.00'),
('9P7VMSQMYE601QA6', 27135, 10, 'Pure Walnut', '250 gm', '4500.00'),
('9P7VMSQMYE601QA6', 100006, 1, 'Khajur Ladoo', '250 gm', '300.00'),
('53CFZ6B2SGD55TKW', 334566, 13, 'Motichur Laddu', '250 gm', '2275.00'),
('53CFZ6B2SGD55TKW', 45454, 2, 'Elichi 7mm', '250 gm', '900.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` decimal(15,2) NOT NULL,
  `product_weight` varchar(50) NOT NULL,
  `product_file` varchar(255) NOT NULL,
  `product_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `product_price`, `product_weight`, `product_file`, `product_path`) VALUES
(12109, 'Mix Dryfruit', '300.00', '250 gm', 'Mix Dryfruit.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Mix Dryfruit.jpg'),
(20222, 'Apricot', '150.00', '250 gm', 'Apricot.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Apricot.jpg'),
(20223, 'Dried Apricot', '225.00', '250 gm', 'Dried Apricot.png', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Dried Apricot.png'),
(27135, 'Pure Walnut', '450.00', '250 gm', 'Pure Walnut.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Pure Walnut.jpg'),
(30000, 'Kismis', '100.00', '250 gm', 'Kismis.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Kismis.jpg'),
(30001, 'Black Kismis', '120.00', '250 gm', 'Black Kismis.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Black Kismis.jpg'),
(45454, 'Elichi 7mm', '450.00', '250 gm', 'Elichi 7mm.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Elichi 7mm.jpg'),
(50000, 'Akkha Akhrot', '150.00', '200 gm', 'Akkha Akhrot.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Akkha Akhrot.jpg'),
(50444, 'Elichi 8mm', '500.00', '250 gm', 'Elichi 8mm.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Elichi 8mm.jpg'),
(70778, 'Pista', '300.00', '250 gm', 'Pista.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Pista.jpg'),
(70779, 'Pisori Pista', '360.00', '200 gm', 'Pisori Pista.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Pisori Pista.jpg'),
(77777, 'Arabian Dates', '65.00', '250 gm', 'Arabian Dates.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Arabian Dates.jpg'),
(77778, 'Black Ajwa Dates', '150.00', '250 gm', 'Black Ajwa Dates.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Black Ajwa Dates.jpg'),
(85003, 'Pure Almonds', '180.00', '250 gm', 'Pure Almonds.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Pure Almonds.jpg'),
(85004, 'Afghani Anjeer', '425.00', '250 gm', 'Afghani Anjeer.jpg', 'C:UsersViralDocumentsNetBeansProjectsMyApplicationwebImgAfghani Anjeer.jpg'),
(85006, 'Roasted Almonds', '400.00', '250 gm', 'Roasted Almonds.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Roasted Almonds.jpg'),
(85009, 'Pure Almonds', '375.00', '500 gm', 'Pure Almonds.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Pure Almonds.jpg'),
(85020, 'Salted Almonds', '350.00', '250 gm', 'Salted Almonds.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Salted Almonds.jpg'),
(88788, 'American Almond', '225.00', '250 gm', 'American Almond.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\American Almond.jpg'),
(88911, 'Kaju Small', '180.00', '250 gm', 'Kaju Small.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Kaju Small.jpg'),
(88912, 'Kaju Medium', '240.00', '250 gm', 'Kaju Medium.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Kaju Medium.jpg'),
(88915, 'Tukdha Kaju', '175.00', '250 gm', 'Tukdha Kaju.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Tukdha Kaju.jpg'),
(88916, 'Kaju Tukdha', '210.00', '250 gm', 'Kaju Tukdha.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Kaju Tukdha.jpg'),
(88917, 'Kaju Big', '280.00', '250 gm', 'Kaju Big.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Kaju Big.jpg'),
(88923, 'Goa Kaju', '300.00', '250 gm', 'Goa Kaju.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Goa Kaju.jpg'),
(88927, 'Masala Kaju', '325.00', '200 gm', 'Masala Kaju.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Masala Kaju.jpg'),
(96800, 'SP. Mamra Badam', '550.00', '200 gm', 'SP. Mamra Badam.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\SP. Mamra Badam.jpg'),
(100001, 'Badam Roll', '300.00', '250 gm', 'Badam Roll.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Badam Roll.jpg'),
(100002, 'Besan Ladoo', '125.00', '250 gm', 'Besan Ladoo.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Besan Ladoo.jpg'),
(100003, 'Kesar Penda', '150.00', '250 gm', 'Kesar Penda.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Kesar Penda.jpg'),
(100006, 'Khajur Ladoo', '300.00', '250 gm', 'Khajur Ladoo.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Khajur Ladoo.jpg'),
(100007, 'Dryfruit Barfi', '360.00', '250 gm', 'Dryfruit Barfi.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Dryfruit Barfi.jpg'),
(100008, 'Low Sugar Mithai', '400.00', '250 gm', 'Low Sugar Mithai.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Low Sugar Mithai.jpg'),
(100009, 'Kesar Badam Pista Ghari', '475.00', '250 gm', 'Kesar Badam Pista Ghari.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Kesar Badam Pista Ghari.jpg'),
(100010, 'Son Papdi', '90.00', '250 gm', 'Son Papdi.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Son Papdi.jpg'),
(100011, 'Dryfruit Halwa', '400.00', '250 gm', 'Dryfruit Halwa.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Dryfruit Halwa.jpg'),
(100012, 'Pista Lounge', '600.00', '250 gm', 'Pista Lounge.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Pista Lounge.jpg'),
(100015, 'Badam Rocher', '400.00', '250 gm', 'Badam Rocher.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Badam Rocher.jpg'),
(100016, 'Mohanthal', '250.00', '500 gm', 'Mohanthal.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Mohanthal.jpg'),
(100017, 'Mesub Pak', '160.00', '250 gm', 'Mesub Pak.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Mesub Pak.jpg'),
(100018, 'Khajoor Roll', '400.00', '250 gm', 'Khajoor Roll.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Khajoor Roll.jpg'),
(100020, 'Gulab Jamun', '90.00', '6 unit', 'Gulab Jamun.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Gulab Jamun.jpg'),
(102821, 'Dryfruit Kaju Katri', '550.00', '250 gm', 'Dryfruit Kaju Katri.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Dryfruit Kaju Katri.jpg'),
(102899, 'Dryfruit Ice Halwa', '350.00', '250 gm', 'Dryfruit Ice Halwa.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Dryfruit Ice Halwa.jpg'),
(110120, 'Rasgulla', '72.00', '6 unit', 'Rasgulla.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Rasgulla.jpg'),
(110320, 'Churma Ladoo', '200.00', '250 gm', 'Churma Ladoo.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Churma Ladoo.jpg'),
(334566, 'Motichur Laddu', '175.00', '250 gm', 'Motichur Laddu.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Motichur Laddu.jpg'),
(334568, 'Orange Khajoor', '375.00', '250 gm', 'Orange Khajoor.jpg', 'C:\\Users\\Viral\\Documents\\NetBeansProjects\\MyApplication\\web\\Img\\Orange Khajoor.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password` (`password`);

--
-- Indexes for table `customer_cart`
--
ALTER TABLE `customer_cart`
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `customer_order_mapping`
--
ALTER TABLE `customer_order_mapping`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_cart`
--
ALTER TABLE `customer_cart`
  ADD CONSTRAINT `customer_cart_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_order_mapping` (`order_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
