/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.servelets;

import com.mycompany.entity.category;
import com.mycompany.entity.product;
import com.mycompany.mycart.FactoryProvider;
import com.mycompany.userdao.categorydao;
import com.mycompany.userdao.productdao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale.Category;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author CHAR
 */
@MultipartConfig
public class ProductOperationServelet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Category Category)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory")){
                 String title=request.getParameter("Title");
            String Description = request.getParameter("Description");
            
            category category = new category();
            category.setCategoryTitle(title);
            category.setCategoryDescription(Description);
            
            categorydao categorydao = new categorydao(FactoryProvider.getFactory());
            int catId = categorydao.saveCategory(Category);
            out.println("Category Saved");
             HttpSession httpSession = request.getSession();
                httpSession.setAtrribute("messege", +catId);
                response.sendRedirect("admin.jsp");
                return;
            
                
            }else if(op.trim().equals("addproduct")){
                String pName=request.getParameter("pName");
                String pDesc=request.getParameter("pDesc");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                Part part=request.getPart("pPic"); 
                
                product p = new product();
                p.setpName(pName);
                p.setpDes(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpName(pName);
                p.setpPhoto(part.getSubmittedFileName());
                
               categorydao cdao = new categorydao(FactoryProvider.getFactory());
                Category  category = cdao.getCategoryById(catId);
                p.setCategory(category);
                
                productdao pdao =new productdao(FactoryProvider.getFactory());
                   pdao.saveProduct(p);
                out.println("Product Saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAtrribute("messege", +catId);
                response.sendRedirect("admin.jsp");
                return;
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
