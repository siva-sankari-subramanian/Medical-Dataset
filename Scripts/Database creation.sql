/*
The purpose of this code is to create a new database and to create schema for creating new tables
*/

/*
-----------------------------------------------------------------------------------
CREATING A NEW DATABASE
-----------------------------------------------------------------------------------
*/

----------Creating "Medical Dataset"--------------
CREATE DATABASE Medical_dataset;
GO

USE Medical_dataset;
GO


----------Creating schemas"--------------
----------dev to load data raw datasets"--------------
CREATE SCHEMA dev;
GO

----------prod for reporting/ analytical use"--------------
CREATE SCHEMA prod;
GO
