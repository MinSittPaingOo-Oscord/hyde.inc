-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2025 at 12:48 PM
-- Server version: 8.0.33
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hyde`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `accountID` int NOT NULL,
  `name` varchar(1000) NOT NULL,
  `email` varchar(500) NOT NULL,
  `passcode` varchar(500) NOT NULL,
  `phoneNumber` varchar(500) NOT NULL,
  `registrationDate` date NOT NULL,
  `roleID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`accountID`, `name`, `email`, `passcode`, `phoneNumber`, `registrationDate`, `roleID`) VALUES
(1, 'Min Sitt', 'minsittmandalay137@gmail.com', '198989', '0823059272', '2025-07-23', 1),
(2, 'Vivian Nora', 'minsitt.p67@rsu.ac.th', '198989', '0823059272', '2025-07-23', 1),
(3, 'Jennifer Kyaw', 'nikkijen1411@gmail.com', '198989', '0823059272', '2025-07-23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressID` int NOT NULL,
  `address` longtext NOT NULL,
  `accountID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressID`, `address`, `accountID`) VALUES
(1, '20th street, between 86th and 87th street, Pa Lin Win Ward, Aung Myae Thar Zan Township, Mandalay', 1),
(2, 'Corner of 37th x 86th, Ma Har Aung Myae Township, Mandalay', 2),
(3, '17th street, between 88th and 89th street, Aung Myae Thar Zan Township, Mandalay', 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int NOT NULL,
  `categoryName` varchar(2000) NOT NULL,
  `parentID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`, `parentID`) VALUES
(1, 'MEN', NULL),
(2, 'WOMEN', NULL),
(3, 'Top Wear', NULL),
(4, 'Outer Wear', NULL),
(5, 'Pants', NULL),
(6, 'Jean Pants', 5),
(7, 'Tee', 3),
(8, 'Polo', 3),
(9, 'Shirt', 3),
(10, 'Jacket', 4),
(11, 'Short Pants', 5),
(12, 'Cargo Pants', 5),
(13, 'Hoodie', 4);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `colorID` int NOT NULL,
  `colorName` varchar(500) DEFAULT NULL,
  `colorCode` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`colorID`, `colorName`, `colorCode`) VALUES
(1, 'black', '#080201'),
(2, 'white', '#ffffff'),
(3, 'Oud', '#8a4553');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discountID` int NOT NULL,
  `range1` int NOT NULL,
  `range2` int NOT NULL,
  `discount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discountID`, `range1`, `range2`, `discount`) VALUES
(1, 10, 1000, 30);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` int NOT NULL,
  `orderStatus` varchar(1000) DEFAULT NULL,
  `totalCost` double NOT NULL,
  `orderDate` date NOT NULL,
  `paymentStatus` varchar(1000) DEFAULT NULL,
  `addressID` int NOT NULL,
  `accountID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `orderItemID` int NOT NULL,
  `productID` int NOT NULL,
  `quantity` bigint NOT NULL,
  `totalCost` double NOT NULL,
  `orderID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `photoID` int NOT NULL,
  `photoName` varchar(1000) NOT NULL,
  `productID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`photoID`, `photoName`, `productID`) VALUES
(1, 'p1_i1.jpg', 1),
(2, 'p1_i2.jpg', 1),
(3, 'p1_i3.jpg', 1),
(4, 'p1_i4.jpg', 1),
(5, 'p1_i5.jpg', 1),
(6, 'p1_i6.jpg', 1),
(7, 'p2_i1.jpg', 2),
(8, 'p2_i2.jpg', 2),
(9, 'p2_i3.jpg', 2),
(10, 'p3_i1.jpg', 3),
(11, 'p3_i2.jpg', 3),
(12, 'p3_i3.jpg', 3),
(13, 'p3_i4.jpg', 3),
(14, 'p4_i1.jpg', 4),
(15, 'p4_i2.jpg', 4),
(16, 'p4_i3.jpg', 4),
(17, 'p4_i4.jpg', 4),
(18, 'p4_i5.jpg', 4),
(19, 'p4_i6.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int NOT NULL,
  `productName` varchar(2000) NOT NULL,
  `price` double NOT NULL,
  `discountedPrice` double DEFAULT NULL,
  `postedDate` date NOT NULL,
  `productDescription` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `waitingWeek` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `price`, `discountedPrice`, `postedDate`, `productDescription`, `waitingWeek`) VALUES
(1, 'Iconic V3 sweatshirt', 165000, NULL, '2025-07-23', '- 370gsm heavyweight french terry \r\n- 370gsm 2x2 rib cuff & hem\r\n- 100% cotton body \r\n- 97% cotton 3% spandex rib\r\n- Loose fit and drop shoulder cut\r\n- DTG printed artwork on front & back\r\n- Playful, Fancy & Iconic silhouette ', 3),
(2, 'Classic Logo Skin-fit Top', 47500, NULL, '2025-07-22', 'Crafted from Heavyweight (240gsm) 94% Viscose, 6% Spandex mixed 4way stretchy fabric. Super Stretchy, Smooth & Soft like a butter. Printed our OG mini Classic logo on chest.\r\n', 3),
(3, 'Bones Hoodie', 185000, NULL, '2025-07-21', 'Null', 3),
(4, 'ORIGAMI FADED WASH JEANS', 165000, NULL, '2025-07-20', 'Crafted from midweight (12ounce) \r\n100% cotton Denim fabric featured \r\nwith a small details hardware access.\r\nWe\'re using stone washing techniques for \r\nDry & Faded look. Finishing with a silicone washed technique for more smooth & soft texture. Hand distressed details to every coner of hem & pockets. Traditional Jeans pattern but The Fit was different. Wide-fitted shape & Baggy look.\r\nVU leather tag on back. Streetwear silhouette. We\'re using imported fabric & hardware for this Jeans and Cut/Sewn in Thailand 🇹🇭 \r\nLIMITED QUANTITY AVAILABLE.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `productxcategory`
--

CREATE TABLE `productxcategory` (
  `prodcutxcategoryID` int NOT NULL,
  `productID` int NOT NULL,
  `categoryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productxcategory`
--

INSERT INTO `productxcategory` (`prodcutxcategoryID`, `productID`, `categoryID`) VALUES
(1, 3, 13),
(2, 4, 6),
(3, 2, 7),
(4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `relatedproduct`
--

CREATE TABLE `relatedproduct` (
  `relatedProductID` int NOT NULL,
  `productID1` int NOT NULL,
  `productID2` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `relatedproduct`
--

INSERT INTO `relatedproduct` (`relatedProductID`, `productID1`, `productID2`) VALUES
(1, 1, 3),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleID` int NOT NULL,
  `roleName` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `roleName`) VALUES
