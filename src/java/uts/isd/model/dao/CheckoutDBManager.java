/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import uts.isd.model.*;

/**
 *
 * @author mscov
 */
public class CheckoutDBManager {
    private Connection connection;
   
    public CheckoutDBManager(Connection conn) throws SQLException {       
        this.connection = conn;
    }
    
    //Select payment methods for this customer
    public List<Payment> listPayments(int customerID) throws SQLException {
        //Create an array to of payment objects to return
        ArrayList<Payment> payments = new ArrayList<Payment>();
        
        try 
        {            
            //Generate the SQL statement
            String sql = "SELECT * FROM IOTBAY.PAYMENT WHERE CUSTOMER_ID = ?";

            //Prepare the statement parameters and configure to return the payment id generated
            PreparedStatement selectStatement = this.connection.prepareStatement(sql);
            selectStatement.setInt(1, customerID);
                        
            //Execute the SQL statement
            ResultSet result = selectStatement.executeQuery();
           
            //Check for next result
            while (result.next()) {
                //Create instance of our Payment model
                Payment payment = new Payment();
                payment.setPaymentID(result.getInt("PAYMENT_ID"));
                payment.setCustomerID(result.getInt("CUSTOMER_ID"));
                payment.setPaymentType(result.getInt("PAYMENT_TYPE"));
                payment.setCardName(result.getString("CARD_NAME"));
                payment.setCardNumber(result.getString("CARD_NUMBER"));
                payment.setCardExpiry(result.getString("CARD_EXPIRY"));
                payment.setCardCVV(result.getString("CARD_CVV"));
                
                //Add new payment to array
                payments.add(payment);
            }
        }
        catch (SQLException ex)
        {
            //Log exception
            System.out.println("Caught exception executing listPayments: " + ex.toString());
            throw ex;
        }
        
        //Return null indicating a match was not found but no error
        return payments;   
    }
    
    //Select a payment method for this customer
    public Payment selectPayment(int paymentID) throws SQLException {
        try 
        {            
            //Generate the SQL statement
            String sql = "SELECT * FROM IOTBAY.PAYMENT WHERE PAYMENT_ID = ?";

            //Prepare the statement parameters and configure to return the payment id generated
            PreparedStatement selectStatement = this.connection.prepareStatement(sql);
            selectStatement.setInt(1, paymentID);
                        
            //Execute the SQL statement
            ResultSet result = selectStatement.executeQuery();
           
            //Check for a matching result (one row should be returned)
            if (result.next()) {
                //Create instance of our Payment model
                Payment payment = new Payment();
                payment.setPaymentID(result.getInt("PAYMENT_ID"));
                payment.setCustomerID(result.getInt("CUSTOMER_ID"));
                payment.setPaymentType(result.getInt("PAYMENT_TYPE"));
                payment.setCardName(result.getString("CARD_NAME"));
                payment.setCardNumber(result.getString("CARD_NUMBER"));
                payment.setCardExpiry(result.getString("CARD_EXPIRY"));
                payment.setCardCVV(result.getString("CARD_CVV"));
                return payment;
            }
        }
        catch (SQLException ex)
        {
            //Log exception
            System.out.println("Caught exception executing selectPayment: " + ex.toString());
            throw ex;
        }
        
        //Return null indicating a match was not found but no error
        return null;   
    }
    
    //Create a payment method for this customer  
    public boolean insertPayment(Payment payment) throws SQLException {
        boolean success = false;
        
        try 
        {            
            //Generate the SQL statement
            String sql = "INSERT INTO IOTBAY.PAYMENT (CUSTOMER_ID, PAYMENT_TYPE, CARD_NAME, CARD_NUMBER, CARD_EXPIRY, CARD_CVV) VALUES (?, ?, ?, ?, ?, ?)";

            //Prepare the statement parameters and configure to return the payment id generated
            PreparedStatement insertStatement = this.connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            insertStatement.setInt(1, payment.getCustomerID());
            insertStatement.setInt(2, payment.getPaymentType());
            insertStatement.setString(3, payment.getCardName());
            insertStatement.setString(4, payment.getMaskedCardNumber());
            insertStatement.setString(5, payment.getCardExpiry());
            insertStatement.setString(6, payment.getCardCVV());
                        
            //Execute the SQL statement
            int result = insertStatement.executeUpdate();
           
            //Check the result (one row should be created)
            if (result == 1) {
                //Get the auotgenered id
                int paymentID = getGeneratedId(insertStatement.getGeneratedKeys());
                payment.setPaymentID(paymentID);
                
                //Return success or failure
                success = true;
            }
        }
        catch (SQLException ex)
        {
            //Log exception
            System.out.println("Caught exception executing createPayment: " + ex.toString());
            throw ex;
        }
        
        //Return success or failure
        return success;   
    }

