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
INSERT INTO quarterback (lastName, firstName, year, week,
touchdowns,interceptions,yards) VALUES 
('Keenum','Case','2017','13','2','0','227'),
('Brady','Tom','2017','13','0','1','258'),
('Wentz','Carson','2017','13','1','1','348'),
('Bortles','Blake','2017','13','2','0','309'),
('Keenum','Case','2017','14','2','2','280'),
('Wentz','Carson','2017','14','4','1','291'),
('Foles','Nick','2017','14','0','0','42'),
('Brady','Tom','2017','14','1','2','233'),
('Bortles','Blake','2017','14','2','0','268'),



INSERT INTO runningBack (lastName,firstName,year,week,yards,touchdowns)
VALUES
('Murray','Latavius','2017','13','76','0'),
('McKinnon','Jerick','2017','13','24','0'),
('Diggs','Stefon','2017','13','5','0'),
('Lewis','Dion','2017','13','92','0'),
('Burkhead','Rex','2017','13','78','2'),
('White','James','2017','13','18','0'),
('Cooks','Brandin','2017','13','5','0'),
('Ajayi','Jay','2017','13','35','0'),
('Blount','LeGarrette','2017','13','26','0'),
('Clement','Corey','2017','13','7','0'),
('Fournette','Leonard','2017','13','57','1'),
('Ivory','Chris','2017','13','12','0'),
('McKinnon','Jerick','2017','14','46','0'),
('Murray','Latavius','2017','14','14','0'),
('Ajayi','Jay','2017','14','78','0'),
('Clement','Corey','2017','14','24','0'),
('Blount','LeGarrette','2017','14','12','0'),
('Lewis','Dion','2017','14','17','0'),
('Burkhead','Rex','2017','14','8','1'),
('Fournette','Leonard','2017','14','101','1'),
('Ivory','Chris','2017','14','48','0'),



INSERT INTO wideReceiver (lastName,firstName,year,week,receptions,yards,touchdowns)
VALUES
('Thielen','Adam','2017','13','4','51','0'),
('Diggs','Stefon','2017','13','2','32','0'),
('Wright','Jarius','2017','13','3','18','0'),
('Treadwell','Laquon','2017','13','1','9','0'),
('Amendola','Danny','2017','13','2','34','0'),
('Cooks','Brandin','2017','13','2','17','0'),
('Agholor','Nelson','2017','13','7','141','1'),
('Jeffery','Alshon','2017','13','4','61','0'),
('Smith','Torrey','2017','13','5','29','0'),
('Hollins','Mack','2017','13','1','10','0'),
('Lee','Marqise','2017','13','7','86','1'),
('Westbrook','Dede','2017','13','6','78','0'),
('Cole','Keelan','2017','13','3','49','1'),
('Thielen','Adam','2017','14','6','105','1'),
('Diggs','Stefon','2017','14','6','64','0'),
('Treadwell','Laquon','2017','14','2','23','0'),
('Wright','Jarius','2017','14','2','13','0'),
('Smith','Torrey','2017','14','6','100','0'),
('Agholor','Nelson','2017','14','8','64','0'),
('Jeffery','Alshon','2017','14','5','52','1'),
('Hollins','Mack','2017','14','0','0','0'),
('Amendola','Danny','2017','14','6','76','0'),
('Cooks','Brandin','2017','14','1','38','0'),
('Hogan','Chris','2017','14','1','1','0'),
('Cole','Keelan','2017','14','3','99','1'),
('Westbrook','Dede','2017','14','5','81','1'),
('Lee','Marqise','2017','14','5','65','0'),
('Pinkard','Larry','2017','14','1','5','0'),


INSERT INTO tightEnd (lastName,firstName,year,week,receptions,yards,touchdowns)
VALUES 
('Rudolph','Kyle','2017','13','4','36','1'),
('Gronkowski','Rob','2017','13','9','147','0'),
('Allen','Dwayne','2017','13','1','3','0'),
('Hollister','Jacob','2017','13','0','0','0'),
('Burton','Trey','2017','13','4','42','0'),
('Ertz','Zach','2017','13','2','24','0'),
('Rudolph','Kyle','2017','14','3','41','1'),
('Bell','Blake','2017','14','2','7','0'),
('Burton','Trey','2017','14','5','71','2'),
('Allen','Dwayne','2017','14','2','10','0'),


INSERT INTO defenseSpecialTeams (team,year,week,sacks,interceptions,fumbleRecoveries,
safeties,blockedKicks,conversionOrExtraPointReturns,pointsAllowed,returnsForTouchdown)
VALUES ('New England Patriots','2017','13','4','1','0','0','0','0','3','0'),
('Minnesota Vikings','2017','13','0','0','0','0','0','0','9','0'),('Jacksonville Jaguars','2017','13','4',
'2','0','0','0','0','10','0'),('Philadelphia Eagles','2017','13','2','0','0','0','0','0','24','0'),
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

