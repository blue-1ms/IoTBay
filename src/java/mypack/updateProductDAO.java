/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author blue
 */
@WebServlet(name = "updateProduct", urlPatterns = {"/updateProduct"})
public class updateProductDAO extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String productType = request.getParameter("productType");
            String productDescription = request.getParameter("productDescription");
            String productPrice = request.getParameter("productPrice");
            String productQuantity = request.getParameter("productQuantity");
            String productAvailability = request.getParameter("productAvailability");
            String currentProduct = null;
            
            if(productID.isEmpty() || productName.isEmpty() || productType.isEmpty()||productDescription.isEmpty() || productPrice.isEmpty() || productQuantity.isEmpty()|| productAvailability.isEmpty() ){
                response.sendRedirect("updateProduct.jsp?status=empty");
            }
            
            else{
            
            DatabaseConnection conn = new DatabaseConnection();
            
            Connection con = null;
            try {
                con = conn.getConnection();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(iot_login.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(iot_login.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            newProductDAO productDAO = new newProductDAO();
            String result = productDAO.updateProductDAO(productID, productName, productType, productDescription,productPrice,productQuantity, productAvailability);
        
            if("true".equals(result)){
            HttpSession session = request.getSession(true);
            session.setAttribute("productID", productID);
            session.setAttribute("productName", productName);
            session.setAttribute("productType", productType);
            session.setAttribute("productDescription", productDescription);
            session.setAttribute("productPrice", productPrice);
            session.setAttribute("productQuantity", productQuantity);
            session.setAttribute("productAvailability", productAvailability);
            response.sendRedirect("catalogue.jsp");
        }
        else{
            response.sendRedirect("errorupdating.jsp?status=error"); //error page
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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