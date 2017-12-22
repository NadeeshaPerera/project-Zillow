###############################################################################
# Project name : DB project - Test 2 - Question 1
# Subject : BUAN6320: Database Foundations
# Submitted by : Group 35
# Purpose : Create database and import the data
##############################################################################

# View existing databases and start fresh

DROP database db_project;

show databases;

# Create a new database for the project

CREATE DATABASE db_project;

USE db_project;

SHOW tables;

# Create a State table which will hold state codes

CREATE TABLE state (
    ID int NOT NULL,
    state_code varchar(8) NOT NULL,
    primary key(ID)
    );

# Create a County table which will hold county names

CREATE TABLE county (
    ID int NOT NULL,
    county_name varchar(45) NOT NULL,
    primary key(ID)
    );

# Create a Metro table which will hold metro names

CREATE TABLE metro (
    ID int NOT NULL,
    metro_name varchar(45) NOT NULL,
    primary key(ID)
    );

# Create a City table which will hold city names
    
CREATE TABLE city (
    ID int NOT NULL,
    city_name varchar(45) NOT NULL,
    primary key(ID)
    );

# Create a table called City_summary which will hold the city codes, population ranks and the foreign keys of all other tables

CREATE TABLE city_Summary (
    city_code int NOT NULL,
    population_rank_1 int,
    population_rank_2 int,
    state_ID int NOT NULL,
    county_ID int NOT NULL,
    metro_ID int,
    city_ID int NOT NULL,
    primary key(city_code),
    foreign key(state_ID) references state(ID),
    foreign key(county_ID) references county(ID),
    foreign key(metro_ID) references metro(ID),
    foreign key(city_ID) references city(ID)
    );

# DROP table city_summary;     
# Create a Month table which will hold the month names

CREATE TABLE month_name (
    ID int NOT NULL,
    month_name varchar(20) NOT NULL,
    primary key (ID)
    );

# Create a table called Price_summary which will hold the city codes, price and price per sqft

CREATE TABLE price_summary (
	city_code int NOT NULL,
    year_1 int NOT NULL,
    month_ID int NOT NULL,
    price float,
    pricepersqft float,
    foreign key(city_code) references city_summary(city_code),
    foreign key(month_ID) references month_name(ID),
    constraint PK_price_ID primary key(city_code, year_1, month_ID)
    );

# DROP TABLE price_summary;


# Load data to the tables

LOAD DATA LOCAL INFILE 'C:\\Users\\perer\\Desktop\\Nadeesha\\UTD MSBA\\Fall 2017\\BUAN 6320\\Project\\rent-index\\Final database\\csv files\\state.csv' INTO TABLE state
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'C:\\Users\\perer\\Desktop\\Nadeesha\\UTD MSBA\\Fall 2017\\BUAN 6320\\Project\\rent-index\\Final database\\csv files\\county.csv' INTO TABLE county
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
LOAD DATA LOCAL INFILE 'C:\\Users\\perer\\Desktop\\Nadeesha\\UTD MSBA\\Fall 2017\\BUAN 6320\\Project\\rent-index\\Final database\\csv files\\metro.csv' INTO TABLE metro
    FIELDS TERMINATED BY ','
    OPTIONALLY ENCLOSED BY '"'
    ESCAPED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;    
    
LOAD DATA LOCAL INFILE 'C:\\Users\\perer\\Desktop\\Nadeesha\\UTD MSBA\\Fall 2017\\BUAN 6320\\Project\\rent-index\\Final database\\csv files\\city.csv' INTO TABLE city
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;  
    
LOAD DATA LOCAL INFILE 'C:\\Users\\perer\\Desktop\\Nadeesha\\UTD MSBA\\Fall 2017\\BUAN 6320\\Project\\rent-index\\Final database\\csv files\\month.csv' INTO TABLE month_name
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;  
    
LOAD DATA LOCAL INFILE 'C:\\Users\\perer\\Desktop\\Nadeesha\\UTD MSBA\\Fall 2017\\BUAN 6320\\Project\\rent-index\\Final database\\csv files\\city_summary.csv' INTO TABLE city_summary
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (city_code, @population_rank_1, @population_rank_2, state_ID, county_ID, @metro_ID, city_ID)
    SET
    population_rank_1 = nullif(@population_rank_1, ''),
    population_rank_2 = nullif(@population_rank_2, ''),
    metro_ID = nullif(@metro_ID, '');
    
LOAD DATA LOCAL INFILE 'C:\\Users\\perer\\Desktop\\Nadeesha\\UTD MSBA\\Fall 2017\\BUAN 6320\\Project\\rent-index\\Final database\\csv files\\price_summary_2.csv' INTO TABLE price_summary
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (city_code, year_1, month_ID, @price, @pricepersqft)
    SET
    price = nullif(@price, ''),
    pricepersqft = nullif(@pricepersqft, '');
 




# SELECT count(distinct city_code) FROM price_summary;
    
       
# SELECT * FROM state; 
    
    
    

