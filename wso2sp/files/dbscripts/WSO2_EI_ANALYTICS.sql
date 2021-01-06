-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: WSO2_EI_ANALYTICS_DB
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
-- Table structure for table `ComponentNameTable`
--

DROP TABLE IF EXISTS `ComponentNameTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComponentNameTable` (
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) DEFAULT NULL,
  `componentType` varchar(254) DEFAULT NULL,
  KEY `ComponentNameTable_INDEX` (`componentType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ConfigEntryTable`
--

DROP TABLE IF EXISTS `ConfigEntryTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConfigEntryTable` (
  `metaTenantId` int(11) DEFAULT NULL,
  `hashcode` varchar(254) NOT NULL,
  `entryName` varchar(254) DEFAULT NULL,
  `configData` varchar(60000) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hashcode`),
  KEY `ConfigEntryTable_INDEX` (`metaTenantId`,`entryName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESBEventTable`
--

DROP TABLE IF EXISTS `ESBEventTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESBEventTable` (
  `metaTenantId` int(11) DEFAULT NULL,
  `messageFlowId` varchar(254) DEFAULT NULL,
  `host` varchar(254) DEFAULT NULL,
  `hashCode` varchar(254) DEFAULT NULL,
  `componentName` varchar(254) DEFAULT NULL,
  `componentType` varchar(254) DEFAULT NULL,
  `componentIndex` int(11) DEFAULT NULL,
  `componentId` varchar(254) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `beforePayload` mediumtext,
  `afterPayload` varchar(500000) DEFAULT NULL,
  `contextPropertyMap` varchar(500000) DEFAULT NULL,
  `transportPropertyMap` varchar(500000) DEFAULT NULL,
  `children` varchar(254) DEFAULT NULL,
  `entryPoint` varchar(254) DEFAULT NULL,
  `entryPointHashcode` varchar(254) DEFAULT NULL,
  `faultCount` int(11) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  KEY `ESBEventTable_INDEX` (`metaTenantId`,`messageFlowId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESBStatAgg_DAYS`
--

DROP TABLE IF EXISTS `ESBStatAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESBStatAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESBStatAgg_HOURS`
--

DROP TABLE IF EXISTS `ESBStatAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESBStatAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESBStatAgg_MINUTES`
--

DROP TABLE IF EXISTS `ESBStatAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESBStatAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESBStatAgg_MONTHS`
--

DROP TABLE IF EXISTS `ESBStatAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESBStatAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESBStatAgg_SECONDS`
--

DROP TABLE IF EXISTS `ESBStatAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESBStatAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESBStatAgg_YEARS`
--

DROP TABLE IF EXISTS `ESBStatAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ESBStatAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `eventTimestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediatorStatAgg_DAYS`
--

DROP TABLE IF EXISTS `MediatorStatAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediatorStatAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `entryPointHashcode` varchar(254) NOT NULL,
  `hashCode` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`,`entryPointHashcode`,`hashCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediatorStatAgg_HOURS`
--

DROP TABLE IF EXISTS `MediatorStatAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediatorStatAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `entryPointHashcode` varchar(254) NOT NULL,
  `hashCode` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`,`entryPointHashcode`,`hashCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediatorStatAgg_MINUTES`
--

DROP TABLE IF EXISTS `MediatorStatAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediatorStatAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `entryPointHashcode` varchar(254) NOT NULL,
  `hashCode` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`,`entryPointHashcode`,`hashCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediatorStatAgg_MONTHS`
--

DROP TABLE IF EXISTS `MediatorStatAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediatorStatAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `entryPointHashcode` varchar(254) NOT NULL,
  `hashCode` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`,`entryPointHashcode`,`hashCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediatorStatAgg_SECONDS`
--

DROP TABLE IF EXISTS `MediatorStatAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediatorStatAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `entryPointHashcode` varchar(254) NOT NULL,
  `hashCode` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`,`entryPointHashcode`,`hashCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MediatorStatAgg_YEARS`
--

DROP TABLE IF EXISTS `MediatorStatAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MediatorStatAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `metaTenantId` int(11) NOT NULL,
  `componentId` varchar(254) NOT NULL,
  `componentName` varchar(254) NOT NULL,
  `componentType` varchar(254) NOT NULL,
  `entryPoint` varchar(254) NOT NULL,
  `entryPointHashcode` varchar(254) NOT NULL,
  `hashCode` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `startTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_duration` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_MIN_duration` bigint(20) DEFAULT NULL,
  `AGG_MAX_duration` bigint(20) DEFAULT NULL,
  `AGG_SUM_faultCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`metaTenantId`,`componentId`,`componentName`,`componentType`,`entryPoint`,`entryPointHashcode`,`hashCode`)
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
