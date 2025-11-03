-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 03, 2025 at 01:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `buildingID` int(11) NOT NULL,
  `buildingType` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`buildingID`, `buildingType`, `address`, `size`) VALUES
(11, 1, 'Przemysłowa 23, Łódź', 13935),
(12, 2, 'Chłodnicza 456, Katowice', 9290),
(13, 3, 'Logistyczna 78, Bydgoszcz', 11148),
(14, 1, 'Panorama 102, Warszawa', 18580),
(15, 2, 'Mroźna 88, Gdańsk', 7432),
(16, 3, 'Magazynowa 66, Kraków', 10219),
(17, 1, 'Pozioma 54, Wrocław', 16722),
(18, 2, 'Chłodna 33, Szczecin', 8841),
(19, 3, 'Inwentaryzacyjna 25, Poznań', 12542),
(20, 1, 'Biznesowa 12, Lublin', 14864);

-- --------------------------------------------------------

--
-- Table structure for table `buildingtypes`
--

CREATE TABLE `buildingtypes` (
  `btypeID` int(11) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `typeDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buildingtypes`
--

INSERT INTO `buildingtypes` (`btypeID`, `type`, `typeDescription`) VALUES
(1, 'High-Rise Storage Warehouse', 'A warehouse characterized by large heights and a racking system that allows for the storage of goods on multiple levels. It is ideal for storing large quantities of products of varying sizes. Equipped with automation systems and internal transport solutions.'),
(2, 'Refrigerated Warehouse', 'A warehouse designed for storing goods that require low temperatures, such as food and pharmaceuticals. It is equipped with refrigeration systems that maintain the appropriate internal temperature 24/7. It may have different temperature zones depending on the products stored.'),
(3, 'FIFO Racking Warehouse', 'A warehouse with racking systems organized in the FIFO (First In, First Out) method, ensuring that the oldest goods are used first.');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `surname` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(9) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `birthDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employeeID`, `name`, `surname`, `address`, `phoneNumber`, `position`, `email`, `birthDate`) VALUES
(1, 'John', 'Smith', '123 Oak Street, Springfield, IL', '555123456', 'Warehouse Supervisor', ' john.smith@gmail.com', '1985-03-22'),
(2, 'Emily', 'Johnson', '456 Main St, Miami, FL 33101', '987654321', 'Warehouse Associate', 'emily.johnson@email.com', '1995-03-16'),
(3, 'David', 'Brown', '789 Park Ave, Atlanta, GA 30303', '654321987', 'Stock Keeper', 'david.brown@email.com', '1988-06-12'),
(4, 'Olivia', 'Davis', '101 Pine St, San Francisco, CA 94110', '321654987', 'Inventory Clerk', 'olivia.davis@email.com', '1992-11-05'),
(5, 'John', 'Miller', '202 Maple St, New York, NY 10001', '789123456', 'Warehouse Assistant', 'john.miller@email.com', '1994-04-19'),
(6, 'Isabella', 'Garcia', '303 Oak St, Miami, FL 33140', '555444333', 'Warehouse Operator', 'isabella.garcia@email.com', '1989-09-22'),
(7, 'Michael', 'Williams', '404 Pine St, Atlanta, GA 30305', '222333444', 'Warehouse Supervisor', 'michael.williams@email.com', '1984-07-13'),
(8, 'Ava', 'Martinez', '505 Cedar St, San Francisco, CA 94109', '444555666', 'Shipping Coordinator', 'ava.martinez@email.com', '1990-02-09'),
(9, 'Robert', 'Taylor', '606 Elm St, New York, NY 10023', '555666777', 'Forklift Operator', 'robert.taylor@email.com', '1985-12-02'),
(10, 'Sophia', 'Anderson', '707 Chestnut St, Miami, FL 33125', '666777888', 'Order Picker', 'sophia.anderson@email.com', '1991-05-14'),
(11, 'Daniel', 'Thomas', '808 Birch St, Atlanta, GA 30306', '777888999', 'Warehouse Technician', 'daniel.thomas@email.com', '1992-03-25'),
(12, 'Chloe', 'Jackson', '909 Maple St, San Francisco, CA 94103', '888999000', 'Packing Specialist', 'chloe.jackson@email.com', '1994-08-04'),
(13, 'Ethan', 'Harris', '1010 Oak St, New York, NY 10012', '444333222', 'Inventory Manager', 'ethan.harris@email.com', '1983-11-10'),
(14, 'Grace', 'Clark', '1111 Pine St, Seattle, WA 98101', '333222111', 'Warehouse Clerk', 'grace.clark@email.com', '1996-01-20'),
(15, 'William', 'Lewis', '1212 Cedar St, Miami, FL 33126', '222333444', 'Warehouse Laborer', 'william.lewis@email.com', '1987-07-28');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `itemName` text DEFAULT NULL,
  `itemType` int(11) NOT NULL,
  `itemDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`itemID`, `itemName`, `itemType`, `itemDescription`) VALUES
(1, 'Smartphone Galaxy X2', 1, 'Nowoczesny smartfon z 6,5-calowym ekranem OLED, procesorem Snapdragon 888, aparatem 64 MP oraz 128 GB pamięci.'),
(2, 'Robot Vacuum Cleaner Pro2', 2, 'Inteligentny odkurzacz automatyczny z funkcją mapowania pomieszczeń, systemem czyszczenia 3 w 1 i wydajną baterią do 120 minut pracy.'),
(3, 'Kuchnia Indukcyjna XL', 3, 'Nowoczesna kuchenka indukcyjna z 4 polami grzewczymi, systemem zarządzania energią i dotykowym panelem sterującym.'),
(4, 'Kolarz MTB 5000', 4, 'Wysokiej jakości rower górski z 21 biegami, amortyzowanymi kołami i lekką ramą aluminiową.'),
(5, 'Wózek Spacerowy City Move', 5, 'Lekki wózek spacerowy z regulowaną rączką, wieloma kieszeniami na akcesoria oraz zdejmowaną budką ochronną.'),
(6, 'Stół Jadalny Granitowy', 6, 'Elegancki stół do jadalni z blatem granitowym i solidnymi drewnianymi nogami, pasujący do nowoczesnych wnętrz.'),
(7, 'Skrzynka Narzędziowa Deluxe', 7, 'Przestronna skrzynka narzędziowa z wieloma przegródkami, idealna do przechowywania narzędzi ręcznych i akcesoriów.'),
(8, 'Słuchawki Bluetooth SoundPro', 1, 'Bezprzewodowe słuchawki z redukcją hałasu, 30-godzinnym czasem pracy na jednym ładowaniu i dźwiękiem Hi-Fi.'),
(9, 'Mikser Planetarny TurboMix', 2, 'Mikser planetarny z 6 prędkościami, dużą misą 5L i zestawem akcesoriów do mieszania, ubijania i wyrabiania ciasta.'),
(10, 'Torba Sportowa FlexFit', 4, 'Praktyczna torba sportowa z wieloma przegródkami, wykonaną z wytrzymałego materiału, idealna na siłownię czy treningi.'),
(11, 'Lodówka z Zamrażarką ColdMax', 3, 'Lodówka o pojemności 300L z funkcją no frost, energooszczędna, z dużymi szufladami w zamrażarce.'),
(12, 'Piłka Nożna ProTouch', 4, 'Wysokiej jakości piłka nożna z gumy syntetycznej, idealna do użytku na boiskach trawiastych i sztucznych.'),
(13, 'Fotel do Karmienia BabyComfort', 5, 'Wysokiej jakości piłka nożna z gumy syntetycznej, idealna do użytku na boiskach trawiastych i sztucznych.'),
(14, 'Krzesło Biurkowe ErgoPro', 6, 'Komfortowe krzesło biurowe z regulacją wysokości, ergonomicznym oparciem i tapicerką z siatki.'),
(15, 'Zestaw Narzędzi Ręcznych ProfiTool', 7, 'Zestaw narzędzi zawierający młotek, wkrętaki, szczypce i klucze, idealny do drobnych napraw w domu i ogrodzie'),
(16, 'Okulary Przeciwsłoneczne X-Treme', 8, 'Stylowe okulary przeciwsłoneczne z filtrami UV400, lekką oprawką i wygodnymi noskami.'),
(17, 'Power Bank UltraCharge 10000mAh', 1, 'Przenośna bateria o pojemności 10000 mAh, idealna do ładowania smartfonów i innych urządzeń elektronicznych w podróży.'),
(18, 'Pralka Automatyczna EcoWash 9kg', 3, 'Pralka z 9 kg pojemnością, 15 programami prania oraz funkcją oszczędzania wody i energii.'),
(19, 'Hulajnoga Elektroniczna UrbanRide', 4, 'Elektryczna hulajnoga z napędem 250 W, zasięgiem do 25 km oraz łatwym składaniem, idealna do miasta.'),
(20, 'Lampa Biurkowa LED EcoLight', 1, 'Lampa biurkowa z regulacją natężenia światła, energooszczędną żarówką LED i elegancką obudową.');

-- --------------------------------------------------------

--
-- Table structure for table `itemtypes`
--

CREATE TABLE `itemtypes` (
  `typeID` int(11) NOT NULL,
  `itemType` varchar(30) DEFAULT NULL,
  `typeDescription` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itemtypes`
