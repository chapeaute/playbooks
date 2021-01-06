-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: WSO2_APIM_ANALYTICS_DB
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
-- Table structure for table `APIM_ReqCountAgg_DAYS`
--

DROP TABLE IF EXISTS `APIM_ReqCountAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIM_ReqCountAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(100) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `applicationName` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_successCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttleCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiName`,`apiVersion`,`apiCreator`,`apiCreatorTenantDomain`,`applicationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APIM_ReqCountAgg_HOURS`
--

DROP TABLE IF EXISTS `APIM_ReqCountAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIM_ReqCountAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(100) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `applicationName` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_successCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttleCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiName`,`apiVersion`,`apiCreator`,`apiCreatorTenantDomain`,`applicationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APIM_ReqCountAgg_MINUTES`
--

DROP TABLE IF EXISTS `APIM_ReqCountAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIM_ReqCountAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(100) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `applicationName` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_successCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttleCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiName`,`apiVersion`,`apiCreator`,`apiCreatorTenantDomain`,`applicationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APIM_ReqCountAgg_MONTHS`
--

DROP TABLE IF EXISTS `APIM_ReqCountAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIM_ReqCountAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(100) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `applicationName` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_successCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttleCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiName`,`apiVersion`,`apiCreator`,`apiCreatorTenantDomain`,`applicationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APIM_ReqCountAgg_SECONDS`
--

DROP TABLE IF EXISTS `APIM_ReqCountAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIM_ReqCountAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(100) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `applicationName` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_successCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttleCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiName`,`apiVersion`,`apiCreator`,`apiCreatorTenantDomain`,`applicationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APIM_ReqCountAgg_YEARS`
--

DROP TABLE IF EXISTS `APIM_ReqCountAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APIM_ReqCountAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(100) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `applicationName` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_successCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttleCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiName`,`apiVersion`,`apiCreator`,`apiCreatorTenantDomain`,`applicationName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiCreatorAlertConfiguration`
--

