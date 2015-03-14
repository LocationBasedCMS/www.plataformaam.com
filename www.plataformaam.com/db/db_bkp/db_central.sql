-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_central
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `UPI`
--

DROP TABLE IF EXISTS `UPI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UPI` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `upitype` int(11) NOT NULL,
  `title` text,
  `description` text,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `upitype` (`upitype`),
  CONSTRAINT `UPI_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UPI_ibfk_2` FOREIGN KEY (`upitype`) REFERENCES `UPIType` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPI`
--

LOCK TABLES `UPI` WRITE;
/*!40000 ALTER TABLE `UPI` DISABLE KEYS */;
/*!40000 ALTER TABLE `UPI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UPIAggregationRuleResponseOf`
--

DROP TABLE IF EXISTS `UPIAggregationRuleResponseOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UPIAggregationRuleResponseOf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upiaggregationrulestart` int(11) NOT NULL COMMENT 'Tipo de resposta a regra inicial',
  `upitype` int(11) NOT NULL COMMENT 'Tipo de UPI da Resposta',
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `requirePositionToResponse` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Requer posicionamento na Base para Responder',
  `requirePositionToView` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Requer presença na base para visualizar.',
  `republisAllowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Permite a republicação de seu conteúdo por Terceiros.',
  `aceptMultiple` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Aceita estrutura de Árvore.',
  PRIMARY KEY (`id`),
  KEY `UPIAggregationRuleStart` (`upiaggregationrulestart`),
  KEY `upitype` (`upitype`),
  CONSTRAINT `UPIAggregationRuleResponseOf_ibfk_4` FOREIGN KEY (`upiaggregationrulestart`) REFERENCES `UPIAggregationRuleStart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UPIAggregationRuleResponseOf_ibfk_7` FOREIGN KEY (`upitype`) REFERENCES `UPIType` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPIAggregationRuleResponseOf`
--

LOCK TABLES `UPIAggregationRuleResponseOf` WRITE;
/*!40000 ALTER TABLE `UPIAggregationRuleResponseOf` DISABLE KEYS */;
/*!40000 ALTER TABLE `UPIAggregationRuleResponseOf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UPIAggregationRuleStart`
--

DROP TABLE IF EXISTS `UPIAggregationRuleStart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UPIAggregationRuleStart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vcombase` int(11) NOT NULL COMMENT 'Base:',
  `upitype` int(11) NOT NULL COMMENT 'Tipo',
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `description` text COMMENT 'Descrição',
  `requirePositionToCreate` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Exigir posição para criar',
  `requirePositionToView` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Exigir posição para visualizar',
  `republisAllowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Permitir Republicação',
  `isSingleton` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Raiz Única (Singleton)',
  `visibleDistance` int(11) NOT NULL DEFAULT '50' COMMENT 'Distância de Visibilidade',
  PRIMARY KEY (`id`),
  KEY `vcombase` (`vcombase`),
  KEY `upitype` (`upitype`),
  CONSTRAINT `UPIAggregationRuleStart_ibfk_5` FOREIGN KEY (`vcombase`) REFERENCES `VComBase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UPIAggregationRuleStart_ibfk_6` FOREIGN KEY (`upitype`) REFERENCES `UPIType` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPIAggregationRuleStart`
--

LOCK TABLES `UPIAggregationRuleStart` WRITE;
/*!40000 ALTER TABLE `UPIAggregationRuleStart` DISABLE KEYS */;
/*!40000 ALTER TABLE `UPIAggregationRuleStart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UPIPosition`
--

DROP TABLE IF EXISTS `UPIPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UPIPosition` (
  `id` int(11) NOT NULL,
  `upi` int(11) NOT NULL,
  `editiontime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `upi_2` (`upi`),
  CONSTRAINT `UPIPosition_ibfk_1` FOREIGN KEY (`upi`) REFERENCES `UPI` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPIPosition`
--

LOCK TABLES `UPIPosition` WRITE;
/*!40000 ALTER TABLE `UPIPosition` DISABLE KEYS */;
/*!40000 ALTER TABLE `UPIPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UPIType`
--

DROP TABLE IF EXISTS `UPIType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UPIType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPIType`
--

LOCK TABLES `UPIType` WRITE;
/*!40000 ALTER TABLE `UPIType` DISABLE KEYS */;
INSERT INTO `UPIType` VALUES (1,'UPIText'),(2,'UPIImage'),(3,'UPIVideo'),(4,'UPIAudio');
/*!40000 ALTER TABLE `UPIType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL COMMENT 'Login',
  `name` varchar(500) NOT NULL COMMENT 'Nome',
  `email` varchar(500) NOT NULL COMMENT 'E-mail',
  `password` varchar(100) NOT NULL COMMENT 'Senha',
  `isExcluded` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Está Excluído',
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Usuários';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'root','Administrador do Sistema','bernard.pereira@dataprev.gov.br','qw',0,NULL),(2,'bernauuudo','Bernard Corrêa Pereira','bernauuudo@yahoo.com.br','qw',0,NULL),(3,'teste','Usuário de Teste','teste@example.com','teste',0,NULL),(8,'aln01','Aluno de Testes 01','aluno01@lied.inf.ufes.br','qw',0,NULL),(9,'aln02','Aluno de Testes 02','aluno02@lied.inf.ufes.br','qw',0,NULL),(10,'installer','Conexão de novos usuários - Usuário do sistema.','conectNewUser@plataformaam.com','739419e9dbbe9aa73bd716d4b3b9d86b',0,0),(11,'eee','eee','eee','eee',0,NULL),(13,'aaaa','aaaaa','aaaa@aaaa.com','aaaa',0,NULL),(14,'ppppppp','fvvvvv','poo','ioooooo',0,NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPosition`
--

