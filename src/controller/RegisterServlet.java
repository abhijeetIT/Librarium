package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpRequest;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        req.setAttribute("activePage", "register");
        req.getRequestDispatcher("/jsp/register.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String name    = req.getParameter("name");
        String email   = req.getParameter("email");
        String phone   = req.getParameter("phone");
        String address = req.getParameter("address");
        String password= req.getParameter("password");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setPassword(password); // hash it before saving!

        boolean success = new UserDAO().registerUser(user);

        if (success) {
            // Redirect to login with a success message
            req.getSession().setAttribute("success", "Account created! Please login.");
            res.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("activePage", "register");
            req.setAttribute("error", "Email already registered. Try logging in.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, res);
        }
    }
}
