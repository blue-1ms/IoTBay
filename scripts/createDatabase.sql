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

-- User Sample Data
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('bobtamari@gmail.com','Bob','Tamari','0453299545','Btamari123','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('rgupt123@outlook.com','Rangis','Gupta','+61478923333','Rg473@3','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('izzyrox@yahoo.com','Ismael','Freeman','0433777999','Izzyrocks','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('info@bkelectronics.com.au','BK','Electronics','97238888','B@U7euj','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('u8dus7@zoomail.net','Greg','Ranger','+61484737827','biggreg79','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('anonymouse@gmail.com','Anonymous','Mouse','0404040404','Anonymouse1@#','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('blank@hotmail.com','blank','account','+61444000444','password','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('mkyong.100@yahoo.com','Mia','Yong','0297764892','mkyong88172','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('help@biznus.com.au','Biznus','Corp.','98765432','Biznus','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('josiah@aol.com','Josiah','Sanchez','0433728819','josiahisarockstar7','customer');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('creedbratton@iotbay.com.au','Creed','Bratton','0283746352','CreedBratton','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('johnsmith@iotbay.com.au','John','Smith','0288376453','Jsmith123','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('jimhalpert@iotbay.com.au','Jimothy','Halpert','0477382912','Jhalp77','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('pamb@iotbay.com.au','Pamela','Beesly','+61477827635','pb123','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('stanleyhudson@iotbay.com.au','Stanley','Hudson','0297997797','Pretzel779','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('charlesboyle@iotbay.com.au','Charles','Boyle','0400000000','vcqCmWds2y3FSzS','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('michaelscott@iotbay.com.au','Michael','Scott','0499827772','Tobysux247','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('meredithpalmer@iotbay.com.au','Meredith','Palmer','0295361627','Mpalmer23','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('amysantiago@iotbay.com.au','Amy','Santiago','+61422526736','Amysantiago112','staff');
INSERT INTO IOTBAY.USERS (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD, ACCOUNTTYPE) VALUES ('jakeperalta@iotbay.com.au','Jake','Peralta','0398876352','JPeralta99','staff');
