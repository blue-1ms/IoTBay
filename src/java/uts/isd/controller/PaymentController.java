/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.Payment;
import uts.isd.model.dao.CheckoutDBManager;
import uts.isd.model.dao.DBConnector;

/**
 *
 * @author mscov
 */
public class PaymentController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try
        {
            //TODO: Get customerID from logged in user
            int customerID = 123;

            //Check if customer has a payment method saved
            CheckoutDBManager db = this.getDBManager();
            List<Payment> payments = db.listPayments(customerID);
            if (payments.isEmpty() == false) {
                //Get default payment method (use the first one for now
                request.setAttribute("defaultPayment", payments.get(0));
            }
            
        }
        catch (ClassNotFoundException | SQLException ex) {
            //Log execption
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Failed to get default payment method.");
        }            
               
        //Redirect to payment list view
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/payment_details.jsp");
        requestDispatcher.forward(request, response);               
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Get the button name from the request
        String action = request.getParameter("action");
        
        //Check what action is being peformed
        switch (action){
            case "add": 
                //Peform the update
                doPostAdd(request, response); 
                break;
            case "update": 
                //Peform the update
                doPostUpdate(request, response); 
                break;
            case "remove":
                //Perform the delete
                doPostDelete(request, response);
                break;
            default:
                //Unsupported action
            
        }
        
    }

    /**
     * 
     * @param request
     * @param response 
     */
    private void doPostAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String creditCardName = request.getParameter("creditCardName");
        String creditCardNumber = request.getParameter("creditCardNumber");
        String creditCardExpiration = request.getParameter("creditCardExpiration");
        String creditCardCVV = request.getParameter("creditCardCVV");

        //Create instance of validator class
        Validator validator = new Validator();        

        //Validate payment details
        if (validator.validateCreditCardName(creditCardName) 
            && validator.validateCreditCardNumber(creditCardNumber) 
            && validator.validateCreditCardExpiration(creditCardExpiration) 
            && validator.validateCreditCardCVV(creditCardCVV)) {

            try {            
                //TODO: Get customerID from logged in user
                int customerID = 123;

                //Get an instance of the checkout DB manager
                CheckoutDBManager db = this.getDBManager();
                
                //Determine payment type
                int paymentType = getPaymentType(request);

                //Save payment method in database
                Payment payment = new Payment(customerID,paymentType,creditCardName,creditCardNumber, creditCardExpiration, creditCardCVV);
                db.insertPayment(payment);

                System.out.println("Added payment record: " + payment.getPaymentID());
                
                //Create a success message to display
                String message = "Payment details added successfully";
                request.setAttribute("paymentSuccess", message);
                
                //Add the updated payment details to the reuqest so we can show updated details
                request.setAttribute("defaultPayment", payment);                                
            }
            catch (ClassNotFoundException | SQLException ex) {
                //Log execption
                Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);

                //Create an error message to display
                String error = "Failed to add payment details. Please review and try again";
                request.setAttribute("paymentError", error);
            }  
        }
        else {
            //Create an error message to display
            String error = "Failed to add payment details. Please review and try again";
            request.setAttribute("paymentError", error);
        }
        
        //Redirect back to payment details page
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/payment_details.jsp");
        requestDispatcher.forward(request, response);                   
    }
    
    /**
     * 
     * @param request
     * @param response 
     */
    private void doPostUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Update payment method for customer
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));
        String creditCardName = request.getParameter("creditCardName");
        String creditCardNumber = request.getParameter("creditCardNumber");
        String creditCardExpiration = request.getParameter("creditCardExpiration");
        String creditCardCVV = request.getParameter("creditCardCVV");

        //Create instance of validator class
        Validator validator = new Validator();        

        //Validate payment details
        if (validator.validateCreditCardName(creditCardName) 
            && validator.validateCreditCardNumber(creditCardNumber) 
            && validator.validateCreditCardExpiration(creditCardExpiration) 
            && validator.validateCreditCardCVV(creditCardCVV)) {

            try {            
                //TODO: Get customerID from logged in user
                int customerID = 123;

                //Get an instance of the checkout DB manager
                CheckoutDBManager db = this.getDBManager();
                
                //Get the existing payment details from the database
                Payment payment = db.selectPayment(paymentID);

                //Update payment details from the request
                payment.setPaymentType(getPaymentType(request));
                payment.setCardName(creditCardName);
                payment.setCardNumber(creditCardNumber);
                payment.setCardExpiry(creditCardExpiration);
                payment.setCardCVV(creditCardCVV);

                //Save payment method in database
                db.updatePayment(payment);

                System.out.println("Saved payment record: " + payment.getPaymentID());
                
                //Create a success message to display
                String message = "Payment details updated successfully";
                request.setAttribute("paymentSuccess", message);
                
                //Add the updated payment details to the reuqest so we can show updated details
                request.setAttribute("defaultPayment", payment);                                
            }
            catch (ClassNotFoundException | SQLException ex) {
                //Log execption
                Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);

                //Create an error message to display
                String error = "Failed to update payment details. Please review and try again";
                request.setAttribute("paymentError", error);
            }  
        }
        else {
            //Create an error message to display
            String error = "Failed to update payment details. Please review and try again";
            request.setAttribute("paymentError", error);
        }
        
        //Redirect back to payment details page
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/payment_details.jsp");
        requestDispatcher.forward(request, response);                   

    }

    /**
     * 
     * @param request
     * @param response 
     */
    private void doPostDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {            
            //Delete payment method for customer
            int paymentID = Integer.parseInt(request.getParameter("paymentID"));
            Payment payment = new Payment();
            payment.setPaymentID(paymentID);
            
            //Get an instance of the checkout DB manager
            CheckoutDBManager db = this.getDBManager();
                
            //Delete payment method in database
            db.deletePayment(payment);

            System.out.println("Deleted payment record: " + payment.getPaymentID());

            //Create a success message to display
            String message = "Payment details deleted successfully";
            request.setAttribute("paymentSuccess", message);                
        }
        catch (ClassNotFoundException | SQLException ex) {
            //Log execption
            Logger.getLogger(PaymentController.class.getName()).log(Level.SEVERE, null, ex);

            //Create an error message to display
            String error = "Failed to process payment. Please try again";
            request.setAttribute("paymentError", error);
        }  
        
        //Redirect back to payment details page
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/payment_details.jsp");
        requestDispatcher.forward(request, response);                    
        
    }

    /**
     * 
     * @param request
     * @return 
     */
    private int getPaymentType(HttpServletRequest request) {
        String creditCardType = request.getParameter("paymentMethod");        
        //TODO: Fix
        if (creditCardType != null){
            return 0;
        }
        else{
            return 1;
        }
    }

    /**
     * Create an instance of our database manager
     * 
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException 
     */
    private CheckoutDBManager getDBManager() throws SQLException, ClassNotFoundException {
        DBConnector db = new DBConnector();
        Connection conn = db.openConnection();              
        return new CheckoutDBManager(conn);
    }
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
