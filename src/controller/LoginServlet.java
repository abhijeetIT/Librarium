package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        req.setAttribute("activePage", "login");
        req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
              String email = req.getParameter("email");
              String password = req.getParameter("password");

              User user = new UserDAO().validateUser(email, password);

        if (user != null) {
//            req.getSession().setAttribute("loggedInUser", user);
            res.sendRedirect(req.getContextPath() + "/books");
        } else {
//            req.setAttribute("activePage", "login");
            req.setAttribute("error", "Invalid email or password. Please try again.");
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
        }
    }
}
