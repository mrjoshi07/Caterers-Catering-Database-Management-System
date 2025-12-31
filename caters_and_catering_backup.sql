-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: caters_and_catering
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `client_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `uq_phone` (`phone`),
  CONSTRAINT `chk_c_email` CHECK ((`email` like _utf8mb4'%@gmail.com')),
  CONSTRAINT `chk_c_phone` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{10}$')),
  CONSTRAINT `customer_chk_1` CHECK (regexp_like(`phone`,_utf8mb4'^[6-9][0-9]{9}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('CLT001','Pravin More','9823456710','Shivajinagar, Pune, Maharashtra','pravinmore@gmail.com'),('CLT002','Chetan Patil','9890123456','Nashik Road, Nashik, Maharashtra','chetanpatil@gmail.com'),('CLT003','Vishnu Dhawalshankh','9012567834','Gangapur Road, Aurangabad, Maharashtra','vishnudhawalshankh@gmail.com'),('CLT004','Sakshi Thombre','9545123678','Trimurti Chowk, Nagpur, Maharashtra','sakshithombre@gmail.com'),('CLT005','Om Rokade','9374561280','Ramnagar, Kolhapur, Maharashtra','omrokade@gmail.com'),('CLT006','Vijay Bhujabal','9156234789','Mahad, Raigad, Maharashtra','vijaybhujabal@gmail.com'),('CLT007','Suraj Shinde','9865012345','CIDCO, Nanded, Maharashtra','surajshinde@gmail.com'),('CLT008','Sushant Upare','9845332109','Sadar Bazar, Solapur, Maharashtra','sushantupare@gmail.com'),('CLT009','Atharv Dhindale','9767895432','Kopargaon, Ahmednagar, Maharashtra','atharvdhindale@gmail.com'),('CLT010','Narayani Fopse','9945123087','Satara Road, Satara, Maharashtra','narayanifopse@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` varchar(20) NOT NULL,
  `client_id` varchar(20) DEFAULT NULL,
  `item_id` varchar(20) DEFAULT NULL,
  `event_type` varchar(100) NOT NULL,
  `event_date` date NOT NULL,
  `location` text NOT NULL,
  `guest_count` int NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `status` varchar(30) NOT NULL,
  `team_id` varchar(20) DEFAULT NULL,
  `time` varchar(50) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `fk_client_id` (`client_id`),
  KEY `fk_menu_id` (`item_id`),
  KEY `fk_team_id` (`team_id`),
  CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `customer` (`client_id`),
  CONSTRAINT `fk_menu_id` FOREIGN KEY (`item_id`) REFERENCES `menu_item` (`item_id`),
  CONSTRAINT `fk_team_id` FOREIGN KEY (`team_id`) REFERENCES `staff_teams` (`team_id`),
  CONSTRAINT `chk_cost` CHECK ((`cost` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('EVT001','CLT001','ITM001','Wedding','2021-11-20','Pune – Shivajinagar Hall',150,67500.00,'Completed','TEAM001','06:30 PM'),('EVT002','CLT003','ITM004','Corporate Lunch','2022-03-15','Aurangabad – Prozone Lawn',200,90000.00,'Completed','TEAM001','01:00 PM'),('EVT003','CLT006','ITM007','Birthday Celebration','2023-02-10','Raigad – Mahad Ground',180,99000.00,'Cancelled','TEAM002','07:45 PM'),('EVT004','CLT002','ITM002','Engagement Ceremony','2023-08-25','Nashik – City Hall',250,125000.00,'Completed','TEAM002','12:30 PM'),('EVT005','CLT010','ITM010','Corporate Meeting','2024-01-18','Satara – Royal Banquet',120,54000.00,'Booked','TEAM003','10:00 AM'),('EVT006','CLT009','ITM005','Family Function','2024-10-05','Ahmednagar – Garden Venue',300,180000.00,'Completed','TEAM003','08:00 PM'),('EVT007','CLT004','ITM003','Festival Catering','2025-02-14','Nagpur – Trimurti Convention Hall',180,81000.00,'Pending','TEAM004','02:15 PM'),('EVT008','CLT008','ITM009','Wedding Reception','2025-06-30','Solapur – Sadar Function Plaza',350,210000.00,'Booked','TEAM004','07:00 PM'),('EVT009','CLT005','ITM006','Housewarming','2022-12-12','Kolhapur – Ramnagar Community Hall',130,52000.00,'Completed','TEAM005','11:30 AM'),('EVT010','CLT007','ITM008','Wedding Anniversary','2023-09-03','Nanded – CIDCO Grand Lawn',400,260000.00,'Completed','TEAM005','06:45 PM');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_user`
--

DROP TABLE IF EXISTS `internal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_user` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(15) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` date NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_email` (`email`),
  CONSTRAINT `chk_email` CHECK ((`email` like _utf8mb4'%@gmail.com')),
  CONSTRAINT `chk_pass` CHECK (regexp_like(`password`,_utf8mb4'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*]).{8,15}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_user`
--

LOCK TABLES `internal_user` WRITE;
/*!40000 ALTER TABLE `internal_user` DISABLE KEYS */;
INSERT INTO `internal_user` VALUES ('USR001','rahul sharma','rahulsharma@gmail.com','Rahul@123','admin','2021-03-12'),('USR002','priya mehta','priyamehta@gmail.com','Priya#123','manager','2022-07-25'),('USR005','vijay nair','vijaynair@gmail.com','Vijay#123','manager','2025-02-14'),('USR007','kavya singh','kavyasingh@gmail.com','Kavya$123','admin','2022-09-29'),('USR009','anita joshi','anitajoshi@gmail.com','Anita#123','manager','2024-08-21');
/*!40000 ALTER TABLE `internal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `supplier_id` varchar(20) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_supplier_id` (`supplier_id`),
  CONSTRAINT `fk_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('INV001','Wheat Flour (50kg)','40','SUP001'),('INV002','Red Chilli Powder','25','SUP002'),('INV003','Sunflower Oil (15L)','60','SUP003'),('INV004','Fresh Tomatoes','150','SUP004'),('INV005','Cow Milk (20L Can)','80','SUP005'),('INV006','Packaging Boxes (Large)','200','SUP006'),('INV007','Mineral Water Can (20L)','120','SUP007'),('INV008','Frozen Peas (1kg Packs)','75','SUP008'),('INV009','Soft Drink Bottles (750ml)','140','SUP009'),('INV010','Rice (25kg Bags)','50','SUP010');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `base_price` decimal(12,2) NOT NULL,
  `category` text NOT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `uq_name` (`name`),
  CONSTRAINT `chk_price` CHECK ((`base_price` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES ('PKG001','Maharashtrian Veg Thali','Includes chapati, puri, bhaji, dal, rice, dahi, gulab jamun, papad, pickle.',250.00,'Veg'),('PKG002','Maharashtrian Non-Veg Thali','Chicken curry, egg curry, chapati, rice, solkadhi, salad, sweet dish.',350.00,'Non-Veg'),('PKG003','South Indian Deluxe Package','Idli, dosa, vada, sambhar, coconut chutney, lemon rice, kesari bath.',280.00,'Veg'),('PKG004','North Indian Premium Package','Paneer gravy, naan, veg pulao, dal tadka, salad, raita, rasgulla.',320.00,'Premium Veg'),('PKG005','Basic Veg Catering Package','Chapati, veg curry, dal, jeera rice, salad, buttermilk.',180.00,'Veg'),('PKG006','Basic Non-Veg Catering Package','Chapati, chicken gravy, rice, salad, buttermilk.',260.00,'Non-Veg'),('PKG007','Wedding Premium Veg Package','Paneer tikka, veg biryani, naan, dal makhani, desserts, welcome drink.',500.00,'Premium Veg'),('PKG008','Wedding Premium Non-Veg Package','Chicken biryani, tandoori chicken, naan, desserts, welcome drink.',650.00,'Premium Non-Veg'),('PKG009','Corporate Lunch Veg Package','Chapati, sabzi, dal, steamed rice, salad, sweet dish.',220.00,'Veg'),('PKG010','Corporate Lunch Non-Veg Package','Chapati, chicken gravy, rice, salad, sweet dish.',300.00,'Non-Veg'),('PKG011','Maharashtrian Special Veg','Pithla bhakri, thecha, rice, varan, koshimbir, shrikhand.',260.00,'Veg'),('PKG012','Maharashtrian Special Non-Veg','Mutton curry, bhakri, rice, solkadhi, salad, sweet dish.',520.00,'Non-Veg'),('PKG013','South Indian Breakfast Package','Idli, medu vada, masala dosa, sambar, coconut chutney.',200.00,'Veg'),('PKG014','Gujarati Thali Package','Rotli, dal, kadhi, rice, 2 sabzi, farsan, sweet dish, chaas.',300.00,'Veg'),('PKG015','Punjabi Executive Veg Package','Paneer butter masala, naan, jeera rice, dal fry, gulab jamun.',340.00,'Veg'),('PKG016','Punjabi Non-Veg Package','Butter chicken, naan, rice, salad, sweet dish.',420.00,'Non-Veg'),('PKG017','Chinese Veg Package','Veg fried rice, veg noodles, manchurian, spring rolls.',280.00,'Veg'),('PKG018','Chinese Non-Veg Package','Chicken fried rice, chicken noodles, chicken manchurian.',340.00,'Non-Veg'),('PKG019','Snacks & High Tea Veg Package','Samosa, kachori, tea, coffee, sandwiches, cookies.',160.00,'Snacks'),('PKG020','Snacks & High Tea Non-Veg Package','Chicken popcorn, chicken rolls, tea, coffee, sandwiches.',220.00,'Snacks'),('PKG021','Dessert Special Package','Gulab jamun, rasgulla, shrikhand, basundi, ice-cream.',250.00,'Dessert'),('PKG022','Royal Wedding Veg Package','Starters, veg main course, biryani, desserts, welcome drink.',750.00,'Premium Veg'),('PKG023','Royal Wedding Non-Veg Package','Tandoori chicken, mutton biryani, naan, desserts, welcome drink.',950.00,'Premium Non-Veg'),('PKG024','Kids Birthday Party Veg Package','Mini pizza, fries, noodles, ice-cream, juice.',220.00,'Veg'),('PKG025','Kids Birthday Party Mixed Package','Mini burgers, popcorn chicken, fries, noodles, ice-cream.',300.00,'Mixed');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `item_id` varchar(20) NOT NULL,
  `menu_id` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fkmi_menu_id` (`menu_id`),
  CONSTRAINT `fkmi_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES ('ITM001','PKG001','Maharashtrian Veg Thali','Replace gulab jamun with basundi.','Sweet less sugar'),('ITM002','PKG001','Maharashtrian Veg Thali','Replace chapati with bhakri.','Medium spicy curry'),('ITM003','PKG002','Maharashtrian Non-Veg Thali','N/A','N/A'),('ITM004','PKG003','South Indian Deluxe Package','Add extra idli instead of lemon rice.','Soft idli'),('ITM005','PKG004','North Indian Premium Package','Replace paneer butter masala with paneer tikka.','Less oil'),('ITM006','PKG005','Basic Veg Catering Package','Replace rice with jeera rice.','N/A'),('ITM007','PKG006','Basic Non-Veg Catering Package','N/A','Chicken gravy less spicy'),('ITM008','PKG007','Wedding Premium Veg Package','Add extra dessert along with rasgulla.','Normal sweetness'),('ITM009','PKG008','Wedding Premium Non-Veg Package','Replace biryani starter with tandoori chicken.','Spicy'),('ITM010','PKG009','Corporate Lunch Veg Package','Add gulab jamun as extra sweet.','N/A');
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(20) NOT NULL,
  `event_id` varchar(20) DEFAULT NULL,
  `item_id` varchar(20) DEFAULT NULL,
  `quantity` int NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_o_event_id` (`event_id`),
  KEY `fk_o_item_id` (`item_id`),
  CONSTRAINT `fk_o_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `fk_o_item_id` FOREIGN KEY (`item_id`) REFERENCES `menu_item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('ORD001','EVT005','ITM010',120,'Main catering order for corporate meeting'),('ORD002','EVT007','ITM003',180,'Festival catering main order'),('ORD003','EVT008','ITM009',350,'Wedding reception main catering order');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` varchar(100) NOT NULL,
  `event_id` varchar(20) DEFAULT NULL,
  `client_id` varchar(20) DEFAULT NULL,
  `full_amount` decimal(12,2) NOT NULL,
  `adv_amount` decimal(12,2) NOT NULL,
  `rem_amount` decimal(12,2) NOT NULL,
  `payment_date` date NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_p_event_id` (`event_id`),
  KEY `fk_p_client_id` (`client_id`),
  CONSTRAINT `fk_p_client_id` FOREIGN KEY (`client_id`) REFERENCES `customer` (`client_id`),
  CONSTRAINT `fk_p_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `chk_adv_amount` CHECK ((`adv_amount` > 0)),
  CONSTRAINT `chk_full_amount` CHECK ((`full_amount` > 0)),
  CONSTRAINT `chk_rem_amount` CHECK ((`rem_amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES ('PAY001','EVT001','CLT001',67500.00,20000.00,47500.00,'2021-10-25','UPI'),('PAY002','EVT002','CLT003',90000.00,30000.00,60000.00,'2022-02-20','Bank Transfer'),('PAY003','EVT003','CLT006',99000.00,25000.00,74000.00,'2023-01-10','Cash'),('PAY004','EVT004','CLT002',125000.00,40000.00,85000.00,'2023-07-20','UPI'),('PAY005','EVT005','CLT010',54000.00,15000.00,39000.00,'2023-12-28','Card'),('PAY006','EVT006','CLT009',180000.00,60000.00,120000.00,'2024-09-05','Bank Transfer'),('PAY007','EVT007','CLT004',81000.00,20000.00,61000.00,'2025-01-20','UPI'),('PAY008','EVT008','CLT008',210000.00,70000.00,140000.00,'2025-06-01','Cash'),('PAY009','EVT009','CLT005',52000.00,12000.00,40000.00,'2022-11-10','Card'),('PAY010','EVT010','CLT007',260000.00,80000.00,180000.00,'2023-08-05','Bank Transfer');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_teams`
--

DROP TABLE IF EXISTS `staff_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_teams` (
  `team_id` varchar(20) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `staffs` text NOT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `fk_st_user_id` (`user_id`),
  CONSTRAINT `fk_st_user_id` FOREIGN KEY (`user_id`) REFERENCES `internal_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_teams`
--

LOCK TABLES `staff_teams` WRITE;
/*!40000 ALTER TABLE `staff_teams` DISABLE KEYS */;
INSERT INTO `staff_teams` VALUES ('TEAM001','Royal Chefs Team','Suresh Pawar (Head Cook), Mahesh More (Assistant Cook), Ravi Chavan (Waiter), \n  Kiran Mane (Food Server), Amit Khade (Cleaner), Nitin Kamble (Helper), \n  Prakash Shinde (Dish Washer), Sameer Gade (Decoration Helper), \n  Jayesh Patil (Water Supply), Sanjay Lokhande (Packaging Helper)','USR002'),('TEAM002','Elite Catering Squad','Ramesh Sawant (Head Cook), Ganesh Jadhav (Assistant Cook), Shubham Gaikwad (Waiter), \n  Akash Kadam (Food Server), Yogesh Rane (Cleaner), Harish Kolekar (Helper), \n  Anil Doke (Dish Washer), Sunil Bhise (Decoration Helper), \n  Rohit Salunkhe (Water Supply), Paresh Nikam (Packaging Helper)','USR005'),('TEAM003','Premium Service Crew','Vikram Deshmukh (Head Cook), Sagar Shirsat (Assistant Cook), Mayur Bhosale (Waiter), \n  Rahul Karande (Food Server), Dinesh Sutar (Cleaner), Manoj Hinge (Helper), \n  Gopal Mhaske (Dish Washer), Swapnil Naik (Decoration Helper),\n  Tushar Jagtap (Water Supply), Lalit Gharat (Packaging Helper)','USR009'),('TEAM004','Signature Events Team','Pradeep Shelar (Head Cook), Nilesh Gujar (Assistant Cook), Rohit Thube (Waiter), \n  Ajay Shirole (Food Server), Sanket Gade (Cleaner), Abhijit Kurhade (Helper), \n  Kailash Lad (Dish Washer), Omkar Nikam (Decoration Helper), \n  Rushikesh Mane (Water Supply), Sharad Phadatare (Packaging Helper)','USR002'),('TEAM005','Golden Hospitality Team','Bharat Bhoir (Head Cook), Devram Kale (Assistant Cook), Kalpesh Dogre (Waiter), \n  Sandesh Naidu (Food Server), Vasant Joshi (Cleaner), Siddhesh Pawaskar (Helper), \n  Yash Gawli (Dish Washer), Chetan Dumbre (Decoration Helper), \n  Harshal Sarnobat (Water Supply), Navin Raut (Packaging Helper)','USR005');
/*!40000 ALTER TABLE `staff_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(130) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  CONSTRAINT `chk_s_email` CHECK ((`email` like _utf8mb4'%@gmail.com')),
  CONSTRAINT `chk_s_phone` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{10}$')),
  CONSTRAINT `chk_sup_email` CHECK ((`email` like _utf8mb4'%@gmail.com')),
  CONSTRAINT `chk_sup_phone` CHECK (regexp_like(`phone`,_utf8mb4'^[7-9][0-9]{9}$'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES ('SUP001','Ramesh Traders','rameshtraders@gmail.com','9876543210','Pune, Market Yard'),('SUP002','Patel Spices','patelspices@gmail.com','9865123784','Mumbai, Dadar West'),('SUP003','Sharma Oil Depot','sharmaoil@gmail.com','9823456781','Nashik, Old Gangapur Road'),('SUP004','Desai Vegetables','desaivegetables@gmail.com','9898765432','Satara, Powai Naka'),('SUP005','Joshi Dairy Supply','joshidairy@gmail.com','9812345679','Kolhapur, Shivaji Market'),('SUP006','More Packaging House','morepackaging@gmail.com','9933456782','Nagpur, Dharampeth'),('SUP007','Kulkarni Water Supply','kulkarniwater@gmail.com','9874503216','Solapur, Hotgi Road'),('SUP008','Sawant Cold Storage','sawantcoldstore@gmail.com','9867892301','Aurangabad, CIDCO N-5'),('SUP009','Pawar Soft Drinks','pawardrinks@gmail.com','9822334456','Latur, MIDC Area'),('SUP010','Shinde Grocery Mart','shindemart@gmail.com','9944556677','Thane, Ghodbunder Road');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-31 19:19:22
