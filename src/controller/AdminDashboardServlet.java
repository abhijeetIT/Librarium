package controller;

import dao.BookDAO;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    BookDAO dao = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse res)
            throws ServletException, IOException {

        //Session Check if false then login page
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("admin") == null) {

            res.sendRedirect(req.getContextPath() + "/admin/login");

            return;
        }

        List<Book> books = dao.getAllBooks();

        req.setAttribute("books", books);

        req.getRequestDispatcher("/jsp/admin/dashboard.jsp").forward(req, res);
    }
}