--

INSERT INTO `itemtypes` (`typeID`, `itemType`, `typeDescription`) VALUES
(1, 'Electronics', 'This category includes products that involve electronic devices or components powered by electricity. Electronics typically require careful storage to avoid exposure to moisture, heat, and static. Common items in this category are televisions, laptops, smartphones, and cameras.'),
(2, 'Home Appliances (Small)', 'Small home appliances are devices that assist with household tasks and are typically portable or compact. These products are often used for everyday convenience, such as cooking, cleaning, or personal care. Proper handling and storage are important to prevent damage to delicate components.'),
(3, 'Home Appliances (Large)', 'Large home appliances are typically larger in size and are essential for home tasks, such as refrigeration, washing, and cooling. These products often have a significant weight and require careful handling and storage, especially when considering their size and potential for damage.'),
(4, 'Sports', 'Sports equipment refers to products designed for physical activity, outdoor recreation, or exercise. These can range from bicycles and gym equipment to sporting goods like golf clubs or camping gear. When stored in a warehouse, they require care to avoid damage from weather conditions and to ensure they stay in optimal condition.'),
(5, 'Baby Products', 'Baby products are designed for the safety and care of infants and young children. These products include items like strollers, high chairs, and baby monitors. They typically require secure packaging and storage to ensure they are safe for use, as well as to prevent any contamination or damage.'),
(6, 'Furniture', 'Furniture products refer to items that are used to furnish living spaces. This includes seating (e.g., sofas, chairs), storage solutions (e.g., cabinets, shelves), and tables. Furniture is typically bulky and must be stored in a way that prevents scratching, warping, or crushing.'),
(7, 'Tools', 'Tools are instruments designed for mechanical, construction, or repair tasks. They can range from simple hand tools like hammers and screwdrivers to more complex power tools like drills and saws. These products must be carefully stored to prevent rust or wear, and ensure the safe handling of sharp or heavy items.'),
(8, 'Accessories', 'Accessories are products designed to complement or enhance the use of other primary items. They can include things like bags, cases, chargers, and decorative elements. These products tend to be smaller and easier to store, but should still be organized to prevent loss or damage.'),
(9, 'Toys and Games', 'Products designed for children\'s play or entertainment, including action figures, board games, puzzles, and educational toys.'),
(10, 'Luxury Goods', 'High-end, often expensive products aimed at the premium market, including designer clothing, watches, handbags, and exclusive experiences.');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationID` int(11) NOT NULL,
  `buildingID` int(11) NOT NULL,
  `row` varchar(10) DEFAULT NULL,
  `shelf` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationID`, `buildingID`, `row`, `shelf`) VALUES
