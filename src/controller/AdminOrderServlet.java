package controller;

import dao.OrderDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrderServlet extends HttpServlet {

    OrderDAO dao = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        // SESSION CHECK
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("admin") == null) {

            res.sendRedirect(req.getContextPath() + "/admin/login");

            return;
        }

        List<Order> orders = dao.getAllOrders();

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("/jsp/admin/orders.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("admin") == null) {

            res.sendError(401);

            return;
        }

        int orderId = Integer.parseInt(
                req.getParameter("orderId")
        );

        String status = req.getParameter("status");

        boolean updated = dao.updateOrderStatus(orderId, status);

        if(updated) {
            res.getWriter().print("success");
        } else {
            res.getWriter().print("failed");
        }
    }
}