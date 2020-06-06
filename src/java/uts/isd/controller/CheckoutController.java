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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

import uts.isd.model.*;
import uts.isd.model.dao.*;

/**
 *
 * @author mscov
 */
public class CheckoutController extends HttpServlet {

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
        //Check if we have cart in session state
        HttpSession session = request.getSession();

        //If not create cart and save in session state
        Cart cart = (Cart) session.getAttribute("cart");        
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
                
        //Get the button name from the request
        String action = request.getParameter("action");
        
        //Check what action is being peformed
        switch (action){
            case "checkout": 
                //Peform the add to cart
                doPostCheckout(request, response, cart); 
                break;
            case "payment":
                doPostPayment(request, response, cart);
                break;
            default:
                //Unsupported action
            
        }
    }
    
    private void doPostCheckout(HttpServletRequest request, HttpServletResponse response, Cart cart)
            throws ServletException, IOException {
        //Redirect
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/checkout.jsp");
        requestDispatcher.forward(request, response);
        
    }
   
    private void doPostPayment(HttpServletRequest request, HttpServletResponse response, Cart cart)
            throws ServletException, IOException {
        //Create instance of validator class
        Validator validator = new Validator();
        
        
        String creditCardName = request.getParameter("creditCardName");
        String creditCardNumber = request.getParameter("creditCardNumber");
        String creditCardExpiration = request.getParameter("creditCardExpiration");
        String creditCardCVV = request.getParameter("creditCardCVV");
        
        //TODO: Get customerID from logged in user
        int customerID = 123;
        
        //Validate payment details
        if (validator.validateCreditCardName(creditCardName) 
                && validator.validateCreditCardNumber(creditCardNumber) 
                && validator.validateCreditCardExpiration(creditCardExpiration) 
                && validator.validateCreditCardCVV(creditCardCVV)) {
            
            try {            
                //Get an instance of the checkout DB manager
                CheckoutDBManager db = this.getDBManager();
                
                //
                //Determine payment type
                int paymentType = getPaymentType(request);
                
                //Save payment method in database
                Payment payment = new Payment(customerID,paymentType,creditCardName,creditCardNumber, creditCardExpiration, creditCardCVV); //creditCardName, creditCardNumber, creditCardExpiration, creditCardCVV);            
                db.insertPayment(payment);
                
                System.out.println("New payment record: " + payment.getPaymentID());

                //Save shipping info in database
                // [TODO]

                //Redirect to order controller and process order and invoice records
                //[TODO]
                RequestDispatcher requestDispatcher;
                requestDispatcher = request.getRequestDispatcher("/order/confirmation");
                requestDispatcher.forward(request, response);
            }
            catch (ClassNotFoundException | SQLException ex) {
                //Log execption
                Logger.getLogger(CheckoutController.class.getName()).log(Level.SEVERE, null, ex);
                System.out.println("Data not entered.");
            }            
        }

        //Create an error message to display
        String error = "Invalid Payment Details";
        request.setAttribute("PaymentError", error);

        //Redirect back to checkout page
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/checkout.jsp");
        requestDispatcher.forward(request, response);

    }

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

}
