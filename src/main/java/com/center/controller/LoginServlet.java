package com.center.controller;

import com.center.dao.UserDAO;
import com.center.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        UserDAO userDAO = new UserDAO();
        User loggedInUser = userDAO.login(user, pass);
        
        if (loggedInUser != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", loggedInUser);
            
            if ("admin".equals(loggedInUser.getRole())) {
                response.sendRedirect("admin.jsp");
            } else if ("registrar".equals(loggedInUser.getRole())) {
                response.sendRedirect("registrar.jsp");
            } else if ("teacher".equals(loggedInUser.getRole())) {
                response.sendRedirect("teacher.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=invalid");
        }
    }
}
