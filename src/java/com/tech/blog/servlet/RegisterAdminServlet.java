package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.SendEmail;
import com.tech.blog.entities.user;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@MultipartConfig
public class RegisterAdminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch all form data
            String check = request.getParameter("check");
            if (check == null) {
                out.println("Please Check The Terms And Condition");
            } 
            else 
            {
                //all data 
                String name = request.getParameter("user_name");
                String email = request.getParameter("user_email");
                String password = request.getParameter("user_password");
                String gender = request.getParameter("gender");
                String about = request.getParameter("about");

                //creat user object and set all the data to that object
                user user = new user(name, email, password, gender, about);

                //creat UserDao object
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                dao.saveUser(user);
                
                    //email verification 
                    String name1 = request.getParameter("user_name");
                    String email1 = request.getParameter("user_email");

                    SendEmail sm = new SendEmail();
                    String code = sm.getRandom();

                    user user1 = new user(name1, email1, code);
                    boolean test = sm.sendEmail(user1);

                    if (test) 
                    {
                        HttpSession Session = request.getSession();
                        Session.setAttribute("authcode",user1);
                        out.println("Done");
                    }
                    else 
                    {
                    HttpSession Session = request.getSession();
                    response.sendRedirect("verify.jsp");
                    out.println("You Have Entered Wrong Code ");
                }
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
