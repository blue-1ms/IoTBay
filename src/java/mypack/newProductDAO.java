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

/**
 *
 * @author blue
 */
public class newProductDAO {
     public String insert(catalogue catalogue){
        
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
        
        String sql = "insert into IOTBAY.catalogue (productid, productname, producttype, productdescription, productprice, productquantity, productavailability) values(?,?,?,?,?,?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, catalogue.getProductID());
            ps.setString(2, catalogue.getProductName());
            ps.setString(3, catalogue.getProductType());
            ps.setString(4, catalogue.getProductDescription());
            ps.setDouble(5, catalogue.getProductPrice());
            ps.setInt(4, catalogue.getProductQuantity());
            ps.setString(4, catalogue.getProductAvailiability());
            ps.executeUpdate();
        } 
        
        catch (SQLException ex) {
            Logger.getLogger(RegisterDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Data not entered.");
            return "false";
        }
        
        return "true";
    }

    String updateProductDAO(String productID, String productName, String productType, String productDescription, String productPrice, String productQuantity, String productAvailability) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
