package controller;

import dao.BookDAO;
import model.Book;
import model.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    // ── GET /cart  → show cart page
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Must be logged in
        if (request.getSession().getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<CartItem> cart = getCart(request);
        double total = cart.stream().mapToDouble(CartItem::getSubtotal).sum();

        request.setAttribute("cart",       cart);
        request.setAttribute("cartTotal",  total);
        request.setAttribute("activePage", "cart");

        request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
    }

    // ── POST /cart  → add item OR remove item
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Must be logged in
        if (request.getSession().getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action"); // "add" or "remove"

        if ("remove".equals(action)) {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            removeFromCart(request, bookId);

        } else {
            // default action = add
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            addToCart(request, bookId);
        }

        // update badge count in session
        updateCartCount(request);

        // redirect back to wherever (referer or cart page)
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }

    // ── helpers ──────────────────────────────────────

    @SuppressWarnings("unchecked")
    private List<CartItem> getCart(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    private void addToCart(HttpServletRequest request, int bookId) {
        List<CartItem> cart = getCart(request);

        // if already in cart → increment quantity
        for (CartItem item : cart) {
            if (item.getBookId() == bookId) {
                item.setQuantity(item.getQuantity() + 1);
                return;
            }
        }

        // else fetch book details and add new item
        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.getBookById(bookId);
        if (book != null) {
            CartItem item = new CartItem(
                    book.getId(),
                    book.getTitle(),
                    book.getAuthor(),
                    book.getImageUrl(),
                    book.getPrice(),
                    1
            );
            cart.add(item);
        }
    }

    private void removeFromCart(HttpServletRequest request, int bookId) {
        List<CartItem> cart = getCart(request);
        cart.removeIf(item -> item.getBookId() == bookId);
    }

    private void updateCartCount(HttpServletRequest request) {
        List<CartItem> cart = getCart(request);
        int count = cart.stream().mapToInt(CartItem::getQuantity).sum();
        request.getSession().setAttribute("cartCount", count);
    }
}