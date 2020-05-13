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

/**
 *
 * @author charbelachmar
 */
public class DatabaseConnection {
    private static String dburl="jdbc:derby://localhost:1527/userDB";
    private static String dbusername="root";
    private static String dbpassword="password";
    
    
        public static Connection getConnection(){
        Connection con = null;

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        

        try {
            con = DriverManager.getConnection(dburl, dbusername, dbpassword);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
        }
    
}
