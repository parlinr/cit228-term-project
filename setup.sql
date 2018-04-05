DROP DATABASE IF EXISTS termProject;
CREATE DATABASE termProject;
USE termProject;

-- create tables
CREATE TABLE quarterback (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    year INT,
    week INT,
    touchdowns INT,
    interceptions INT,
    yards INT

);

CREATE TABLE runningBack (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    year INT,
    week INT,
    yards INT,
    touchdowns INT
);

CREATE TABLE wideReceiver (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    year INT,
    week INT,
    receptions INT,
    yards INT,
    touchdowns INT
);

CREATE TABLE tightEnd (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    year INT,
    week INT,
    receptions INT,
    yards INT,
    touchdowns INT
);

CREATE TABLE defenseSpecialTeams (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    team VARCHAR(100),
    year INT,
    week INT,
    sacks INT,
    interceptions INT,
    fumbleRecoveries INT,
    safeties INT,
    blockedKicks INT,
    conversionOrExtraPointReturns INT,
    pointsAllowed INT,
    returnsForTouchdown INT
);



-- adjust auto-increment start values
ALTER TABLE quarterback AUTO_INCREMENT=1000;
ALTER TABLE runningBack AUTO_INCREMENT=2000;
ALTER TABLE wideReceiver AUTO_INCREMENT=3000;
ALTER TABLE tightEnd AUTO_INCREMENT=4000;
ALTER TABLE defenseSpecialTeams AUTO_INCREMENT=5000;

-- insert seed data 
INSERT INTO quarterback ('lastName', 'firstName', 'year', 'week',
'touchdowns','interceptions','yards') VALUES ();

INSERT INTO runningBack ('lastName','firstName','year','week','yards','touchdowns')
VALUES ();

INSERT INTO wideReceiver ('lastName','firstName','year','week','receptions','yards','touchdowns')
VALUES ();

INSERT INTO tightEnd ('lastName','firstName','year','week','receptions','yards','touchdowns')
VALUES ();

INSERT INTO defenseSpecialTeams ('team','year','week','sacks','interceptions','fumbleRecoveries',
'safeties','blockedKicks','conversionOrExtraPointReturns','pointsAllowed','returnsForTouchdown')
VALUES ('New England Patriots','2017','13','4','1','0','0','0','0','3','0'),
('Minnesota Vikings','2017','13','0','0','0','0','0','0','9','0'),('Jacksonville Jaguars','2017','13','4',
'2','0','0','0','10','0'),('Philadelphia Eagles','2017','13','2','0','0','0','0','0','24','0'),
('Minnesota Vikings','2017','14','2','1','0','0','0','0','31','0'),('Philadelphia Eagles','2017','14','2',
'0','2','0','0','0','35','0'),('Jacksonville Jaguars','2017','14','2','3','0','0','0','0','24','0'),
('Minnesota Vikings','2017','15','3','2','0','0','0','0','7','1'),('Philadelphia Eagles','2017','15','1','1','0',
'0','0','0','29','0'),('Jacksonville Jaguars','2017','15','4','1','0','0','0','0','7','0'),
('New England Patriots','2017','15','2','1','0','0','0','0','24','0'),('New England Patriots','2017','14','2','0','0','0',
'0','0','27','0'),('Minnesota Vikings','2017','16','1','2','0','0','0','0','0','0'),('New England Patriots','2017','16',
'6','0','0','0','0','0','16','0'),('Jacksonville Jaguars','2017','16','1','1','0','0','0','0','44','0'),
('Philadelphia Eagles','2017','16','1','2','3','0','0','0','10','1'),('Minnesota Vikings','2017','17','1','0','0',
'0','0','0','10','0'),('New England Patriots','2017','17','4','0','0','0','0','0','6','0'),('Philadelphia Eagles','2017','17',
'1','0','1','0','0','0','6','0'),('Jacksonville Jaguars','2017','17','3','0','1','0','0','0','15','1');

