/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Cart;

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
        Cart cart = (Cart) session.getAttribute("cart");
        
        //If not create cart and save in session state
        if (cart == null) {
            //Create cart
            cart = new Cart();
        }
        
        //Save cart in session state
        session.setAttribute("cart", cart);
        
        
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
        
        //Validate payment details
        if (validator.validateCreditCardName(creditCardName) 
                && validator.validateCreditCardNumber(creditCardNumber) 
                && validator.validateCreditCardExpiration(creditCardExpiration) 
                && validator.validateCreditCardCVV(creditCardCVV)) {
             //Redirect to confirmation
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/confirmation.jsp");
            requestDispatcher.forward(request, response);
        }
        else{
            //Create an error message to display
            String error = "Invalid Payment Details";
            request.setAttribute("PaymentError", error);
            //Redirect back to checkout page
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/checkout.jsp");
            requestDispatcher.forward(request, response);
            
        }
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
