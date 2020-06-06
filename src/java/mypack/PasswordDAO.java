/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

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
public class PasswordDAO {

    public String updatePassword(String customerID, String oldPassword, String newPassword, String confirmPassword) {

        Connection con = DatabaseConnection.getConnection();

        
        String currentPassword = null;
        
        int intID = Integer.parseInt(customerID);

        PreparedStatement ps = null;

        String sql = "UPDATE IOTBAY.USERS SET PASSWORD = ? WHERE CUSTOMERID = ?";
        String sqlSelect = "SELECT * FROM IOTBAY.USERS WHERE customerID = " + intID + " ";

        Statement st = null;
        ResultSet rs = null;

        try {
            st = con.createStatement();
            rs = st.executeQuery(sqlSelect);
            while (rs.next()) {
               currentPassword = rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
            return "false";
        }
        
        if(newPassword.equals(currentPassword)){
            return "oldNewMatch";
        }
        
        if (oldPassword.equals(currentPassword) && newPassword.equals(confirmPassword)) {
            try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setInt(2, intID);
            ps.executeUpdate();
            } catch (SQLException ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
            return "false";
        }
            
        }
        else if(!oldPassword.equals(currentPassword)){
            return "notOldMatch";
        }
        else if(!newPassword.equals(confirmPassword)){
            return "notNewMatch";
        }

        return "true";
    }
}
