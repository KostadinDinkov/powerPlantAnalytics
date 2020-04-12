CREATE DATABASE windpower;	

USE windpower;

CREATE TABLE measured (
 Date DATETIME NOT NULL,
 Speed DOUBLE(10, 5),
 Direction INT,
 Energy DOUBLE(10, 5),
 PRIMARY KEY (Date)
);

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/data.csv' INTO TABLE measured FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 ROWS (@Date, Speed, Direction, Energy)SET Date  = STR_TO_DATE(@Date, '%d.%m.%Y %H:%i');