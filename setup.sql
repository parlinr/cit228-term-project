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
    completions INT,
    attempts INT,
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
    carries INT,
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

-- seed data 


