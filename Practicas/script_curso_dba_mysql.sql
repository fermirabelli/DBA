-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dbo
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `COUNTRY_ID` char(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `FK_COUNTRIES_REGIONS` (`REGION_ID`),
  CONSTRAINT `FK_COUNTRIES_REGIONS` FOREIGN KEY (`REGION_ID`) REFERENCES `regions` (`REGION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('CA','Canada',2);
INSERT INTO `countries` VALUES ('DE','Germany',1);
INSERT INTO `countries` VALUES ('UK','United Kingdom',1);
INSERT INTO `countries` VALUES ('US','United States of America',2);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `DEPARTMENT_ID` smallint(6) NOT NULL,
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` mediumint(9) DEFAULT NULL,
  `LOCATION_ID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `FK_DEPARTMENTS_LOCATIONS` (`LOCATION_ID`),
  KEY `FK_DEPARTMENTS_EMPLOYEES` (`MANAGER_ID`),
  CONSTRAINT `FK_DEPARTMENTS_EMPLOYEES` FOREIGN KEY (`MANAGER_ID`) REFERENCES `employees` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DEPARTMENTS_LOCATIONS` FOREIGN KEY (`LOCATION_ID`) REFERENCES `locations` (`LOCATION_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (10,'Administration',200,1700);
INSERT INTO `departments` VALUES (20,'Marketing',201,1800);
INSERT INTO `departments` VALUES (50,'Shipping',124,1500);
INSERT INTO `departments` VALUES (60,'IT1',103,1400);
INSERT INTO `departments` VALUES (80,'Sales',149,2500);
INSERT INTO `departments` VALUES (90,'Executive',100,1700);
INSERT INTO `departments` VALUES (110,'Accounting',205,1700);
INSERT INTO `departments` VALUES (190,'Contracting',NULL,1700);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EMPLOYEE_ID` mediumint(9) NOT NULL,
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` datetime(6) NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` mediumint(9) DEFAULT NULL,
  `DEPARTMENT_ID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `FK_EMPLOYEES_DEPARTMENTS` (`DEPARTMENT_ID`),
  KEY `FK_EMPLOYEES_JOBS` (`JOB_ID`),
  CONSTRAINT `FK_EMPLOYEES_DEPARTMENTS` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_EMPLOYEES_JOBS` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Steve','Marshall','515.123.4567','2005-04-06 00:00:00.000000','AD_PRES',24000.00,NULL,NULL,90);
INSERT INTO `employees` VALUES (101,'Jhon','Kusher','515.123.4568','2014-10-29 00:00:00.000000','AD_VP',17000.00,NULL,100,90);
INSERT INTO `employees` VALUES (102,'Lex','De Boer','515.123.4569','2014-12-24 00:00:00.000000','AD_VP',17000.00,NULL,100,90);
INSERT INTO `employees` VALUES (103,'Alexander','Harmat','590.423.4567','2016-05-19 00:00:00.000000','IT_PROG',9000.00,NULL,102,60);
INSERT INTO `employees` VALUES (104,'Bruce','Polikarpenko','590.423.4568','2015-07-11 00:00:00.000000','IT_PROG',6000.00,NULL,103,60);
INSERT INTO `employees` VALUES (107,'Diana','Lopez','590.423.5567','2014-06-08 00:00:00.000000','IT_PROG',4200.00,NULL,103,60);
INSERT INTO `employees` VALUES (124,'Oscar','Galindez','650.123.5234','2016-06-28 00:00:00.000000','ST_MAN',5800.00,NULL,100,50);
INSERT INTO `employees` VALUES (142,'Curtis','Davies','650.121.2994','2015-03-29 00:00:00.000000','ST_CLERK',3100.00,NULL,124,50);
INSERT INTO `employees` VALUES (143,'Diego','Garcia','650.121.2874','2015-02-25 00:00:00.000000','ST_CLERK',2600.00,NULL,124,50);
INSERT INTO `employees` VALUES (144,'Peter','Reid','650.121.2004','2015-12-29 00:00:00.000000','ST_CLERK',2500.00,NULL,124,50);
INSERT INTO `employees` VALUES (149,'Faris','Al Sultan','011.44.1344.429018','2015-07-16 00:00:00.000000','SA_MAN',10500.00,0.20,100,80);
INSERT INTO `employees` VALUES (174,'Ellen','Leder','011.44.1644.429267','2015-09-03 00:00:00.000000','SA_REP',11000.00,0.30,149,80);
INSERT INTO `employees` VALUES (176,'Gary','Taylor','011.44.1644.429265','2015-03-25 00:00:00.000000','SA_REP',8600.00,0.20,149,80);
INSERT INTO `employees` VALUES (178,'Carol','Montgomery','011.44.1644.429263','2015-01-31 00:00:00.000000','SA_REP',7000.00,0.15,149,NULL);
INSERT INTO `employees` VALUES (200,'Mateo','Orlandini','515.123.4444','2015-09-10 00:00:00.000000','AD_ASST',4400.00,NULL,101,10);
INSERT INTO `employees` VALUES (201,'Ulises','Giusti','515.123.5555','2014-03-24 00:00:00.000000','MK_MAN',13000.00,NULL,100,20);
INSERT INTO `employees` VALUES (202,'Martin','Sturla','603.123.6666','2014-12-12 00:00:00.000000','MK_REP',6000.00,NULL,201,20);
INSERT INTO `employees` VALUES (205,'Julieta','Cardenas','515.123.8080','2015-07-20 00:00:00.000000','AC_MGR',12000.00,NULL,101,110);
INSERT INTO `employees` VALUES (206,'William','De Boom','515.123.8181','2016-05-22 00:00:00.000000','AC_ACCOUNT',8300.00,NULL,205,110);
INSERT INTO `employees` VALUES (456,NULL,'ppe',NULL,'2015-03-26 00:00:00.000000','AD_VP',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

--
-- Table structure for table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_grades` (
  `GRADE_LEVEL` varchar(3) DEFAULT NULL,
  `LOWEST_SAL` bigint(20) DEFAULT NULL,
  `HIGHEST_SAL` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_grades`
--

/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` VALUES ('F',25000,40000);
INSERT INTO `job_grades` VALUES ('B',3000,5999);
INSERT INTO `job_grades` VALUES ('C',6000,9999);
INSERT INTO `job_grades` VALUES ('D',10000,14999);
INSERT INTO `job_grades` VALUES ('E',15000,24999);
INSERT INTO `job_grades` VALUES ('F',25000,40000);
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;


--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) NOT NULL,
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` mediumint(9) DEFAULT NULL,
  `MAX_SALARY` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO `jobs` VALUES ('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO `jobs` VALUES ('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO `jobs` VALUES ('AD_PRES','President',20000,40000);
INSERT INTO `jobs` VALUES ('AD_VP','Administration Vice President',15000,30000);
INSERT INTO `jobs` VALUES ('IT_PROG','Programmer',4000,10000);
INSERT INTO `jobs` VALUES ('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO `jobs` VALUES ('MK_REP','Marketing Representative',4000,9000);
INSERT INTO `jobs` VALUES ('SA_MAN','Sales Manager',10000,20000);
INSERT INTO `jobs` VALUES ('SA_REP','Sales Representative',6000,12000);
INSERT INTO `jobs` VALUES ('ST_CLERK','Stock Clerk',2000,5000);
INSERT INTO `jobs` VALUES ('ST_MAN','Stock Manager',5500,8500);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `LOCATION_ID` smallint(6) NOT NULL,
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`),
  KEY `FK_LOCATIONS_COUNTRIES` (`COUNTRY_ID`),
  CONSTRAINT `FK_LOCATIONS_COUNTRIES` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `countries` (`COUNTRY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO `locations` VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO `locations` VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO `locations` VALUES (1800,'460 Bloor St. W.','ON M5S 1X8','Toronto','Ontario','CA');
INSERT INTO `locations` VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `REGION_ID` bigint(20) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'Europe');
INSERT INTO `regions` VALUES (2,'Americas');
INSERT INTO `regions` VALUES (3,'Asia');
INSERT INTO `regions` VALUES (4,'Middle East and Africa');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
