package dao;

import model.Book;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    // Get all books
    public List<Book> getAllBooks() {

        List<Book> books = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM books";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Book book = new Book();

                book.setId(rs.getInt("id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setCategory(rs.getString("category"));
                book.setDescription(rs.getString("description"));
                book.setPrice(rs.getDouble("price"));
                book.setStock(rs.getInt("stock"));
                book.setImageUrl(rs.getString("image_url"));

                books.add(book);
            }

        } catch (SQLException e) {

            System.out.println("Error: " + e.getMessage());
        }

        return books;
    }
}