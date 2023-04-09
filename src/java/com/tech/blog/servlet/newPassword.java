package com.tech.blog.servlet;

import com.tech.blog.entities.Message;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class newPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;
        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_library", "root", "Mayank@12");
                PreparedStatement pst = con.prepareStatement("update user set password = ? where email = ? ");
                pst.setString(1, newPassword);
                pst.setString(2, (String) session.getAttribute("email"));

                int rowCount = pst.executeUpdate();
                if (rowCount > 0) {
                    Message msg = new Message("Password Reset Successfully Login With New Password", "Success", "alert-success");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);

                    response.sendRedirect("login_page.jsp");
                    dispatcher = request.getRequestDispatcher("login_page.jsp");
                } else {
                     Message msg = new Message("Somthing Went Wrong Please Try Again !", "Error", "alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                    dispatcher = request.getRequestDispatcher("forgotpassword.jsp");
                }
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