(1, 'admin'),
(2, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `sizeID` int NOT NULL,
  `sizeName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`sizeID`, `sizeName`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL'),
(5, 'XXL'),
(6, 'XXXL');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stockID` int NOT NULL,
  `quantity` bigint NOT NULL,
  `productID` int NOT NULL,
  `sizeID` int NOT NULL,
  `colorID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stockID`, `quantity`, `productID`, `sizeID`, `colorID`) VALUES
(1, 20, 1, 4, 1),
(2, 10, 1, 3, 1),
(3, 20, 3, 4, 1),
(4, 10, 4, 2, 1),
(5, 30, 2, 4, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`accountID`),
  ADD KEY `roleID` (`roleID`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`),
  ADD KEY `accountID` (`accountID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`),
  ADD KEY `parentID` (`parentID`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`colorID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discountID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `accountID` (`accountID`),
  ADD KEY `addressID` (`addressID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`orderItemID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`photoID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `productxcategory`
--
ALTER TABLE `productxcategory`
  ADD PRIMARY KEY (`prodcutxcategoryID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `relatedproduct`
--
ALTER TABLE `relatedproduct`
  ADD PRIMARY KEY (`relatedProductID`),
  ADD KEY `productID2` (`productID2`),
  ADD KEY `productID1` (`productID1`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleID`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`sizeID`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stockID`),
  ADD KEY `productID` (`productID`),
  ADD KEY `sizeID` (`sizeID`),
  ADD KEY `colorID` (`colorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `accountID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `colorID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discountID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `orderItemID` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `photoID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productxcategory`
--
ALTER TABLE `productxcategory`
  MODIFY `prodcutxcategoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `relatedproduct`
--
ALTER TABLE `relatedproduct`
  MODIFY `relatedProductID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `sizeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stockID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `role` (`roleID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `category` (`categoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`addressID`) REFERENCES `address` (`addressID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `productxcategory`
--
ALTER TABLE `productxcategory`
  ADD CONSTRAINT `productxcategory_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `productxcategory_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `relatedproduct`
--
ALTER TABLE `relatedproduct`
  ADD CONSTRAINT `relatedproduct_ibfk_1` FOREIGN KEY (`productID2`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `relatedproduct_ibfk_2` FOREIGN KEY (`productID1`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`sizeID`) REFERENCES `size` (`sizeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `stock_ibfk_3` FOREIGN KEY (`colorID`) REFERENCES `color` (`colorID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
