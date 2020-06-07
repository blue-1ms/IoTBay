/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  mscov
 * Created: 07/06/2020
 */
--Create schema for IoTBay database
CREATE SCHEMA IOTBAY;

--Drop table for we can start fresh
DROP TABLE IOTBAY.USERS;
--Create table
CREATE TABLE IOTBAY.USERS (
    CUSTOMERID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 100000, INCREMENT BY 1),
    EMAIL VARCHAR(255),
    FIRSTNAME VARCHAR(255),
    LASTNAME VARCHAR(255),
    PHONE VARCHAR(12),
    PASSWORD VARCHAR(255),
    PRIMARY KEY (CUSTOMERID)
);

--Drop table for we can start fresh
DROP TABLE IOTBAY.CATALOGUE;
--Create table
CREATE TABLE IOTBAY.CATALOGUE (
    PRODUCTID VARCHAR(30),
    PRODUCTNAME VARCHAR(255),
    PRODUCTTYPE VARCHAR(25),
    PRODUCTDESC VARCHAR(255),
    PRODUCTPRICE real,
    PRODUCTQUANTITY VARCHAR(255),
    PRODUCTAVAILABILITY VARCHAR(255),
    PRIMARY KEY (PRODUCTID)
);

-- Drop table so we can start fresh
DROP TABLE IOTBAY.Payment;
-- Create Payment table
CREATE TABLE IOTBAY.Payment
(
    Payment_ID INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    Customer_ID INT,
    Payment_Type INT DEFAULT 0,
    Card_Name VARCHAR(30),
    Card_Number VARCHAR(30),
    Card_Expiry VARCHAR(10),
    Card_CVV VARCHAR(4),
    PRIMARY KEY (Payment_ID)
);

-- Drop table so we can start fresh
DROP TABLE Shipping;
-- Create table
CREATE TABLE Shipping
(
    Shipping_ID INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    Customer_ID INT,
    Address_Line_1 VARCHAR(200),
    Address_Line_2 VARCHAR(200),
    Country VARCHAR(30),
    State VARCHAR(30),
    Post_Code VARCHAR(30),
    PRIMARY KEY (Shipping_ID)
);


--Insert Sample Data

