package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // If already logged in, redirect to books
        if (request.getSession().getAttribute("loggedInUser") != null) {
            response.sendRedirect(request.getContextPath() + "/books");
            return;
        }

        request.setAttribute("activePage", "login");
        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.validateUser(email, password);

        if (user != null) {
            // ── create session and store user ──
            HttpSession session = request.getSession(true);
            session.setAttribute("loggedInUser", user);   // navbar reads this
            session.setAttribute("cartCount", 0);         // init cart badge

            // redirect to books after login
            response.sendRedirect(request.getContextPath() + "/books");

        } else {
            request.setAttribute("activePage", "login");
            request.setAttribute("error", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
        }
    }
}