(1, 11, '1', '1'),
(2, 11, '1', '2'),
(3, 11, '1', '2'),
(4, 11, '1', '3'),
(5, 11, '1', '4'),
(6, 11, '1', '5'),
(7, 11, '1', '7'),
(8, 11, '1', '7'),
(9, 11, '1', '8'),
(10, 11, '1', '9'),
(11, 11, '1', '10'),
(12, 11, '2', '1'),
(13, 11, '2', '2'),
(14, 11, '2', '3'),
(15, 11, '2', '4'),
(16, 11, '2', '5'),
(17, 11, '2', '6'),
(18, 11, '2', '7'),
(19, 11, '2', '8'),
(20, 11, '2', '9'),
(21, 11, '2', '10'),
(22, 12, '1', '1'),
(23, 13, '1', '1'),
(24, 13, '1', '1'),
(25, 14, '1', '1'),
(26, 15, '1', '1'),
(27, 16, '1', '1'),
(28, 17, '1', '1'),
(29, 18, '1', '1'),
(30, 19, '1', '1'),
(31, 20, '1', '1'),
(32, 15, '1', '2'),
(33, 17, '1', '2'),
(34, 17, '1', '3'),
(36, 14, '2', '1'),
(37, 14, '2', '2'),
(38, 14, '2', '3'),
(39, 18, '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `receive`
--

CREATE TABLE `receive` (
  `recID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `recDate` datetime DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receive`
--

INSERT INTO `receive` (`recID`, `itemID`, `locationID`, `recDate`, `userID`, `quantity`) VALUES
(1, 10, 26, '2025-04-08 08:06:16', 1, 250),
(2, 11, 3, '2025-04-08 08:20:38', 1, 2),
(4, 12, 32, '2025-04-04 12:59:45', 2, 125),
(5, 4, 1, '2025-04-03 13:11:45', 1, 3),
(6, 12, 30, '2025-04-02 11:45:32', 2, 20),
(7, 13, 3, '2025-04-03 11:18:35', 1, 5),
(9, 5, 26, '2025-04-07 11:16:01', 2, 32),
(10, 16, 29, '2025-04-09 10:18:05', 2, 23),
(12, 7, 1, '2025-04-09 09:45:25', 2, 132),
(13, 13, 39, '2025-03-20 14:18:27', 1, 23);

-- --------------------------------------------------------

--
-- Table structure for table `removal`
--

CREATE TABLE `removal` (
  `remID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `remDate` datetime DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `removal`
--

INSERT INTO `removal` (`remID`, `itemID`, `locationID`, `remDate`, `userID`, `quantity`) VALUES
(2, 7, 1, '2025-04-09 09:45:25', 2, 13),
(3, 7, 1, '2025-06-09 09:45:25', 2, 34),
(4, 7, 1, '2025-05-15 13:42:12', 1, 34),
(5, 13, 39, '2025-06-02 14:19:16', 2, 3),
(6, 13, 39, '2025-05-07 14:19:16', 1, 14),
(7, 13, 39, '2025-06-02 14:19:16', 2, 3),
(8, 13, 39, '2025-05-07 14:19:16', 1, 14),
(9, 13, 39, '2025-04-23 14:21:14', 1, 2),
(10, 13, 39, '2025-04-03 14:21:14', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `storeditems`
--

CREATE TABLE `storeditems` (
  `storedID` int(11) NOT NULL,
  `locationID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `storeditems`
--

INSERT INTO `storeditems` (`storedID`, `locationID`, `itemID`, `quantity`) VALUES
(2, 30, 12, 17),
(5, 29, 16, 23),
(6, 32, 12, 125),
(7, 26, 10, 250),
(8, 26, 5, 32),
(12, 21, 11, 18),
(13, 31, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `login` varchar(20) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `employeeID` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `login`, `password`, `employeeID`, `email`) VALUES
(1, 'ava.martinez', 'ava.martinez', 8, 'ava.martinez@email.com'),
(2, 'john.miller', 'john.miller', 5, 'john.miller@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`buildingID`),
  ADD UNIQUE KEY `buildingID` (`buildingID`),
  ADD KEY `buildingType` (`buildingType`) USING BTREE,
  ADD KEY `itemType` (`buildingType`) USING BTREE;

--
-- Indexes for table `buildingtypes`
--
ALTER TABLE `buildingtypes`
  ADD PRIMARY KEY (`btypeID`),
  ADD UNIQUE KEY `btypeID` (`btypeID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employeeID`),
  ADD UNIQUE KEY `employeeID` (`employeeID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`),
  ADD UNIQUE KEY `itemID` (`itemID`),
  ADD KEY `itemType` (`itemType`) USING BTREE;

--
-- Indexes for table `itemtypes`
--
ALTER TABLE `itemtypes`
  ADD PRIMARY KEY (`typeID`),
  ADD UNIQUE KEY `typeID` (`typeID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationID`),
  ADD UNIQUE KEY `locationID` (`locationID`),
  ADD KEY `buildingID` (`buildingID`);

--
-- Indexes for table `receive`
--
ALTER TABLE `receive`
  ADD UNIQUE KEY `recID` (`recID`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `locationID` (`locationID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `removal`
--
ALTER TABLE `removal`
  ADD UNIQUE KEY `remID` (`remID`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `locationID` (`locationID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `storeditems`
--
ALTER TABLE `storeditems`
  ADD UNIQUE KEY `storedID` (`storedID`),
  ADD KEY `locationID` (`locationID`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `userID` (`userID`),
  ADD KEY `employeeID` (`employeeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `buildingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `buildingtypes`
--
ALTER TABLE `buildingtypes`
  MODIFY `btypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `itemtypes`
--
ALTER TABLE `itemtypes`
  MODIFY `typeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `receive`
--
ALTER TABLE `receive`
  MODIFY `recID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `removal`
--
ALTER TABLE `removal`
  MODIFY `remID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `storeditems`
--
ALTER TABLE `storeditems`
  MODIFY `storedID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `building`
--
ALTER TABLE `building`
  ADD CONSTRAINT `building_ibfk_1` FOREIGN KEY (`buildingType`) REFERENCES `buildingtypes` (`btypeID`) ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`itemType`) REFERENCES `itemtypes` (`typeID`) ON UPDATE CASCADE;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`buildingID`) REFERENCES `building` (`buildingID`) ON UPDATE CASCADE;

--
-- Constraints for table `receive`
--
ALTER TABLE `receive`
  ADD CONSTRAINT `receive_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `receive_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `receive_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON UPDATE CASCADE;

--
-- Constraints for table `removal`
--
ALTER TABLE `removal`
  ADD CONSTRAINT `removal_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `removal_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `removal_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON UPDATE CASCADE;

--
-- Constraints for table `storeditems`
--
ALTER TABLE `storeditems`
  ADD CONSTRAINT `storeditems_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `storeditems_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employees` (`employeeID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
