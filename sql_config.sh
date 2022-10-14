#!/bin/bash
sudo mysql <<BASH_QUERY
# start of sql query
CREATE USER 'sqluser'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'sqluser'@'%';
FLUSH PRIVILEGES;
# create an sql user and add priviliges
CREATE DATABASE db_testing;
USE db_testing;
# create database
CREATE TABLE carmodels (
    year INT NOT NULL,
    make VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL
);
# within the database create table
LOAD DATA LOCAL INFILE '/home/crio-user/workspace/bytes/me_jmeter/car-model.csv' 
INTO TABLE carmodels
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
# load data into the created table from the csv file.
# Ignore 1st row as it contains column headings
# csv file has value separated by `,` 
SELECT COUNT(*) FROM carmodels;
# returns the number of rows in the created table
# end of sql query
BASH_QUERY