DROP TABLE IF EXISTS `ApiCreatorAlertConfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiCreatorAlertConfiguration` (
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(254) NOT NULL,
  `apiCreator` varchar(254) NOT NULL,
  `apiCreatorTenantDomain` varchar(254) NOT NULL,
  `thresholdResponseTime` bigint(20) DEFAULT NULL,
  `thresholdBackendTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`apiName`,`apiVersion`,`apiCreator`,`apiCreatorTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiExeTime_DAYS`
--

DROP TABLE IF EXISTS `ApiExeTime_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiExeTime_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_responseTime` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_serviceTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_securityLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttlingLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_requestMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_otherLatency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiExeTime_HOURS`
--

DROP TABLE IF EXISTS `ApiExeTime_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiExeTime_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_responseTime` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_serviceTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_securityLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttlingLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_requestMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_otherLatency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiExeTime_MINUTES`
--

DROP TABLE IF EXISTS `ApiExeTime_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiExeTime_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_responseTime` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_serviceTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_securityLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttlingLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_requestMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_otherLatency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiExeTime_MONTHS`
--

DROP TABLE IF EXISTS `ApiExeTime_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiExeTime_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_responseTime` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_serviceTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_securityLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttlingLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_requestMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_otherLatency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiExeTime_SECONDS`
--

DROP TABLE IF EXISTS `ApiExeTime_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiExeTime_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_responseTime` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_serviceTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_securityLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttlingLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_requestMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_otherLatency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiExeTime_YEARS`
--

DROP TABLE IF EXISTS `ApiExeTime_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiExeTime_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_SUM_responseTime` bigint(20) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_serviceTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendTime` bigint(20) DEFAULT NULL,
  `AGG_SUM_securityLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_throttlingLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_requestMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_responseMedLat` bigint(20) DEFAULT NULL,
  `AGG_SUM_backendLatency` bigint(20) DEFAULT NULL,
  `AGG_SUM_otherLatency` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiFaultyInvocationAgg_DAYS`
--

DROP TABLE IF EXISTS `ApiFaultyInvocationAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiFaultyInvocationAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationConsumerKey` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `requestTimestamp` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiFaultyInvocationAgg_HOURS`
--

DROP TABLE IF EXISTS `ApiFaultyInvocationAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiFaultyInvocationAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationConsumerKey` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `requestTimestamp` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiFaultyInvocationAgg_MINUTES`
--

DROP TABLE IF EXISTS `ApiFaultyInvocationAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiFaultyInvocationAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationConsumerKey` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `requestTimestamp` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiFaultyInvocationAgg_MONTHS`
--

DROP TABLE IF EXISTS `ApiFaultyInvocationAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiFaultyInvocationAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationConsumerKey` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `requestTimestamp` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiFaultyInvocationAgg_SECONDS`
--

DROP TABLE IF EXISTS `ApiFaultyInvocationAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiFaultyInvocationAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationConsumerKey` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `requestTimestamp` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiFaultyInvocationAgg_YEARS`
--

DROP TABLE IF EXISTS `ApiFaultyInvocationAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiFaultyInvocationAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationConsumerKey` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `requestTimestamp` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiLastAccessSummary`
--

DROP TABLE IF EXISTS `ApiLastAccessSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiLastAccessSummary` (
  `apiContext` varchar(254) DEFAULT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) NOT NULL,
  `apiCreatorTenantDomain` varchar(254) NOT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `lastAccessTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`apiName`,`apiCreator`,`apiCreatorTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiPerDestinationAgg_DAYS`
--

DROP TABLE IF EXISTS `ApiPerDestinationAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiPerDestinationAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `destination` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiPerDestinationAgg_HOURS`
--

DROP TABLE IF EXISTS `ApiPerDestinationAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiPerDestinationAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `destination` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiPerDestinationAgg_MINUTES`
--

DROP TABLE IF EXISTS `ApiPerDestinationAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiPerDestinationAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `destination` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiPerDestinationAgg_MONTHS`
--

DROP TABLE IF EXISTS `ApiPerDestinationAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiPerDestinationAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `destination` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiPerDestinationAgg_SECONDS`
--

DROP TABLE IF EXISTS `ApiPerDestinationAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiPerDestinationAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `destination` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiPerDestinationAgg_YEARS`
--

DROP TABLE IF EXISTS `ApiPerDestinationAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiPerDestinationAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `destination` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiResPathPerApp_DAYS`
--

DROP TABLE IF EXISTS `ApiResPathPerApp_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiResPathPerApp_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(200) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(20) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiResPathPerApp_HOURS`
--

DROP TABLE IF EXISTS `ApiResPathPerApp_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiResPathPerApp_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(200) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(20) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiResPathPerApp_MINUTES`
--

DROP TABLE IF EXISTS `ApiResPathPerApp_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiResPathPerApp_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(200) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(20) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiResPathPerApp_MONTHS`
--

DROP TABLE IF EXISTS `ApiResPathPerApp_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiResPathPerApp_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(200) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(20) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiResPathPerApp_SECONDS`
--

DROP TABLE IF EXISTS `ApiResPathPerApp_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiResPathPerApp_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(200) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(20) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiResPathPerApp_YEARS`
--

DROP TABLE IF EXISTS `ApiResPathPerApp_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiResPathPerApp_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(200) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `apiResourceTemplate` varchar(254) NOT NULL,
  `apiMethod` varchar(20) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`apiResourceTemplate`,`apiMethod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiSubAlertConf`
--

DROP TABLE IF EXISTS `ApiSubAlertConf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiSubAlertConf` (
  `applicationId` varchar(254) NOT NULL,
  `subscriber` varchar(254) DEFAULT NULL,
  `apiName` varchar(254) NOT NULL,
  `apiVersion` varchar(254) NOT NULL,
  `thresholdRequestCountPerMin` int(11) DEFAULT NULL,
  PRIMARY KEY (`applicationId`,`apiName`,`apiVersion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiThrottledOutAgg_DAYS`
--

DROP TABLE IF EXISTS `ApiThrottledOutAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiThrottledOutAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `throttledOutReason` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `subscriber` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`throttledOutReason`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiThrottledOutAgg_HOURS`
--

DROP TABLE IF EXISTS `ApiThrottledOutAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiThrottledOutAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `throttledOutReason` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `subscriber` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`throttledOutReason`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiThrottledOutAgg_MINUTES`
--

DROP TABLE IF EXISTS `ApiThrottledOutAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiThrottledOutAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `throttledOutReason` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `subscriber` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`throttledOutReason`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiThrottledOutAgg_MONTHS`
--

DROP TABLE IF EXISTS `ApiThrottledOutAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiThrottledOutAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `throttledOutReason` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `subscriber` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`throttledOutReason`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiThrottledOutAgg_SECONDS`
--

DROP TABLE IF EXISTS `ApiThrottledOutAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiThrottledOutAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `throttledOutReason` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `subscriber` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`throttledOutReason`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiThrottledOutAgg_YEARS`
--

DROP TABLE IF EXISTS `ApiThrottledOutAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiThrottledOutAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `throttledOutReason` varchar(254) NOT NULL,
  `hostname` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `subscriber` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`applicationId`,`throttledOutReason`,`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserBrowserAgg_DAYS`
--

DROP TABLE IF EXISTS `ApiUserBrowserAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserBrowserAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `operatingSystem` varchar(254) NOT NULL,
  `browser` varchar(200) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiCreator`,`apiCreatorTenantDomain`,`operatingSystem`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserBrowserAgg_HOURS`
--

DROP TABLE IF EXISTS `ApiUserBrowserAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserBrowserAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `operatingSystem` varchar(254) NOT NULL,
  `browser` varchar(200) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiCreator`,`apiCreatorTenantDomain`,`operatingSystem`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserBrowserAgg_MINUTES`
--

DROP TABLE IF EXISTS `ApiUserBrowserAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserBrowserAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `operatingSystem` varchar(254) NOT NULL,
  `browser` varchar(200) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiCreator`,`apiCreatorTenantDomain`,`operatingSystem`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserBrowserAgg_MONTHS`
--

DROP TABLE IF EXISTS `ApiUserBrowserAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserBrowserAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `operatingSystem` varchar(254) NOT NULL,
  `browser` varchar(200) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiCreator`,`apiCreatorTenantDomain`,`operatingSystem`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserBrowserAgg_SECONDS`
--

DROP TABLE IF EXISTS `ApiUserBrowserAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserBrowserAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `operatingSystem` varchar(254) NOT NULL,
  `browser` varchar(200) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiCreator`,`apiCreatorTenantDomain`,`operatingSystem`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserBrowserAgg_YEARS`
--

DROP TABLE IF EXISTS `ApiUserBrowserAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserBrowserAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiCreator` varchar(150) NOT NULL,
  `apiCreatorTenantDomain` varchar(150) NOT NULL,
  `operatingSystem` varchar(254) NOT NULL,
  `browser` varchar(200) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiCreator`,`apiCreatorTenantDomain`,`operatingSystem`,`browser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserPerAppAgg_DAYS`
--

DROP TABLE IF EXISTS `ApiUserPerAppAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserPerAppAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `userTenantDomain` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`username`,`userTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserPerAppAgg_HOURS`
--

DROP TABLE IF EXISTS `ApiUserPerAppAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserPerAppAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `userTenantDomain` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`username`,`userTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserPerAppAgg_MINUTES`
--

DROP TABLE IF EXISTS `ApiUserPerAppAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserPerAppAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `userTenantDomain` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`username`,`userTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserPerAppAgg_MONTHS`
--

DROP TABLE IF EXISTS `ApiUserPerAppAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserPerAppAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `userTenantDomain` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`username`,`userTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserPerAppAgg_SECONDS`
--

DROP TABLE IF EXISTS `ApiUserPerAppAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserPerAppAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `userTenantDomain` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`username`,`userTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiUserPerAppAgg_YEARS`
--

DROP TABLE IF EXISTS `ApiUserPerAppAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiUserPerAppAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `username` varchar(254) NOT NULL,
  `userTenantDomain` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`,`username`,`userTenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiVersionPerAppAgg_DAYS`
--

DROP TABLE IF EXISTS `ApiVersionPerAppAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiVersionPerAppAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_quotaExceededValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiVersionPerAppAgg_HOURS`
--

DROP TABLE IF EXISTS `ApiVersionPerAppAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiVersionPerAppAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_quotaExceededValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiVersionPerAppAgg_MINUTES`
--

DROP TABLE IF EXISTS `ApiVersionPerAppAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiVersionPerAppAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_quotaExceededValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiVersionPerAppAgg_MONTHS`
--

DROP TABLE IF EXISTS `ApiVersionPerAppAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiVersionPerAppAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_quotaExceededValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiVersionPerAppAgg_SECONDS`
--

DROP TABLE IF EXISTS `ApiVersionPerAppAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiVersionPerAppAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_quotaExceededValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApiVersionPerAppAgg_YEARS`
--

DROP TABLE IF EXISTS `ApiVersionPerAppAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApiVersionPerAppAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `apiHostname` varchar(254) NOT NULL,
  `applicationId` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `gatewayType` varchar(254) DEFAULT NULL,
  `label` varchar(254) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  `AGG_COUNT` bigint(20) DEFAULT NULL,
  `AGG_SUM_quotaExceededValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`apiHostname`,`applicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimAbnormalBackendTimeAlert`
--

DROP TABLE IF EXISTS `ApimAbnormalBackendTimeAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimAbnormalBackendTimeAlert` (
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `apiResourceTemplate` varchar(254) DEFAULT NULL,
  `apiMethod` varchar(254) DEFAULT NULL,
  `backendTime` bigint(20) DEFAULT NULL,
  `thresholdBackendTime` bigint(20) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimAbnormalReqAlert`
--

DROP TABLE IF EXISTS `ApimAbnormalReqAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimAbnormalReqAlert` (
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `requestCountPerMin` bigint(20) DEFAULT NULL,
  `thresholdRequestCountPerMin` int(11) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimAbnormalResponseTimeAlert`
--

DROP TABLE IF EXISTS `ApimAbnormalResponseTimeAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimAbnormalResponseTimeAlert` (
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `apiResourceTemplate` varchar(254) DEFAULT NULL,
  `apiMethod` varchar(254) DEFAULT NULL,
  `responseTime` bigint(20) DEFAULT NULL,
  `thresholdResponseTime` bigint(20) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimAlertStakeholderInfo`
--

DROP TABLE IF EXISTS `ApimAlertStakeholderInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimAlertStakeholderInfo` (
  `userId` varchar(254) NOT NULL,
  `alertTypes` varchar(254) DEFAULT NULL,
  `emails` varchar(254) DEFAULT NULL,
  `isSubscriber` tinyint(1) NOT NULL,
  `isPublisher` tinyint(1) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`userId`,`isSubscriber`,`isPublisher`,`isAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimAllAlert`
--

DROP TABLE IF EXISTS `ApimAllAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimAllAlert` (
  `type` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimIPAccessAbnormalityAlert`
--

DROP TABLE IF EXISTS `ApimIPAccessAbnormalityAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimIPAccessAbnormalityAlert` (
  `type` varchar(254) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `ip` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `requestTimestamp` bigint(20) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimIPAccessAlertCount`
--

DROP TABLE IF EXISTS `ApimIPAccessAlertCount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimIPAccessAlertCount` (
  `username` varchar(254) NOT NULL,
  `applicationConsumerKey` varchar(254) NOT NULL,
  `requestCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`applicationConsumerKey`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimIPAccessSummary`
--

DROP TABLE IF EXISTS `ApimIPAccessSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimIPAccessSummary` (
  `username` varchar(254) DEFAULT NULL,
  `applicationConsumerKey` varchar(254) NOT NULL,
  `ip` varchar(254) NOT NULL,
  `lastAccessedDate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`applicationConsumerKey`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimRequestPatternChangedAlert`
--

DROP TABLE IF EXISTS `ApimRequestPatternChangedAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimRequestPatternChangedAlert` (
  `username` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `applicationOwner` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ApimTierLimitHittingAlert`
--

DROP TABLE IF EXISTS `ApimTierLimitHittingAlert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ApimTierLimitHittingAlert` (
  `subscriber` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `applicationId` varchar(254) DEFAULT NULL,
  `applicationName` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `message` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeoLocationAgg_DAYS`
--

DROP TABLE IF EXISTS `GeoLocationAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoLocationAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `country` varchar(254) NOT NULL,
  `city` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `totalCount` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`country`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeoLocationAgg_HOURS`
--

DROP TABLE IF EXISTS `GeoLocationAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoLocationAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `country` varchar(254) NOT NULL,
  `city` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `totalCount` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`country`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeoLocationAgg_MINUTES`
--

DROP TABLE IF EXISTS `GeoLocationAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoLocationAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `country` varchar(254) NOT NULL,
  `city` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `totalCount` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`country`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeoLocationAgg_MONTHS`
--

DROP TABLE IF EXISTS `GeoLocationAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoLocationAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `country` varchar(254) NOT NULL,
  `city` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `totalCount` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`country`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeoLocationAgg_SECONDS`
--

DROP TABLE IF EXISTS `GeoLocationAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoLocationAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `country` varchar(254) NOT NULL,
  `city` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `totalCount` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`country`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GeoLocationAgg_YEARS`
--

DROP TABLE IF EXISTS `GeoLocationAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GeoLocationAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `apiContext` varchar(254) NOT NULL,
  `country` varchar(254) NOT NULL,
  `city` varchar(254) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `apiName` varchar(254) DEFAULT NULL,
  `apiVersion` varchar(254) DEFAULT NULL,
  `apiCreator` varchar(254) DEFAULT NULL,
  `apiCreatorTenantDomain` varchar(254) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userTenantDomain` varchar(254) DEFAULT NULL,
  `totalCount` bigint(20) DEFAULT NULL,
  `regionalID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`apiContext`,`country`,`city`)
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
