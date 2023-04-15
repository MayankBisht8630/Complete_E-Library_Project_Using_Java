package com.tech.blog.servlet;

import com.tech.blog.dao.Postdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Rating;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RatingServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String userName = request.getParameter("userName");
            String review = request.getParameter("userMessage");
            String ratingValue = request.getParameter("rating");
            
            int postId = Integer.parseInt(request.getParameter("postId")); 
            
            Rating rating = new Rating(userName, review, postId, ratingValue);
            Postdao dao = new Postdao(ConnectionProvider.getConnection());
            if(dao.RatingPost(rating))
            {
               HttpSession s = request.getSession();
               Message m = new Message("Comment Added Successfully", "success", "alert-success");
               s.setAttribute("msggg", m);
               response.sendRedirect("rating_book.jsp?post_id="+postId);
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
