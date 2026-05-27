package controller;

import dao.BookDAO;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class IndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        BookDAO dao = new BookDAO();

        List<Book> books = dao.getAllBooks();

        request.setAttribute("books", books);

        request.getRequestDispatcher("/jsp/index.jsp")
                .forward(request, response);
    }
}