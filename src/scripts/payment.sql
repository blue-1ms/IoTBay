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
DROP TABLE Payment;
-- Create Payment table
CREATE TABLE Payment
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

-- Testing
--DELETE FROM PAYMENT;
--INSERT INTO PAYMENT (CUSTOMER_ID, PAYMENT_TYPE, CARD_NAME, CARD_NUMBER, CARD_EXPIRY, CARD_CVV) VALUES (123, 0, 'Jackie Chan', '4111-4321-5678-8765', '11/2021', '987');
--INSERT INTO PAYMENT (CUSTOMER_ID, PAYMENT_TYPE, CARD_NAME, CARD_NUMBER, CARD_EXPIRY, CARD_CVV) VALUES (456, 0, 'Chuck Norris', '1234-4321-5678-8765', '11/2021', '987');

--UPDATE PAYMENT SET CUSTOMER_ID = 123, PAYMENT_TYPE = 1, CARD_NAME = 'Mickey Mouse', CARD_NUMBER = '1234 4321 5678 8765', CARD_EXPIRY = '11/2012', CARD_CVV = '123' WHERE PAYMENT_ID = 4;

--DELETE FROM PAYMENT WHERE PAYMENT_ID = 11;


