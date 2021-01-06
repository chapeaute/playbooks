-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: WSO2_IS_ANALYTICS_DB
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
-- Table structure for table `ActiveSessionCountTable`
--

DROP TABLE IF EXISTS `ActiveSessionCountTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActiveSessionCountTable` (
  `meta_tenantId` int(11) NOT NULL,
  `activeCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`meta_tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ActiveSessionsTable`
--

DROP TABLE IF EXISTS `ActiveSessionsTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActiveSessionsTable` (
  `meta_tenantId` int(11) NOT NULL,
  `sessionId` varchar(254) NOT NULL,
  `startTimestamp` bigint(20) DEFAULT NULL,
  `renewTimestamp` bigint(20) DEFAULT NULL,
  `terminationTimestamp` bigint(20) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userstoreDomain` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `region` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `serviceProvider` varchar(254) DEFAULT NULL,
  `identityProviders` varchar(254) DEFAULT NULL,
  `rememberMeFlag` tinyint(1) DEFAULT NULL,
  `userAgent` varchar(254) DEFAULT NULL,
  `userStore` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`meta_tenantId`,`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AlertLongSessionsTable`
--

DROP TABLE IF EXISTS `AlertLongSessionsTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlertLongSessionsTable` (
  `timestamp` bigint(20) DEFAULT NULL,
  `currentTime` varchar(254) DEFAULT NULL,
  `meta_tenantId` int(11) NOT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `sessionId` varchar(254) NOT NULL,
  `username` varchar(254) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `avgDuration` double DEFAULT NULL,
  PRIMARY KEY (`meta_tenantId`,`sessionId`),
  KEY `AlertLongSessionsTable_INDEX` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuthStatAgg_DAYS`
--

DROP TABLE IF EXISTS `AuthStatAgg_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthStatAgg_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `localUsername` varchar(254) DEFAULT NULL,
  `rolesCommaSeparated` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuthStatAgg_HOURS`
--

DROP TABLE IF EXISTS `AuthStatAgg_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthStatAgg_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `localUsername` varchar(254) DEFAULT NULL,
  `rolesCommaSeparated` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuthStatAgg_MINUTES`
--

DROP TABLE IF EXISTS `AuthStatAgg_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthStatAgg_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `localUsername` varchar(254) DEFAULT NULL,
  `rolesCommaSeparated` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuthStatAgg_MONTHS`
--

DROP TABLE IF EXISTS `AuthStatAgg_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthStatAgg_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `localUsername` varchar(254) DEFAULT NULL,
  `rolesCommaSeparated` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuthStatAgg_SECONDS`
--

DROP TABLE IF EXISTS `AuthStatAgg_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthStatAgg_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `localUsername` varchar(254) DEFAULT NULL,
  `rolesCommaSeparated` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AuthStatAgg_YEARS`
--

DROP TABLE IF EXISTS `AuthStatAgg_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthStatAgg_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `localUsername` varchar(254) DEFAULT NULL,
  `rolesCommaSeparated` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `OverallAuthTable`
--

DROP TABLE IF EXISTS `OverallAuthTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OverallAuthTable` (
  `meta_tenantId` int(11) NOT NULL,
  `contextId` varchar(254) DEFAULT NULL,
  `eventId` varchar(254) NOT NULL,
  `eventType` varchar(254) NOT NULL,
  `username` varchar(254) DEFAULT NULL,
  `localUsername` varchar(254) DEFAULT NULL,
  `userStoreDomain` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `region` varchar(254) DEFAULT NULL,
  `inboundAuthType` varchar(254) DEFAULT NULL,
  `serviceProvider` varchar(254) DEFAULT NULL,
  `rememberMeEnabled` tinyint(1) DEFAULT NULL,
  `forceAuthEnabled` tinyint(1) DEFAULT NULL,
  `passiveAuthEnabled` tinyint(1) DEFAULT NULL,
  `rolesCommaSeparated` varchar(254) DEFAULT NULL,
  `authenticationStep` varchar(254) DEFAULT NULL,
  `identityProvider` varchar(254) DEFAULT NULL,
  `authenticationSuccess` tinyint(1) DEFAULT NULL,
  `authStepSuccess` tinyint(1) DEFAULT NULL,
  `stepAuthenticator` varchar(254) DEFAULT NULL,
  `isFirstLogin` tinyint(1) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `utcTime` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`meta_tenantId`,`eventId`,`eventType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RoleAggregation_DAYS`
--

DROP TABLE IF EXISTS `RoleAggregation_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleAggregation_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `token` varchar(100) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`token`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RoleAggregation_HOURS`
--

DROP TABLE IF EXISTS `RoleAggregation_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleAggregation_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `token` varchar(100) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`token`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RoleAggregation_MINUTES`
--

DROP TABLE IF EXISTS `RoleAggregation_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleAggregation_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `token` varchar(100) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`token`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RoleAggregation_MONTHS`
--

DROP TABLE IF EXISTS `RoleAggregation_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleAggregation_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `token` varchar(100) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`token`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RoleAggregation_SECONDS`
--

DROP TABLE IF EXISTS `RoleAggregation_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleAggregation_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `token` varchar(100) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`token`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RoleAggregation_YEARS`
--

DROP TABLE IF EXISTS `RoleAggregation_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoleAggregation_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `username` varchar(254) NOT NULL,
  `serviceProvider` varchar(100) NOT NULL,
  `identityProvider` varchar(100) NOT NULL,
  `region` varchar(45) NOT NULL,
  `token` varchar(100) NOT NULL,
  `userStoreDomain` varchar(50) NOT NULL,
  `isFirstLogin` tinyint(1) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `meta_tenantId` int(11) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `identityProviderType` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `AGG_SUM_successValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_failureValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_stepSuccessValue` bigint(20) DEFAULT NULL,
  `AGG_SUM_firstLoginValue` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`username`,`serviceProvider`,`identityProvider`,`region`,`token`,`userStoreDomain`,`isFirstLogin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SecurityAlertTypeTable`
--

DROP TABLE IF EXISTS `SecurityAlertTypeTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecurityAlertTypeTable` (
  `meta_tenantId` int(11) NOT NULL,
  `alertId` varchar(254) NOT NULL,
  `type` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `msg` varchar(254) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `alertTimestamp` bigint(20) DEFAULT NULL,
  `userReadableTime` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`meta_tenantId`,`alertId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionAggregation_DAYS`
--

DROP TABLE IF EXISTS `SessionAggregation_DAYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionAggregation_DAYS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `meta_tenantId` int(11) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `activeSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_newSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_terminatedSessionCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`meta_tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionAggregation_HOURS`
--

DROP TABLE IF EXISTS `SessionAggregation_HOURS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionAggregation_HOURS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `meta_tenantId` int(11) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `activeSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_newSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_terminatedSessionCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`meta_tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionAggregation_MINUTES`
--

DROP TABLE IF EXISTS `SessionAggregation_MINUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionAggregation_MINUTES` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `meta_tenantId` int(11) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `activeSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_newSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_terminatedSessionCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`meta_tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionAggregation_MONTHS`
--

DROP TABLE IF EXISTS `SessionAggregation_MONTHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionAggregation_MONTHS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `meta_tenantId` int(11) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `activeSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_newSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_terminatedSessionCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`meta_tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionAggregation_SECONDS`
--

DROP TABLE IF EXISTS `SessionAggregation_SECONDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionAggregation_SECONDS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `meta_tenantId` int(11) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `activeSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_newSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_terminatedSessionCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`meta_tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionAggregation_YEARS`
--

DROP TABLE IF EXISTS `SessionAggregation_YEARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionAggregation_YEARS` (
  `AGG_TIMESTAMP` bigint(20) NOT NULL,
  `AGG_EVENT_TIMESTAMP` bigint(20) NOT NULL,
  `meta_tenantId` int(11) NOT NULL,
  `AGG_LAST_EVENT_TIMESTAMP` bigint(20) DEFAULT NULL,
  `activeSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_newSessionCount` bigint(20) DEFAULT NULL,
  `AGG_SUM_terminatedSessionCount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AGG_TIMESTAMP`,`AGG_EVENT_TIMESTAMP`,`meta_tenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SessionInformationTable`
--

DROP TABLE IF EXISTS `SessionInformationTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SessionInformationTable` (
  `meta_tenantId` int(11) NOT NULL,
  `sessionId` varchar(254) NOT NULL,
  `startTime` varchar(254) DEFAULT NULL,
  `terminateTime` varchar(254) DEFAULT NULL,
  `endTime` varchar(254) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `username` varchar(254) DEFAULT NULL,
  `userstoreDomain` varchar(254) DEFAULT NULL,
  `remoteIp` varchar(254) DEFAULT NULL,
  `region` varchar(254) DEFAULT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `serviceProvider` varchar(254) DEFAULT NULL,
  `identityProviders` varchar(254) DEFAULT NULL,
  `rememberMeFlag` tinyint(1) DEFAULT NULL,
  `userAgent` varchar(254) DEFAULT NULL,
  `userStore` varchar(254) DEFAULT NULL,
  `currentTime` varchar(254) DEFAULT NULL,
  `startTimestamp` bigint(20) DEFAULT NULL,
  `renewTimestamp` bigint(20) DEFAULT NULL,
  `terminationTimestamp` bigint(20) DEFAULT NULL,
  `endTimestamp` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`meta_tenantId`,`sessionId`),
  KEY `SessionInformationTable_INDEX` (`username`,`userstoreDomain`,`tenantDomain`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SuspiciousAlertTable`
--

DROP TABLE IF EXISTS `SuspiciousAlertTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuspiciousAlertTable` (
  `meta_tenantId` int(11) NOT NULL,
  `username` varchar(254) NOT NULL,
  `severity` int(11) DEFAULT NULL,
  `msg` varchar(254) NOT NULL,
  `tenantDomain` varchar(254) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  `currentTime` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`meta_tenantId`,`username`,`msg`),
  KEY `SuspiciousAlertTable_INDEX` (`username`)
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
