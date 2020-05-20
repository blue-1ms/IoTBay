package mypack;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author charbelachmar
 */
public class RegisterDAO {
    
    public String insert(UserBean userAccount){
        
        Connection con = DatabaseConnection.getConnection();
        
        PreparedStatement ps = null;
        
        String sql = "insert into USERDB.USERACCOUNT (EMAIL, FIRSTNAME, LASTNAME, PHONE, PASSWORD) values(?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, userAccount.getEmail());
            ps.setString(2, userAccount.getFirstName());
            ps.setString(3, userAccount.getLastName());
            ps.setString(4, userAccount.getPhone());
            ps.setString(5, userAccount.getPassword());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Data not entered.");
            return "false";
        }
        
        return "true";
    }
}
