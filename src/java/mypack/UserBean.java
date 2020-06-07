/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.beans.*;
import java.io.Serializable;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;

/**
 *
 * @author charbelachmar
 */
public class UserBean implements Serializable {
    
   
    
    private String email, firstName, lastName, phone, password, type;
    private int customerID;
    private boolean valid;
   // private static String loggedIn = "false";

    public UserBean(int customerID, String email, String firstName, String lastName, String phone, String password, boolean valid, String type) {
        this.customerID = customerID;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.password = password;
        this.valid = valid;
        this.type = type;
    }

    public UserBean() {

    }
    
    
    public int getID(){
        return customerID;
    }
    
    public String getType(){
        return type;
}
    
    public void setID(int customerID){
        this.customerID = customerID;
    }
    
    public void setType(String type){
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    //public String isLoggedIn() {
    //    return loggedIn;
    //}
    
    public boolean isValid() {
        return valid;
    }
    
    public void setValid(boolean valid) {
        this.valid = valid;
    }

    //-------  LOGOUT  ---------------------------------------------
    
//    public void logout() {
//        loggedIn = "false";
//    }
}
