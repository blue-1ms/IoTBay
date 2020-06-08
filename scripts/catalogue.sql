/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  blue
 * Created: 06/06/2020
 */
DROP TABLE Payment;

CREATE TABLE IOTBAY.CATALOGUE(
    PRODUCTID VARCHAR(30),
    PRODUCTNAME VARCHAR(255),
    PRODUCTTYPE VARCHAR(25),
    PRODUCTDESC VARCHAR(255),
    PRODUCTPRICE real,
    PRODUCTQUANTITY VARCHAR(255),
    PRODUCTAVAILABILITY VARCHAR(255),
    PRIMARY KEY (productid)
);

INSERT INTO IOTBAY.CATALOGUE 
VALUES ('1', 'raspberry pi model 4B', 'kit', '4GB + 32GB', 129.99, '10', 'In-stock'),
('2', 'generic LED bulb', 'component', '20-pack', 19.99, '50', 'In-stock');