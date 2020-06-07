/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import uts.isd.model.dao.DB;

/**
 *
 * @author charbelachmar
 */
public class DatabaseConnection extends DB{

    
    
        public Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection con = null;

        try {
            Class.forName(driver);
            con = DriverManager.getConnection(URL, dbuser, dbpass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return con;
        }
    
}
