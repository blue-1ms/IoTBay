/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.dao.*;
/**
 *
 * @author charbelachmar
 */
public class CustomerPersonalDAO {
    public String update(UserBean userAccount){
        
        DatabaseConnection conn = new DatabaseConnection();
            
            Connection con = null;
            try {
                con = conn.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(iot_login.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(iot_login.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        PreparedStatement ps = null;
        
        String sql = "UPDATE IOTBAY.USERS SET EMAIL = ?, FIRSTNAME = ?, LASTNAME = ?, PHONE = ? WHERE CUSTOMERID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, userAccount.getEmail());
            ps.setString(2, userAccount.getFirstName());
            ps.setString(3, userAccount.getLastName());
            ps.setString(4, userAccount.getPhone());
            ps.setInt(5, userAccount.getID());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Data not entered.");
            return "false";
        }
        
        return "true";
    }
    
}
