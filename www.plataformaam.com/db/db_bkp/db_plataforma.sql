-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_plataforma
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
  CONSTRAINT `UPIAggregationRuleResponseOf_ibfk_1` FOREIGN KEY (`upiaggregationrulestart`) REFERENCES `UPIAggregationRuleStart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UPIAggregationRuleResponseOf_ibfk_2` FOREIGN KEY (`upitype`) REFERENCES `UPIType` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPIAggregationRuleResponseOf`
--

LOCK TABLES `UPIAggregationRuleResponseOf` WRITE;
/*!40000 ALTER TABLE `UPIAggregationRuleResponseOf` DISABLE KEYS */;
/*!40000 ALTER TABLE `UPIAggregationRuleResponseOf` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_insert_UPIAGGREGATIONRULERESPONSEOF AFTER INSERT ON UPIAggregationRuleResponseOf
FOR EACH ROW
BEGIN

    INSERT INTO VComUPIAggregationRuleResponseOf (
        vcomuserole, 
       upiaggregationruleresponseof, 
       allowedRead, 
       allowedWrite 
    )
    SELECT  
        VComUserRole.id, 
        NEW.id , 
        1, 
        1  
    FROM        VComUserRole,  VComComposite, VComBase,  UPIAggregationRuleStart
    WHERE       
                    VComComposite.id  = VComUserRole.vcomcomposite 
            AND     VComComposite.id = VComBase.vcomcomposite 
            AND     VComBase.id = UPIAggregationRuleStart.vcombase              
            AND     UPIAggregationRuleStart.id =  NEW.upiaggregationrulestart             ; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `visibleDistance` int(11) NOT NULL COMMENT 'Distância para Visibilidade',
  `republisAllowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Permitir Republicação',
  `isSingleton` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Raiz Única (Singleton)',
  PRIMARY KEY (`id`),
  KEY `vcombase` (`vcombase`),
  KEY `upitype` (`upitype`),
  CONSTRAINT `UPIAggregationRuleStart_ibfk_1` FOREIGN KEY (`vcombase`) REFERENCES `VComBase` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `UPIAggregationRuleStart_ibfk_2` FOREIGN KEY (`upitype`) REFERENCES `UPIType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UPIAggregationRuleStart`
--

