/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author charbelachmar
 */
public class LoginDAO {
    
       public static String select(UserBean userAccount){ 
           
         ResultSet rs = null; 
         Statement st = null;
         boolean more;


         String email = userAccount.getEmail();
         String password = userAccount.getPassword();
         
         String sql = "SELECT * FROM IOTBAY.USERS WHERE email = '"+email+"' AND password = '"+password+"'";


         Connection con = DatabaseConnection.getConnection();
         
        try{
         st = con.createStatement();
         rs = st.executeQuery(sql);
         more = rs.next();}
        catch(SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
            return "false";
        }
        
        
        
         
         if(!more){
              userAccount.setValid(false);
             return "unregistered";
         }
         
         else if(more){
             try{
        while (rs.next())
            {
                    userAccount.setFirstName(rs.getString("firstName"));
                    userAccount.setLastName(rs.getString("lastName"));
                    userAccount.setEmail(rs.getString("email"));
                    userAccount.setPhone(rs.getString("phone"));
                    userAccount.setPassword(rs.getString("password"));
                    userAccount.setID(rs.getInt("customerID"));
            }
        }catch(SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
            return "false";
        }
             userAccount.setValid(true);
             
             return "registered";
         }
         
         return "error";
       }

                
    
}
