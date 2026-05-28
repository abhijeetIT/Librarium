package controller;

import dao.OrderDAO;
import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    // show profile + orders
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();

        request.setAttribute("orders",     orderDAO.getOrdersByUser(user.getId()));
        request.setAttribute("activePage", "profile");
        request.getRequestDispatcher("/jsp/profile.jsp").forward(request, response);
    }

    // update info OR delete account
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        UserDAO userDAO = new UserDAO();

        if ("delete".equals(action)) {
            // delete account → invalidate session
            userDAO.deleteUser(user.getId());
            request.getSession().invalidate();
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        // default → update profile
        String name    = request.getParameter("name");
        String phone   = request.getParameter("phone");
        String address = request.getParameter("address");

        user.setName(name);
        user.setPhone(phone);
        user.setAddress(address);

        boolean updated = userDAO.updateUser(user);

        if (updated) {
            // refresh user in session
            User refreshed = userDAO.getUserById(user.getId());
            request.getSession().setAttribute("loggedInUser", refreshed);
            request.setAttribute("success", "Profile updated successfully.");
        } else {
            request.setAttribute("error", "Update failed. Please try again.");
        }

        // re-load orders and forward back to profile
        OrderDAO orderDAO = new OrderDAO();
        request.setAttribute("orders",     orderDAO.getOrdersByUser(user.getId()));
        request.setAttribute("activePage", "profile");
        request.getRequestDispatcher("/jsp/profile.jsp").forward(request, response);
    }
}
