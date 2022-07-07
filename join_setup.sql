/*******************************************************************************
   JOIN exercises database - Version 0.1
   Script: join_setup.sql
   Description: Creates and populates the join exercise database.
   DB Server: MariaDB
   Author: Johan Camp
   License: https://github.com/campsight/data_essentials_22_23/blob/main/LICENSE
********************************************************************************/

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `JOIN_EX`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `JOIN_EX`;


USE `JOIN_EX`;


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE `Item`
(
    `ID` INT NOT NULL,
    `Object` NVARCHAR(50) NOT NULL,
    `ColorId` INT,
    CONSTRAINT `PK_item` PRIMARY KEY  (`ID`)
);

CREATE TABLE `Color`
(
    `ID` INT NOT NULL,
    `Color` NVARCHAR(30) NOT NULL,
    CONSTRAINT `PK_color` PRIMARY KEY (`ID`)
);

CREATE TABLE `Person`
(
    `ID` INT NOT NULL,
    `Name` NVARCHAR(50) NOT NULL,
    `ChildID` INT,
    CONSTRAINT `PK_Person` PRIMARY KEY (`ID`)
);

CREATE TABLE `Lector`
(
    `ID` INT NOT NULL,
    `Naam` NVARCHAR(50) NOT NULL,
    `Email` NVARCHAR(100) NOT NULL,
    CONSTRAINT `PK_Lector` PRIMARY KEY (`ID`)
);

CREATE TABLE `Vak`
(
    `ID` INT NOT NULL,
    `Naam` NVARCHAR(100) NOT NULL,
    `Studiepunten` INTEGER NOT NULL,
    CONSTRAINT `PK_Vak` PRIMARY KEY (`ID`)
);

CREATE TABLE `WordtGegevenDoor`
(
    `VakID` INT NOT NULL,
    `LectorID` INT NOT NULL,
    CONSTRAINT `FK_Vak` FOREIGN KEY (`VakID`) REFERENCES `Vak` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `FK_Lector` FOREIGN KEY (`LectorID`) REFERENCES `Lector` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE `Item` ADD CONSTRAINT `FK_ItemColorId`
    FOREIGN KEY (`ColorID`) REFERENCES `Color` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_ItemColorId` ON `Item` (`ColorID`);

ALTER TABLE `Person` ADD CONSTRAINT `FK_ChildId`
    FOREIGN KEY (`ChildId`) REFERENCES `Person` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_PersonChildId` ON `Person` (`ChildID`);

/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO `Color` (`ID`, `Color`) VALUES (101, N'Rood');
INSERT INTO `Color` (`ID`, `Color`) VALUES (104, N'Blauw');
INSERT INTO `Color` (`ID`, `Color`) VALUES (106, N'Groen');
INSERT INTO `Color` (`ID`, `Color`) VALUES (109, N'Geel');
INSERT INTO `Color` (`ID`, `Color`) VALUES (111, N'Paars');


INSERT INTO `Item` (`ID`, `Object`, `ColorID`) VALUES (1, N'Kop', 101);
INSERT INTO `Item` (`ID`, `Object`, `ColorID`) VALUES (2, N'Bord', 101);
INSERT INTO `Item` (`ID`, `Object`, `ColorID`) VALUES (4, N'Bord', 109);
INSERT INTO `Item` (`ID`, `Object`) VALUES (6, N'Glas');

INSERT INTO `Person` (`ID`, `Name`) VALUES (1, N'Dirk');
INSERT INTO `Person` (`ID`, `Name`) VALUES (2, N'Thomas');
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (10, N'Johan', 1);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (11, N'Nele', 1);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (12, N'Jef', 2);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (13, N'Marie', 2);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (100, N'Frans', 10);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (101, N'Rita', 10);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (102, N'Wies', 11);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (103, N'Jan', 11);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (104, N'Pieter', 12);
INSERT INTO `Person` (`ID`, `Name`, `ChildID`) VALUES (105, N'Helena', 13);

INSERT INTO `Lector` (`ID`, `Naam`, `Email`) VALUES (3, N'Johan Camp', N'johan.camp@pxl.be');
INSERT INTO `Lector` (`ID`, `Naam`, `Email`) VALUES (2, N'Nele Custers', N'nele.custers@pxl.be');
INSERT INTO `Lector` (`ID`, `Naam`, `Email`) VALUES (1, N'Tom Schuyten', N'tom.schuyten@pxl.be');

INSERT INTO `Vak` (`ID`, `Naam`, `Studiepunten`) VALUES (1, N'Data Essentials', 5);
INSERT INTO `Vak` (`ID`, `Naam`, `Studiepunten`) VALUES (2, N'Data Analysis & SQL', 4);
INSERT INTO `Vak` (`ID`, `Naam`, `Studiepunten`) VALUES (3, N'Java Advanced', 5);
INSERT INTO `Vak` (`ID`, `Naam`, `Studiepunten`) VALUES (4, N'Java Essentials', 4);

INSERT INTO `WordtGegevenDoor` (`VakID`, `LectorID`) VALUES (1, 3);
INSERT INTO `WordtGegevenDoor` (`VakID`, `LectorID`) VALUES (2, 3);
INSERT INTO `WordtGegevenDoor` (`VakID`, `LectorID`) VALUES (3, 2);
INSERT INTO `WordtGegevenDoor` (`VakID`, `LectorID`) VALUES (3, 1);
INSERT INTO `WordtGegevenDoor` (`VakID`, `LectorID`) VALUES (4, 2);