LOCK TABLES `UPIAggregationRuleStart` WRITE;
/*!40000 ALTER TABLE `UPIAggregationRuleStart` DISABLE KEYS */;
INSERT INTO `UPIAggregationRuleStart` VALUES (9,12,2,'Regra: Visualizações do Convento da Penha','Fotos tiradas no convento da penha ! ( permitido tratamento )',0,1,200,0,0),(10,13,2,'Regra: Álbum de Foto da Noite Capixaba','Álbum de fotos da noite Capixaba',1,1,200,0,0),(11,14,2,'Regra: Álbum de Fotos do centro histórico','História de onde começou a cidade ! ',0,0,200,0,0);
/*!40000 ALTER TABLE `UPIAggregationRuleStart` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_insert_UPIAGGREGATIONRULESTART AFTER INSERT ON UPIAggregationRuleStart
FOR EACH ROW
BEGIN

   INSERT INTO VComUPIAggregationRuleStart    (   
            vcomuserrole, 
            upiaggregationrulestart, 
            allowedRead, 
            allowedWrite 
        )
        SELECT      
            VComUserRole.id, 
            NEW.id , 
            1, 
            1  
        FROM        VComUserRole,  VComComposite, VComBase 
        WHERE       
                VComComposite.id  = VComUserRole.vcomcomposite 
                AND VComComposite.id = VComBase.vcomcomposite 
                AND VComBase.id = NEW.vcombase; 

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Usuários';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'root','Administrador do Sistema','bernard.pereira@dataprev.gov.br','qw',0),(2,'bernauuudo','Bernard Corrêa Pereira','bernauuudo@yahoo.com.br','qw',0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
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
INSERT INTO `UserVComUserRole` VALUES (2,34),(2,35);
/*!40000 ALTER TABLE `UserVComUserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComBase`
--

DROP TABLE IF EXISTS `VComBase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComBase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `description` text NOT NULL COMMENT 'Descrição',
  `vcomcomposite` int(11) NOT NULL COMMENT 'Composição Pai',
  `virtualspace` int(11) NOT NULL COMMENT 'Espaço Virtual',
  PRIMARY KEY (`id`),
  KEY `vcomcomposite` (`vcomcomposite`),
  KEY `virtualspace` (`virtualspace`),
  CONSTRAINT `VComBase_ibfk_1` FOREIGN KEY (`vcomcomposite`) REFERENCES `VComComposite` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `VComBase_ibfk_2` FOREIGN KEY (`virtualspace`) REFERENCES `VirtualSpace` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComBase`
--

LOCK TABLES `VComBase` WRITE;
/*!40000 ALTER TABLE `VComBase` DISABLE KEYS */;
INSERT INTO `VComBase` VALUES (12,'Enxergando do Alto - Convento da Penha','O Convento da penha possibilita a visão de quase toda a Grande Vitória',31,23),(13,'Noite Capixaba ( Lama + Triângulo )','A Rua da Lama e o Triângulo das Bermudas são áreas das mais populares da noite capixaba ,',31,25),(14,'Vitória Antiga','O centro de Vitória tem suas histórias ! ',31,24);
/*!40000 ALTER TABLE `VComBase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComComposite`
--

DROP TABLE IF EXISTS `VComComposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComComposite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `description` text COMMENT 'Descrição',
  `virtualspace` int(11) NOT NULL,
  `vcomcomposite` int(11) DEFAULT NULL,
  `createruser` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `virtualspace` (`virtualspace`),
  KEY `vcomcomposite` (`vcomcomposite`),
  KEY `createruser` (`createruser`),
  KEY `createruser_2` (`createruser`),
  CONSTRAINT `VComComposite_ibfk_2` FOREIGN KEY (`virtualspace`) REFERENCES `VirtualSpace` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `VComComposite_ibfk_3` FOREIGN KEY (`vcomcomposite`) REFERENCES `VComComposite` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `VComComposite_ibfk_6` FOREIGN KEY (`createruser`) REFERENCES `User` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComComposite`
--

LOCK TABLES `VComComposite` WRITE;
/*!40000 ALTER TABLE `VComComposite` DISABLE KEYS */;
INSERT INTO `VComComposite` VALUES (1,'RAIZ','Composição base de toda a estrutura.',1,1,1),(31,'Fórum de fotografia in loco','Grupo de estudo e de discussão sobre fotografia ',20,1,2);
/*!40000 ALTER TABLE `VComComposite` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_insert_VCOMCOMPOSITE AFTER INSERT ON VComComposite
    FOR EACH ROW
    BEGIN
   

        -- CRIA O ADMINISTRADOR PARA A RAIZ DO VCOM SOMENTE
       --  IF (  NEW.vcomcomposite = 1  )  OR ( NEW.vcomcomposite IS NULL  ) THEN

            -- CRIA O PAPEL DO ADMINISTRADOR DA COMPOSICAO
            -- CRIA O USUÀRIO PADRAO
            INSERT VComUserRole(
                vcomcomposite,
                `name`,
                allowedEditVComAggregationRule,
                allowedEditVCom,
                isClientDefault,	
                isClientSelectable,
                allowedAccessPedagogicalPanel,
                allowedAccessOnlineMap
            )
            VALUES
            (
                NEW.id,
                CONCAT( 'Administrador :',  NEW.`name` ),
                1,
                1,
                0,
                0,
                1,
                1
            ); 

            INSERT VComUserRole(
                vcomcomposite,
                `name`,
                allowedEditVComAggregationRule,
                allowedEditVCom,
                isClientDefault,	
                isClientSelectable,
                allowedAccessPedagogicalPanel,
                allowedAccessOnlineMap
            )
            VALUES            
            (
                NEW.id,
                CONCAT( 'Usuário Padrão :',  NEW.`name` ),
                0,
                0,
                1,
                1,
                0,
                0
            );

            -- ASSOCIA ESTE PAPEL AO USUÀRIO SETADO COMO PROPRIETÀRIO
            INSERT UserVComUserRole ( `user`, vcomuserrole   ) 
            SELECT NEW.createruser, id FROM VComUserRole WHERE vcomcomposite = NEW.id ;

    -- END IF; 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `VComUPIAggregationRuleResponseOf`
--

DROP TABLE IF EXISTS `VComUPIAggregationRuleResponseOf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComUPIAggregationRuleResponseOf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vcomuserrole` int(11) NOT NULL COMMENT 'Define a qual papel esta regra pertence',
  `upiaggregationrulestart` int(11) NOT NULL COMMENT 'Define a qual regra de agregação se aplica',
  `allowedRead` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o papel visualizará criações sobre esta regra',
  `allowedWrite` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Define se o papel poderá criar sobre esta regra.',
  PRIMARY KEY (`id`),
  KEY `upiaggregationrulestart` (`upiaggregationrulestart`),
  KEY `vcomuserrole` (`vcomuserrole`),
  CONSTRAINT `VComUPIAggregationRuleStart_ibfk_2` FOREIGN KEY (`upiaggregationrulestart`) REFERENCES `UPIAggregationRuleStart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VComUPIAggregationRuleStart_ibfk_3` FOREIGN KEY (`vcomuserrole`) REFERENCES `VComUserRole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComUPIAggregationRuleStart`
--

LOCK TABLES `VComUPIAggregationRuleStart` WRITE;
/*!40000 ALTER TABLE `VComUPIAggregationRuleStart` DISABLE KEYS */;
INSERT INTO `VComUPIAggregationRuleStart` VALUES (41,34,9,1,1),(42,35,9,1,1),(44,34,10,1,1),(45,35,10,1,1),(47,34,11,1,1),(48,35,11,1,1);
/*!40000 ALTER TABLE `VComUPIAggregationRuleStart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VComUserRole`
--

DROP TABLE IF EXISTS `VComUserRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VComUserRole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  CONSTRAINT `VComUserRole_ibfk_1` FOREIGN KEY (`vcomcomposite`) REFERENCES `VComComposite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='Papeis de Usuários no VCom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VComUserRole`
--

LOCK TABLES `VComUserRole` WRITE;
/*!40000 ALTER TABLE `VComUserRole` DISABLE KEYS */;
INSERT INTO `VComUserRole` VALUES (34,31,'Administrador :Fórum de fotografia in loco',1,1,0,0,1,1),(35,31,'Usuário Padrão :Fórum de fotografia in loco',0,0,1,1,0,0);
/*!40000 ALTER TABLE `VComUserRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VirtualSpace`
--

DROP TABLE IF EXISTS `VirtualSpace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VirtualSpace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT 'Nome',
  `startLatitude` double NOT NULL COMMENT 'Latitude Inicial',
  `startLongitude` double NOT NULL COMMENT 'Longitude Inicial',
  `stopLatitude` double NOT NULL COMMENT 'Latitude Final',
  `stopLongitude` double NOT NULL COMMENT 'Longitude Final',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VirtualSpace`
--

LOCK TABLES `VirtualSpace` WRITE;
/*!40000 ALTER TABLE `VirtualSpace` DISABLE KEYS */;
INSERT INTO `VirtualSpace` VALUES (1,'Planeta Terra',-90,-180,90,180),(2,'Hemisfério SUL',0,-180,-90,180),(18,'América do Sul',-59.94400716933018,-87.8466796875,18.114529138837,-30.289306640625),(19,'Brasil',-34.597041516144024,-69.9609375,2.460181181021031,-34.453125),(20,'Grande Vitória - ES',-20.607077970830588,-40.786745164062495,-19.952696397543995,-40.138551804687495),(21,'Vitória - ES',-20.32788693887312,-40.351409912109375,-20.2531787026582,-40.229187011719205),(22,'UFES - Universidade Federal do Espírito Santo - Campi Goiabeira',-20.284579870061023,-40.30986785888649,-20.270248843593986,-40.298538208007926),(23,'Convento da Penha  - Vila Velha - ES',-20.33368176110472,-40.29012680053711,-20.326438199388154,-40.28291702270508),(24,'Centro  de  Vitoria - ES',-20.32402360342211,-40.34608840942383,-20.314686811099396,-40.335702896118164),(25,'Triângulo das Bermudas/Rua da Lama - VItória - ES',-20.300841565012387,-40.3033447265625,-20.271215021837108,-40.28411865234341);
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

-- Dump completed on 2014-12-16  8:20:18
