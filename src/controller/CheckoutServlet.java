package controller;

import dao.OrderDAO;
import model.CartItem;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    // ── GET /checkout → show checkout form pre-filled with user address
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();

        request.setAttribute("cart",        cart);
        request.setAttribute("cartTotal",   total);
        request.setAttribute("activePage",  "");
        request.getRequestDispatcher("/jsp/checkout.jsp").forward(request, response);
    }

    // ── POST /checkout → place order, clear cart, show confirmation
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("loggedInUser");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        String address     = request.getParameter("address");
        String phone       = request.getParameter("phone");
        String paymentMode = request.getParameter("paymentMode");

        OrderDAO orderDAO = new OrderDAO();
        boolean success = orderDAO.placeOrder(user.getId(), cart, address, phone, paymentMode);

        if (success) {
            // clear cart from session
            request.getSession().removeAttribute("cart");
            request.getSession().setAttribute("cartCount", 0);

            double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();

            // pass order summary to confirmation page
            request.setAttribute("orderedItems",  cart);
            request.setAttribute("orderTotal",    total);
            request.setAttribute("orderAddress",  address);
            request.setAttribute("orderPhone",    phone);
            request.setAttribute("orderPayment",  paymentMode);
            request.setAttribute("activePage",    "");

            request.getRequestDispatcher("/jsp/order-confirm.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/jsp/checkout.jsp").forward(request, response);
        }
    }
}
