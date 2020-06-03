/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  blue
 * Created: 13/05/2020
 */
CREATE TABLE USERS
("NAME" VARCHAR(50),
EMAIL VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(20),
DOB Date,
GENDER VARCHAR(10),
FAVOURITECOLOUR VARCHAR(20),
PRIMARY KEY (EMAIL));
Insert into users value('Oscar', 'Oscar@uts.edu.au', 'P@ssw0rd', 1999-09-09, 'Male', 'Green');
