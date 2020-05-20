package mypack;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/iot_register"})
public class iot_register extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email");
        email = email.toLowerCase();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        boolean valid = false;
        int customerID = 0;
        
        String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        
        if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()
                || phone.isEmpty() || password.isEmpty()) {
            response.sendRedirect("register.jsp?status=empty");}
        
        else if(! email.matches(regex)){
            response.sendRedirect("register.jsp?status=email");
        }
        
        else{
            
        UserBean user = new UserBean(customerID, email, firstName, lastName, phone, password, valid);
        RegisterDAO regDAO = new RegisterDAO();
        String result = regDAO.insert(user);

        if (result == "true") {
            String sql = "SELECT * FROM USERDB.USERACCOUNT WHERE email = '" + email + "' AND password = '" + password + "'";

            Connection con = DatabaseConnection.getConnection();
            ResultSet rs = null;
            Statement st = null;

            try {
                st = con.createStatement();
                rs = st.executeQuery(sql);
                while (rs.next()) {
                    user.setFirstName(rs.getString("firstName"));
                    user.setLastName(rs.getString("lastName"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setPassword(rs.getString("password"));
                    user.setID(rs.getInt("customerID"));
                }
            } catch (SQLException ex) {
                Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            user.setValid(true);
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp"); //logged-in page
        } else if (result == "false") {
            user.setValid(false);
            response.sendRedirect("register.jsp?status=false"); //logged-in page
        }

        /*if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()
                || phone.isEmpty() || password.isEmpty()) {
            RequestDispatcher registerRequest = request.getRequestDispatcher("register.jsp");
            registerRequest.include(request, response);
        } else {
            RequestDispatcher registerRequest = request.getRequestDispatcher("welcome.jsp");
            registerRequest.include(request, response);
        }*/
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
     *
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    } */

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    } */

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     *
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

} */
