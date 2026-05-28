package controller;

import dao.AdminDAO;
import model.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.getRequestDispatcher("/jsp/admin/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Admin admin = new AdminDAO().login(username, password);

        if(admin != null) {

            HttpSession session = req.getSession();

            session.setAttribute("admin", admin);

            res.sendRedirect(req.getContextPath() + "/admin/dashboard");

        } else {

            req.setAttribute("error", "Invalid Username or Password");

            req.getRequestDispatcher("/jsp/admin/login.jsp").forward(req, res);
        }
    }
}