    //Update a payment method for this customer  
    public boolean updatePayment(Payment payment) throws SQLException {
        boolean success = false;
        
        try 
        {            
            //Generate the SQL statement
            String sql = "UPDATE IOTBAY.PAYMENT SET CUSTOMER_ID = ?, PAYMENT_TYPE = ?, CARD_NAME = ?, CARD_NUMBER = ?, CARD_EXPIRY = ?, CARD_CVV = ? WHERE PAYMENT_ID = ?";

            //Prepare the statement parameters and configure to return the payment id generated
            PreparedStatement updateStatement = this.connection.prepareStatement(sql);
            updateStatement.setInt(1, payment.getCustomerID());
            updateStatement.setInt(2, payment.getPaymentType());
            updateStatement.setString(3, payment.getCardName());
            updateStatement.setString(4, payment.getMaskedCardNumber());
            updateStatement.setString(5, payment.getCardExpiry());
            updateStatement.setString(6, payment.getCardCVV());
            updateStatement.setInt(7, payment.getPaymentID());
                        
            //Execute the SQL statement
            int result = updateStatement.executeUpdate();
           
            //Check the result (one row should be updated)
            if (result == 1) {
                //Return success or failure
                success = true;
            }
        }
        catch (SQLException ex)
        {
            //Log exception
            System.out.println("Caught exception executing updatePayment: " + ex.toString());
            throw ex;
        }
        
        //Return success or failure
        return success;   
    }

    //Delete a payment method for this customer  
    public boolean deletePayment(Payment payment) throws SQLException {
        boolean success = false;
        
        try 
        {            
            //Generate the SQL statement
            String sql = "DELETE FROM IOTBAY.PAYMENT WHERE PAYMENT_ID = ?";

            //Prepare the statement parameters and configure to return the payment id generated
            PreparedStatement deleteStatement = this.connection.prepareStatement(sql);
            deleteStatement.setInt(1, payment.getPaymentID());
                        
            //Execute the SQL statement
            int result = deleteStatement.executeUpdate();
           
            //Check the result (one row should be deleted)
            if (result == 1) {
                //Return success or failure
                success = true;
            }
        }
        catch (SQLException ex)
        {
            //Log exception
            System.out.println("Caught exception executing deletePayment: " + ex.toString());
            throw ex;
        }
        
        //Return success or failure
        return success;   
    }
    
    //Create a shipping address for this customer  
    public boolean createShipping(Shipping shipping) throws SQLException {
        boolean success = false;
        
        try 
        {
            //Generate the SQL statement
            String sql = String.format("INSERT INTO SHIPPING (CUSTOMER_ID, ADDRESS_LINE_1, ADDRESS_LINE_2, COUNTRY, \"STATE\", POST_CODE) VALUES (%d, '%s', '%s', '%s', '%s', '%s');", shipping.getCustomerID(), shipping.getAddressLine1(), shipping.getAddressLine2(), shipping.getCountry(), shipping.getState(), shipping.getPostCode());
            
            //Create the SQL statement
            PreparedStatement ps = this.connection.prepareStatement(sql);
            int result = ps.executeUpdate(sql);
           
            //Check the result
            if (result == 1) {
                success = true;
            }
        }
        catch (SQLException ex)
        {
            //Log exception
            throw ex;
        }
        
        return success;   
    }


    //Get generated id after insert
    private int getGeneratedId(ResultSet generatedKeys) throws SQLException {
        if (generatedKeys.next()) {
            return generatedKeys.getInt(1);
        }
        else {
            throw new SQLException("Failed to get generated id");
        }
    }
    
}
