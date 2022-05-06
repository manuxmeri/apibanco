-- MySQL Script generated by MySQL Workbench
-- Mon Nov 16 07:51:40 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema banco
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `banco` ;

-- -----------------------------------------------------
-- Schema banco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `banco` DEFAULT CHARACTER SET utf8 ;
USE `banco` ;

-- -----------------------------------------------------
-- Table `banco`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banco`.`cliente` ;

CREATE TABLE IF NOT EXISTS `banco`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(75) NOT NULL,
  `apellido` VARCHAR(75) NOT NULL,
  `telefono` VARCHAR(8) NOT NULL,
  `correo` VARCHAR(85) NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`tipo_transaccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banco`.`tipo_transaccion` ;

CREATE TABLE IF NOT EXISTS `banco`.`tipo_transaccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(65) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descripcion_UNIQUE` (`descripcion` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`cuenta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banco`.`cuenta` ;

CREATE TABLE IF NOT EXISTS `banco`.`cuenta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `moneda` VARCHAR(3) NOT NULL,
  `fondo` DECIMAL(8,2) NOT NULL,
  `cliente_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cuenta_cliente_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_cuenta_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `banco`.`cliente` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`transaccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `banco`.`transaccion` ;

CREATE TABLE IF NOT EXISTS `banco`.`transaccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuenta_id` INT NOT NULL,
  `tipo_transaccion_id` INT NOT NULL,
  `monto` DECIMAL(8,2) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transaccion_cuenta1_idx` (`cuenta_id` ASC),
  INDEX `fk_transaccion_tipo_transaccion1_idx` (`tipo_transaccion_id` ASC),
  CONSTRAINT `fk_transaccion_cuenta`
    FOREIGN KEY (`cuenta_id`)
    REFERENCES `banco`.`cuenta` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_transaccion_tipo_transaccion`
    FOREIGN KEY (`tipo_transaccion_id`)
    REFERENCES `banco`.`tipo_transaccion` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banco`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(65) NOT NULL,
  `username` VARCHAR(10) NOT NULL,
  `password` TEXT NOT NULL,
  `rol_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_rol_idx` (`rol_id` ASC),
  CONSTRAINT `fk_usuario_rol`
    FOREIGN KEY (`rol_id`)
    REFERENCES `banco`.`rol` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (1,"Caleb","Stewart","57543123","auctor@Duiscursus.org","2020-07-07 12:48:24","2020-05-20 15:03:12"),(2,"Troy","Hendricks","14858756","Aenean@risus.com","2020-09-28 16:17:51","2021-08-09 03:57:12"),(3,"Nora","Wooten","46887978","mi.Aliquam.gravida@metusurna.co.uk","2020-08-17 05:26:20","2020-02-09 05:22:56"),(4,"Leigh","Benton","60772660","purus.mauris.a@sociis.org","2019-10-08 18:29:52","2019-12-09 19:38:34"),(5,"Hu","Joseph","75097028","sed.libero.Proin@nondapibus.co.uk","2019-11-22 16:40:20","2021-07-07 03:32:21"),(6,"Kirk","Snider","82497678","tellus@Aeneaneuismodmauris.net","2021-06-26 20:24:06","2021-08-16 08:11:41"),(7,"Wylie","Estes","59942745","ante.ipsum.primis@In.org","2021-04-28 16:45:22","2020-03-25 19:12:51"),(8,"Jaden","Hoffman","91471748","laoreet.posuere@dictumplacerat.co.uk","2020-03-18 16:12:46","2021-09-04 08:04:18"),(9,"Joshua","Herring","54484553","Nam.nulla@magna.net","2020-12-25 22:46:21","2020-02-26 20:50:42"),(10,"Kamal","Holden","85300273","odio.Phasellus@nisiAenean.com","2021-06-13 22:09:28","2020-05-09 01:04:01");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (11,"Grady","White","32837177","egestas@cursuset.net","2021-08-22 08:07:00","2021-07-18 12:32:00"),(12,"Denton","Mcfadden","37857564","a.auctor.non@semperpretiumneque.co.uk","2021-11-22 19:12:09","2020-08-24 09:20:31"),(13,"Nora","Craig","57999556","odio@Inmipede.net","2021-05-13 14:28:45","2021-01-05 20:09:01"),(14,"Colt","Cotton","13160816","semper.pretium@erategetipsum.org","2019-11-28 07:11:59","2020-08-03 16:16:37"),(15,"Xavier","Hardin","86413559","tellus@vel.edu","2020-08-11 03:21:08","2019-11-04 07:30:11"),(16,"Kelsey","Morris","81977398","tincidunt.nibh@nullaCraseu.co.uk","2019-11-25 10:40:08","2021-02-20 19:06:28"),(17,"Leslie","Weber","54581409","nulla@ultriciesornare.net","2021-03-24 10:44:46","2020-01-09 10:01:06"),(18,"Oren","Carr","82784141","non.enim.commodo@neque.edu","2021-02-15 09:07:13","2021-05-26 22:16:51"),(19,"Emma","Leon","96434717","dolor@neque.org","2021-03-28 01:30:24","2021-09-05 09:42:26"),(20,"Gray","Clay","10759081","Morbi@elitEtiam.com","2020-06-11 05:57:55","2021-11-19 19:34:25");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (21,"Quinn","Russell","46775476","semper.et@magna.org","2020-08-13 23:37:20","2020-01-27 10:01:56"),(22,"McKenzie","Browning","91480544","est.ac.facilisis@pede.co.uk","2021-09-17 00:21:49","2020-06-09 18:10:44"),(23,"Kasper","Montgomery","26520645","porttitor@afelis.org","2019-10-17 05:32:11","2020-01-12 01:12:07"),(24,"Hedwig","Warren","88868739","magna.Praesent@velit.ca","2021-03-23 15:39:51","2020-02-04 16:43:29"),(25,"Driscoll","Santiago","26454705","Nam.tempor@Utnecurna.com","2020-05-08 21:04:56","2020-11-17 00:26:54"),(26,"Lane","Barnes","81999325","urna.nec@magnaa.com","2019-10-27 17:45:35","2021-05-21 23:07:33"),(27,"Jenna","Fox","30428935","Cras.vulputate@gravida.com","2021-05-30 19:12:10","2019-11-08 00:55:11"),(28,"Ivor","Hunter","64304627","malesuada.malesuada.Integer@mauriselitdictum.edu","2021-09-07 22:37:34","2019-11-07 12:42:47"),(29,"Iola","Graham","88816998","at.fringilla@sapien.net","2021-01-30 15:26:00","2021-11-07 04:37:07"),(30,"Garrison","Knowles","93109307","tempor.diam.dictum@aliquamarcu.net","2021-07-15 14:23:46","2021-04-25 16:59:57");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (31,"Owen","Harris","86175200","leo.elementum.sem@aauctor.edu","2021-08-28 13:49:41","2020-10-01 15:49:16"),(32,"Jemima","Barr","10857326","tortor@ultriciesornare.edu","2021-07-06 12:45:31","2020-01-29 16:37:37"),(33,"Kareem","Cote","23587805","Maecenas@erat.com","2021-04-25 19:14:06","2021-10-15 17:18:46"),(34,"Fitzgerald","Mays","30375653","leo@estmauris.ca","2021-07-22 12:52:17","2021-10-11 18:26:30"),(35,"Yoko","Carver","70702101","vehicula@porttitorscelerisque.edu","2020-01-14 10:44:04","2021-08-19 09:42:42"),(36,"Echo","Blevins","25080181","Quisque@Pellentesqueultriciesdignissim.co.uk","2020-02-06 02:31:54","2021-09-24 16:31:07"),(37,"Slade","Estrada","58531970","sapien.imperdiet.ornare@estNuncullamcorper.org","2020-02-12 19:15:31","2021-09-28 12:34:11"),(38,"Ralph","Frederick","67665926","Nullam.scelerisque@feugiat.ca","2019-12-28 10:20:15","2020-07-22 03:09:50"),(39,"Walker","Shaw","22362906","Nunc.laoreet@diam.net","2020-03-12 18:06:42","2020-06-25 05:26:40"),(40,"Cheryl","Obrien","97749149","metus@magnaetipsum.edu","2019-12-17 10:49:00","2021-03-05 00:42:31");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (41,"Wyatt","Harrington","75923786","pellentesque@Cras.ca","2021-11-07 21:57:18","2021-01-22 04:34:11"),(42,"Quentin","Fox","66126978","et.malesuada.fames@vitaesemper.org","2020-12-04 11:38:11","2021-10-03 23:12:20"),(43,"Ishmael","Rose","30377155","Donec.dignissim.magna@sed.net","2021-11-12 02:50:41","2021-09-02 03:06:09"),(44,"Seth","Kelly","03629590","tellus.justo@massa.com","2019-11-15 11:15:17","2020-08-29 18:07:17"),(45,"Marvin","Combs","67836404","lectus.Cum@Proinvel.org","2021-03-12 18:51:20","2021-10-27 05:45:58"),(46,"Nerea","Foley","72223826","aliquet@mollisvitae.ca","2020-11-10 15:38:23","2021-11-18 19:14:18"),(47,"Zorita","Kelley","24469290","ante@acmattis.net","2019-10-16 10:28:51","2021-08-12 16:50:39"),(48,"Kameko","Villarreal","46565531","parturient@et.org","2020-05-13 15:50:02","2021-04-27 14:47:45"),(49,"Branden","Griffith","29540975","ac.orci@antelectus.ca","2020-10-28 10:09:13","2020-10-20 16:24:45"),(50,"April","Morrow","16160750","elit.a@aliquet.com","2021-08-17 04:30:53","2021-07-06 05:18:23");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (51,"Cara","Wilkinson","33226982","mus.Donec@neque.co.uk","2020-09-06 11:41:50","2020-03-19 10:25:26"),(52,"Chadwick","Vazquez","76386561","ligula.Aenean@ullamcorpervelitin.edu","2020-06-28 05:17:02","2020-06-03 06:18:25"),(53,"Katelyn","Sanchez","03580314","Curabitur.dictum@inaliquetlobortis.co.uk","2019-11-17 03:14:46","2020-03-31 23:30:23"),(54,"Nina","Reynolds","59173299","a@vehiculaet.org","2021-11-14 08:34:15","2021-07-01 13:10:51"),(55,"Salvador","Olsen","82288531","Nunc.pulvinar@non.net","2020-12-24 05:26:58","2021-07-14 05:50:05"),(56,"Wylie","Ramos","22515382","eu.nulla@ultricesa.ca","2021-06-14 14:23:54","2021-03-21 16:42:27"),(57,"Philip","Gallagher","64459998","placerat@vitaeodio.edu","2020-03-04 17:36:20","2021-02-23 01:32:21"),(58,"Todd","Hartman","70178762","et.netus.et@Donecconsectetuer.com","2020-04-22 20:34:41","2021-03-15 22:35:12"),(59,"Quinlan","Davidson","46840082","in.dolor.Fusce@estNunc.com","2020-02-02 09:07:04","2021-06-18 06:49:06"),(60,"Stephanie","Ware","29745139","Integer.eu.lacus@nuncQuisqueornare.net","2019-10-15 17:18:49","2020-05-13 18:18:22");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (61,"Lars","Durham","75182250","et.nunc@parturientmontes.org","2021-04-25 21:31:33","2019-11-17 17:55:33"),(62,"Bert","Alford","52304296","felis@Duis.co.uk","2019-12-03 17:26:49","2021-07-19 19:44:26"),(63,"Ursa","Murray","03901184","ut@leoVivamus.edu","2021-01-18 04:58:26","2021-09-02 10:03:30"),(64,"Katell","Henderson","90356851","massa.Mauris.vestibulum@perconubia.co.uk","2019-11-03 20:04:55","2021-09-23 18:09:12"),(65,"Dorian","Jacobs","74836633","Vivamus@parturientmontes.co.uk","2021-02-27 19:35:26","2021-06-09 21:38:20"),(66,"Eaton","Carlson","71809738","ac.libero.nec@sed.com","2021-01-10 07:25:15","2020-02-06 14:00:57"),(67,"Ray","Larson","49387606","purus@nunc.co.uk","2020-02-17 15:33:49","2020-04-27 17:11:01"),(68,"Halee","Roy","99285622","mattis.Integer@eusemPellentesque.edu","2019-12-16 01:50:22","2020-07-22 15:51:33"),(69,"Fletcher","Hickman","56473291","ultricies.ligula.Nullam@Nunccommodoauctor.org","2021-06-14 00:33:26","2020-04-30 00:26:19"),(70,"Kaseem","Stafford","63369574","dolor.Quisque@ametorciUt.com","2020-02-19 04:33:50","2020-08-31 18:26:53");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (71,"Xenos","Olsen","29341507","scelerisque.mollis.Phasellus@urnaNunc.ca","2020-03-26 14:03:28","2020-09-23 09:53:31"),(72,"Mia","Langley","47282760","lobortis.quam@tristiquealiquetPhasellus.net","2020-02-15 10:47:03","2020-01-29 21:18:17"),(73,"Beatrice","Lester","03198187","aliquam.iaculis.lacus@nisinibhlacinia.ca","2021-08-05 06:32:05","2019-12-09 08:59:01"),(74,"September","Curtis","80305976","Vestibulum.accumsan@Nuncullamcorper.edu","2020-10-11 02:58:02","2020-02-23 05:37:20"),(75,"Lee","Barr","46918244","Duis.dignissim@conubianostra.com","2019-11-28 04:44:14","2020-07-04 10:11:09"),(76,"Chastity","Clarke","95637804","quis@aptenttaciti.net","2020-01-31 18:26:44","2021-11-15 01:21:21"),(77,"Avram","Warren","97745055","diam@ultriciessemmagna.edu","2019-10-23 14:18:55","2021-07-09 20:27:18"),(78,"Prescott","Rosales","06377645","Donec@augueSedmolestie.net","2020-09-01 04:03:21","2020-09-14 15:05:34"),(79,"Callie","Stout","20897808","iaculis.enim.sit@elitfermentumrisus.co.uk","2019-10-03 21:10:21","2020-07-24 09:18:27"),(80,"Kimberly","Tanner","72907855","diam@Nuncac.co.uk","2020-02-27 02:27:53","2019-12-10 13:41:12");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (81,"Ulla","Underwood","84115992","ipsum@magnaetipsum.co.uk","2021-11-14 11:53:58","2021-04-05 04:26:50"),(82,"Carly","Johnston","62443261","Morbi.sit@egestashendreritneque.com","2020-07-20 20:40:06","2021-01-29 11:42:31"),(83,"Bevis","Lloyd","64703480","felis.purus@risusMorbimetus.ca","2021-02-05 21:05:40","2020-05-14 03:50:32"),(84,"Hoyt","Morgan","21504143","nibh@mi.ca","2019-10-31 10:06:10","2021-04-19 00:09:01"),(85,"Phelan","Guerra","40989402","primis.in.faucibus@faucibusorciluctus.com","2021-03-28 20:27:08","2020-10-19 04:33:47"),(86,"Bethany","Wells","19426192","tellus.id@arcuVestibulum.ca","2021-07-30 21:46:44","2020-11-14 14:25:25"),(87,"Ignatius","Mcclure","94252332","dolor@ultricesposuerecubilia.co.uk","2020-10-25 10:34:24","2021-10-27 09:59:17"),(88,"Justine","Vincent","83595487","dictum@Donecfeugiatmetus.ca","2020-09-13 09:23:32","2021-03-09 10:51:23"),(89,"Quail","Dalton","67188015","aliquet@semperegestas.edu","2021-06-22 01:39:44","2019-11-04 10:37:19"),(90,"Angelica","Guthrie","14837518","quis.diam.Pellentesque@tristique.com","2021-01-03 10:02:22","2021-05-09 08:44:02");
INSERT INTO `cliente` (`id`,`nombre`,`apellido`,`telefono`,`correo`,`created_at`,`updated_at`) VALUES (91,"Deborah","Conway","14419156","mus.Donec@elitCurabitur.co.uk","2021-01-16 03:36:24","2020-11-24 08:19:17"),(92,"Macey","Bernard","61262221","Nulla@egestas.com","2019-10-18 08:18:15","2020-01-10 15:01:17"),(93,"Brenda","Flynn","54448702","Nunc.mauris.Morbi@dolor.org","2021-02-20 20:47:57","2020-03-11 14:22:30"),(94,"Hunter","Lang","77234117","lectus.pede.et@ligulaelit.org","2021-11-10 00:42:39","2021-07-26 10:57:32"),(95,"Ashely","Nicholson","41163492","amet.faucibus@vel.com","2021-01-27 03:37:18","2021-01-17 02:55:12"),(96,"Montana","Bass","11294237","auctor.vitae.aliquet@semegestasblandit.net","2019-10-05 08:03:32","2020-11-09 22:20:43"),(97,"Taylor","Mckay","07024025","taciti.sociosqu.ad@interdumenimnon.co.uk","2020-01-20 02:56:29","2021-03-23 16:03:26"),(98,"Zoe","Watson","74529781","Integer@penatibusetmagnis.com","2020-01-10 10:31:44","2021-05-03 16:52:42"),(99,"Casey","Wright","00779312","nunc.sed@neque.org","2020-03-30 15:02:26","2019-11-08 00:12:20"),(100,"Daniel","Smith","32437544","Mauris.magna@pellentesqueegetdictum.co.uk","2020-09-17 22:54:22","2021-07-26 07:07:56");