DROP TABLE IF EXISTS `UserPosition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPosition` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `currentTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  `latitude` int(11) NOT NULL,
  `longitude` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPosition`
--

LOCK TABLES `UserPosition` WRITE;
/*!40000 ALTER TABLE `UserPosition` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserPosition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserVComUserRole`
--

DROP TABLE IF EXISTS `UserVComUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserVComUserRole` (
  `user` int(11) NOT NULL,
  `vcomuserrole` int(11) NOT NULL,
  PRIMARY KEY (`user`,`vcomuserrole`),
  KEY `vcomuserrole` (`vcomuserrole`),
  CONSTRAINT `UserVComUserRole_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UserVComUserRole_ibfk_2` FOREIGN KEY (`vcomuserrole`) REFERENCES `VComUserRole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserVComUserRole`
--

LOCK TABLES `UserVComUserRole` WRITE;
/*!40000 ALTER TABLE `UserVComUserRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserVComUserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComBase`
--

DROP TABLE IF EXISTS `VComBase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComBase` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `description` text NOT NULL COMMENT 'Descrição',
  `vcomcomposite` int(11) NOT NULL COMMENT 'Composição Pai',
  `virtualspace` int(11) NOT NULL COMMENT 'Espaço Virtual',
  PRIMARY KEY (`id`),
  KEY `vcomcomposite` (`vcomcomposite`),
  KEY `virtualspace` (`virtualspace`),
  CONSTRAINT `VComBase_ibfk_5` FOREIGN KEY (`vcomcomposite`) REFERENCES `VComComposite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComBase_ibfk_6` FOREIGN KEY (`virtualspace`) REFERENCES `VirtualSpace` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComBase`
--

LOCK TABLES `VComBase` WRITE;
/*!40000 ALTER TABLE `VComBase` DISABLE KEYS */;
/*!40000 ALTER TABLE `VComBase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComComposite`
--

DROP TABLE IF EXISTS `VComComposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComComposite` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `description` text COMMENT 'Descrição',
  `virtualspace` int(11) NOT NULL,
  `vcomcomposite` int(11) DEFAULT NULL,
  `createruser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `virtualspace` (`virtualspace`),
  KEY `vcomcomposite` (`vcomcomposite`),
  KEY `createruser` (`createruser`),
  CONSTRAINT `VComComposite_ibfk_10` FOREIGN KEY (`virtualspace`) REFERENCES `VirtualSpace` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComComposite_ibfk_13` FOREIGN KEY (`vcomcomposite`) REFERENCES `VComComposite` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComComposite`
--

LOCK TABLES `VComComposite` WRITE;
/*!40000 ALTER TABLE `VComComposite` DISABLE KEYS */;
INSERT INTO `VComComposite` VALUES (1,'RAIZ','Composição base de toda a estrutura.',1,1,1);
/*!40000 ALTER TABLE `VComComposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComUPIAggregationRuleResponseOf`
--

DROP TABLE IF EXISTS `VComUPIAggregationRuleResponseOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComUPIAggregationRuleResponseOf` (
  `id` int(11) NOT NULL,
  `vcomuserole` int(11) NOT NULL COMMENT 'Define a qual papel esta regra pertence',
  `upiaggregationruleresponseof` int(11) NOT NULL COMMENT 'Define a qual regra de agregação se aplica',
  `allowedRead` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o papel pode ler os Objetos regidos sobre a regra.',
  `allowedWrite` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o papel pode responder a objetos regidos por esta regras',
  PRIMARY KEY (`id`),
  KEY `upiaggregationruleresponseof` (`upiaggregationruleresponseof`),
  KEY `vcomuserole` (`vcomuserole`),
  CONSTRAINT `VComUPIAggregationRuleResponseOf_ibfk_1` FOREIGN KEY (`upiaggregationruleresponseof`) REFERENCES `UPIAggregationRuleResponseOf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComUPIAggregationRuleResponseOf_ibfk_2` FOREIGN KEY (`vcomuserole`) REFERENCES `VComUserRole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComUPIAggregationRuleResponseOf`
--

LOCK TABLES `VComUPIAggregationRuleResponseOf` WRITE;
/*!40000 ALTER TABLE `VComUPIAggregationRuleResponseOf` DISABLE KEYS */;
/*!40000 ALTER TABLE `VComUPIAggregationRuleResponseOf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComUPIAggregationRuleStart`
--

DROP TABLE IF EXISTS `VComUPIAggregationRuleStart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComUPIAggregationRuleStart` (
  `id` int(11) NOT NULL,
  `vcomuserrole` int(11) NOT NULL COMMENT 'Define a qual papel esta regra pertence',
  `upiaggregationrulestart` int(11) NOT NULL COMMENT 'Define a qual regra de agregação se aplica',
  `allowedRead` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o papel visualizará criações sobre esta regra',
  `allowedWrite` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o papel poderá criar sobre esta regra.',
  PRIMARY KEY (`id`),
  KEY `upiaggregationrulestart` (`upiaggregationrulestart`),
  KEY `vcomuserrole` (`vcomuserrole`),
  CONSTRAINT `VComUPIAggregationRuleStart_ibfk_2` FOREIGN KEY (`upiaggregationrulestart`) REFERENCES `UPIAggregationRuleStart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComUPIAggregationRuleStart_ibfk_3` FOREIGN KEY (`vcomuserrole`) REFERENCES `VComUserRole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComUPIAggregationRuleStart`
--

LOCK TABLES `VComUPIAggregationRuleStart` WRITE;
/*!40000 ALTER TABLE `VComUPIAggregationRuleStart` DISABLE KEYS */;
/*!40000 ALTER TABLE `VComUPIAggregationRuleStart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComUPIPublication`
--

DROP TABLE IF EXISTS `VComUPIPublication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComUPIPublication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `vcombase` int(11) NOT NULL,
  `upi` int(11) NOT NULL,
  `upiaggregationrulestart` int(11) DEFAULT NULL,
  `upiaggregationruleresponseof` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `vcombase` (`vcombase`),
  KEY `upi` (`upi`),
  KEY `upiaggregationrulestart` (`upiaggregationrulestart`),
  KEY `upiaggregationruleresponseof` (`upiaggregationruleresponseof`),
  CONSTRAINT `VComUPIPublication_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComUPIPublication_ibfk_2` FOREIGN KEY (`vcombase`) REFERENCES `VComBase` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComUPIPublication_ibfk_3` FOREIGN KEY (`upiaggregationrulestart`) REFERENCES `UPIAggregationRuleStart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComUPIPublication_ibfk_4` FOREIGN KEY (`upiaggregationruleresponseof`) REFERENCES `UPIAggregationRuleResponseOf` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComUPIPublication_ibfk_5` FOREIGN KEY (`upi`) REFERENCES `UPI` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComUPIPublication`
--

LOCK TABLES `VComUPIPublication` WRITE;
/*!40000 ALTER TABLE `VComUPIPublication` DISABLE KEYS */;
/*!40000 ALTER TABLE `VComUPIPublication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComUserRole`
--

DROP TABLE IF EXISTS `VComUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComUserRole` (
  `id` int(11) NOT NULL,
  `vcomcomposite` int(11) NOT NULL DEFAULT '1' COMMENT 'Composição que o papel Pertence',
  `name` varchar(100) NOT NULL COMMENT 'Nome do Papel do Usuário',
  `allowedEditVComAggregationRule` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Permissão para editar as regras de agregação.',
  `allowedEditVCom` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Permissões para Alterações na Composição e nas Bases do VCom',
  `isClientDefault` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Automaticamente selecionado pelo cliente',
  `isClientSelectable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disponível para ser selecionado pelo Usuário do Cliente.',
  `allowedAccessPedagogicalPanel` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Acesso ao painel pedagógico',
  `allowedAccessOnlineMap` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Acesso ao mapa online',
  PRIMARY KEY (`id`),
  KEY `vcomcomposite` (`vcomcomposite`),
  CONSTRAINT `VComUserRole_ibfk_2` FOREIGN KEY (`vcomcomposite`) REFERENCES `VComComposite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Papeis de Usuários no VCom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComUserRole`
--

LOCK TABLES `VComUserRole` WRITE;
/*!40000 ALTER TABLE `VComUserRole` DISABLE KEYS */;
/*!40000 ALTER TABLE `VComUserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualSpace`
--

DROP TABLE IF EXISTS `VirtualSpace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VirtualSpace` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `startLatitude` double NOT NULL COMMENT 'Latitude Inicial',
  `startLongitude` double NOT NULL COMMENT 'Longitude Inicial',
  `stopLatitude` double NOT NULL COMMENT 'Latitude Final',
  `stopLongitude` double NOT NULL COMMENT 'Longitude Final',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VirtualSpace`
--

LOCK TABLES `VirtualSpace` WRITE;
/*!40000 ALTER TABLE `VirtualSpace` DISABLE KEYS */;
INSERT INTO `VirtualSpace` VALUES (1,'Planeta Terra',-90,-180,90,180),(2,'Hemisfério SUL',0,-180,-90,180);
/*!40000 ALTER TABLE `VirtualSpace` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-16  8:20:34
