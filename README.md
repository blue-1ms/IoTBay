# IoTBay
This is the offical readME file for our IoTBay project.
Within this file, will contain the nessecary steps to use our program.

## Preparation
Before using the application, the database URL, username and password for your database must be changed in the following file (assumes you're using NetBeans to view the files):
  1. Source Packages -> uts.isd.model.dao -> DB.java

SQL files must be run.
1. createDatabase.sql - this will ceate the IoTBay schema, database tables and insert sample data

## Usage
When a users launches the site, the user will be greeted with our store's home page. Here the user can interact with our site through the nav links in the navigation bar. 
Some of these links include
- Create an account
- View Products
- Search Products
- View Cart
- Login
- Manage Details
- About Us

### Creating an account
If a customer wishes to create an account with the site, they must follow these steps.
1. Go to the register tab at the top right of the site.
2. Once they have clicked the tab, they will be greeted with a registration form where they will have to enter their details in relevant sections of the form.
3. Once they have entered their details, they must submit the form, where it will be checked.
4. Once it has been checked, their account will be added to the database, and the user will be logged in, with the data being stored in session.
5. If the details are invalid, the user will be redirected to the register page with the relevant error message.


### Logging in to the website
If a user would like to log in:
1. Go to the login tab at the top right of the site.
2. Once they have clicked the tab, they will be greeted with a login form where they will have to enter their email and password.
3. The details will be compared with the database entries.
4. If the details are matched, all details for that entry will be stored in the session, and the user will be logged in.
5. If the login details don't match, the user will be redirected to the login page with the relevant error message.

### Managing Account Details
If a user would like to manage their details:
1. Go to the account tab at the top right of the site.
2. Once they have clicked the tab, they will be greeted with a page where they can manage their details, change password, and delete their account.
3. The 'Manage Account Details' page allows the user to change the personal details, i.e name, email, phone number.
4. The 'Change Password' page allows the user to change their password.
5. The 'Delete Account' page allows the user to delete their accounts.

### Purchasing Products
If a customer wishes to purchase products from the site, they must follow these steps.
1.

### Browsing the store
