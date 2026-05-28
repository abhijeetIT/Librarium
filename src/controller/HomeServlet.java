package controller;

import dao.BookDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        BookDAO dao = new BookDAO();

        // index.jsp shows categories and authors — no book list
        request.setAttribute("categories", dao.getAllCategories());
        request.setAttribute("authors",    dao.getAllAuthors());
        request.setAttribute("activePage", "home");

        request.getRequestDispatcher("/jsp/index.jsp")
                .forward(request, response);
    }
}