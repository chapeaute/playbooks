-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: WSO2_HTTP_ANALYTICS_DB
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

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
-- Table structure for table `RequestAggregation_DAYS`
--

DROP TABLE IF EXISTS `RequestAggregation_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestAggregation_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `serverName` varchar(254) NOT NULL,
  `serviceName` varchar(254) NOT NULL,
  `serviceMethod` varchar(254) NOT NULL,
  `httpRespGroup` varchar(254) NOT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseTime` double DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`serverName`,`serviceName`,`serviceMethod`,`httpRespGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RequestAggregation_HOURS`
--

DROP TABLE IF EXISTS `RequestAggregation_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestAggregation_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `serverName` varchar(254) NOT NULL,
  `serviceName` varchar(254) NOT NULL,
  `serviceMethod` varchar(254) NOT NULL,
  `httpRespGroup` varchar(254) NOT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseTime` double DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`serverName`,`serviceName`,`serviceMethod`,`httpRespGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RequestAggregation_MINUTES`
--

DROP TABLE IF EXISTS `RequestAggregation_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestAggregation_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `serverName` varchar(254) NOT NULL,
  `serviceName` varchar(254) NOT NULL,
  `serviceMethod` varchar(254) NOT NULL,
  `httpRespGroup` varchar(254) NOT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseTime` double DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`serverName`,`serviceName`,`serviceMethod`,`httpRespGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RequestAggregation_MONTHS`
--

DROP TABLE IF EXISTS `RequestAggregation_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestAggregation_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `serverName` varchar(254) NOT NULL,
  `serviceName` varchar(254) NOT NULL,
  `serviceMethod` varchar(254) NOT NULL,
  `httpRespGroup` varchar(254) NOT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseTime` double DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`serverName`,`serviceName`,`serviceMethod`,`httpRespGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RequestAggregation_SECONDS`
--

DROP TABLE IF EXISTS `RequestAggregation_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestAggregation_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `serverName` varchar(254) NOT NULL,
  `serviceName` varchar(254) NOT NULL,
  `serviceMethod` varchar(254) NOT NULL,
  `httpRespGroup` varchar(254) NOT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseTime` double DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`serverName`,`serviceName`,`serviceMethod`,`httpRespGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RequestAggregation_YEARS`
--

DROP TABLE IF EXISTS `RequestAggregation_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestAggregation_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `serverName` varchar(254) NOT NULL,
  `serviceName` varchar(254) NOT NULL,
  `serviceMethod` varchar(254) NOT NULL,
  `httpRespGroup` varchar(254) NOT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseTime` double DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`serverName`,`serviceName`,`serviceMethod`,`httpRespGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ServiceTable`
--

DROP TABLE IF EXISTS `ServiceTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceTable` (
  `serverName` varchar(254) DEFAULT NULL,
  `serviceName` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-27 12:08:15
