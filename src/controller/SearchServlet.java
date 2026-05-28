package controller;

import dao.BookDAO;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

         // /search?q=Fiction&type=category
        // /search?q=James Clear&type=author
        // /search?q=Dune   (no type → search everything)
        String query = request.getParameter("q");
        String type  = request.getParameter("type");

        // trim and null-safe
        if (query != null) query = query.trim();
        if (type  != null) type  = type.trim().toLowerCase();

        BookDAO dao = new BookDAO();
        List<Book> results;

        // ── choose to correct DAO method based on type
        if (query == null || query.isEmpty()) {
            // no query → return all books
            results = dao.getAllBooks();

        } else if ("category".equals(type)) {
            results = dao.searchByCategory(query);

        } else if ("author".equals(type)) {
            results = dao.searchByAuthor(query);

        } else if ("title".equals(type)) {
            results = dao.searchByTitle(query);

        } else {
            // type is null or "all" search across title + author + category
            results = dao.searchAll(query);
        }

        //set attributes for search.jsp
        request.setAttribute("activePage",  "");
        request.setAttribute("query",       query);
        request.setAttribute("type",        type);
        request.setAttribute("results",     results);
        request.setAttribute("totalCount",  results.size());

        request.getRequestDispatcher("/jsp/search.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}