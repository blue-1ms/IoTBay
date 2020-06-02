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
import uts.isd.model.CartItem;

/**
 *
 * @author mscov
 */
public class CartController extends HttpServlet {

    @Override //Create and instance of DBConnector for the deployment session
    public void init() {
        
    }
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

        //Redirect
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/cart.jsp");
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
            case "add": 
                //Peform the add to cart
                doPostAdd(request, response, cart); 
                break;
            case "remove":
                //Peform the remove from cart
                doPostRemove(request, response, cart); 
                break;
            case "update": 
                //Peform the update from cart
                doPostUpdate(request, response, cart); 
                break;
            case "continue":
                doPostContinue(request, response, cart);
                break;
            default:
                //Unsupported action
            
        }
                
               

        
    }

    private void doPostAdd(HttpServletRequest request, HttpServletResponse response, Cart cart)
            throws ServletException, IOException {
        
        //Get the productID to add from request
        int productID = Integer.parseInt(request.getParameter("productID"));
        double price = 40.00;
        //get a product of this.id from database
        
        //create new cart item, with details of this product
        CartItem cartItem = new CartItem(productID, 1, price);
        //Add the cartItem to the cart
        cart.Add(cartItem);
        
        
        //Redirect
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/cart.jsp");
        requestDispatcher.forward(request, response);
        
    }
    
    private void doPostRemove(HttpServletRequest request, HttpServletResponse response, Cart cart)
            throws ServletException, IOException {
        
        //Get the cartItemID to remove from request
        int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
       
        //remove the cartItem from the cart
        cart.Remove(cartItemID);
        
        
        //Redirect
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/cart.jsp");
        requestDispatcher.forward(request, response);
        
    }
    
    private void doPostUpdate(HttpServletRequest request, HttpServletResponse response, Cart cart)
            throws ServletException, IOException {
        
        //Get the cartItemID to update from request
        int cartItemID = Integer.parseInt(request.getParameter("cartItemID"));
       
        //Get the quantity to update
        int quantity = Integer.parseInt(request.getParameter("quantity").trim());
        
        //Check if the quantity is a postive value
        
        //Get cartItem from cart
        CartItem cartItem = cart.getCartItem(cartItemID);
        
        //Update the quantity to the cart
        cartItem.setQuantity(quantity);
        
        //Update price
        cart.calculateTotal();
        
        //Redirect
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/WEB-INF/views/cart.jsp");
        requestDispatcher.forward(request, response);
        
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

    private void doPostContinue(HttpServletRequest request, HttpServletResponse response, Cart cart)  throws ServletException, IOException {
       //Redirect
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/catalogue.jsp");
        requestDispatcher.forward(request, response);
    }

}
