
package com.mycompany.servelets;


import com.mycompany.entity.User;
import com.mycompany.mycart.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class RegisterServelet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            try {
                
                String userName= request.getParameter("username");
                String userEmail= request.getParameter("useremail");
                String userPassword= request.getParameter("userpassword");
                String userPhone= request.getParameter("userphone");
                String userAddress= request.getParameter("useraddress");
                
                
                if (userName.isEmpty())
                {
                  out.println("Name is Blank");
                  return;
                }
                
           
              User user = new User(userName, userEmail, userPassword, userPhone, "default", userAddress, "normal");
           
           Session hiberateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hiberateSession.beginTransaction();
           
           int userId = (int) hiberateSession.save(user);
           tx.commit();
           hiberateSession.close();
           
                HttpSession httpsession=request.getSession();
           httpsession.setAttribute("messege","Successful");
           
           response.sendRedirect("register.jsp");
           return;
           
         
           
            } catch (Exception e){
                e.printStackTrace();
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
