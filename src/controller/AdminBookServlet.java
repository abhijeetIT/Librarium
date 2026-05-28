package controller;

import dao.BookDAO;
import model.Book;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/book")
public class AdminBookServlet extends HttpServlet {

    BookDAO dao = new BookDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {

        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("admin") == null) {

            res.sendError(HttpServletResponse.SC_UNAUTHORIZED);

            return;
        }

        String action = req.getParameter("action");

        // Add
        if ("add".equals(action)) {

            Book book = new Book();

            book.setTitle(req.getParameter("title"));
            book.setAuthor(req.getParameter("author"));
            book.setCategory(req.getParameter("category"));
            book.setPrice(
                    Double.parseDouble(
                            req.getParameter("price")
                    )
            );
            book.setImageUrl(req.getParameter("imageUrl"));

            dao.addBook(book);

            res.getWriter().print("Book Added");
        }

        //Update
        else if ("update".equals(action)) {

            Book book = new Book();

            book.setId(
                    Integer.parseInt(req.getParameter("id"))
            );

            book.setTitle(req.getParameter("title"));
            book.setAuthor(req.getParameter("author"));
            book.setCategory(req.getParameter("category"));
            book.setPrice(
                    Double.parseDouble(
                            req.getParameter("price")
                    )
            );
            book.setImageUrl(req.getParameter("imageUrl"));

            dao.updateBook(book);

            res.getWriter().print("Book Updated");
        }

        //Delete
        else if ("delete".equals(action)) {

            int id = Integer.parseInt(
                    req.getParameter("id")
            );

            dao.deleteBook(id);

            res.getWriter().print("Book Deleted");
        }
    }
}
