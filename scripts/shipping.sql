/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  mscov
 * Created: 03/06/2020
 */

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

-- Testing
--DELETE FROM Shipping;
--INSERT INTO SHIPPING (CUSTOMER_ID, ADDRESS_LINE_1, ADDRESS_LINE_2, COUNTRY, "STATE", POST_CODE) VALUES (123, '123 Main St', NULL, 'Australia', 'TAS', '7777')