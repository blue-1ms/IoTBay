package mypack;



/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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


@WebServlet(urlPatterns = {"/iot_login"})
public class iot_login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        UserBean user = new UserBean();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        

        
        email = email.toLowerCase();

        user.setEmail(email);
        user.setPassword(password);

        LoginDAO logDAO = new LoginDAO();
        String result = logDAO.select(user);

        if (user.isValid()) {
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
            HttpSession session = request.getSession(true);
            //session.setAttribute("currentSessionUser", user);
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp"); //logged-in page
        } else {
            response.sendRedirect("login.jsp?status=false"); //error page 
        } 
    }

}
            
            
            /*Connection con = DatabaseConnection.getConnection();
        
            
           
        Statement st = null;
        //String result = "Data entered successfully!";
        String sql = "SELECT * FROM USERDB.USERACCOUNT WHERE email = '"+email+"' and password = '"+password+"'";

        try {
            st = con.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(iot_login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ResultSet rs = null;
        try {
            rs = st.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(iot_login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        try{
            rs.next();
            if (rs.getString("password").equals(password) && rs.getString("email").equals(email)) {
                out.println("Welcome " + rs.getString("firstName"));
            } else {
                out.println("Invalid password or username.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(iot_login.class.getName()).log(Level.SEVERE, null, ex);
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
