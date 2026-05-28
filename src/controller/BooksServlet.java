package controller;

import dao.BookDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/books")
public class BooksServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        BookDAO dao = new BookDAO();

        // top 5 books + all distinct authors
        request.setAttribute("featuredBooks", dao.getTop5Books());
        request.setAttribute("authors",       dao.getAllAuthors());
        request.setAttribute("activePage",    "books");

        request.getRequestDispatcher("/jsp/books.jsp")
                .forward(request, response);
    }
}
