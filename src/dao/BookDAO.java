package dao;

import model.Book;
import util.DBConnection;

import java.nio.channels.SelectableChannel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private Book mapRow(ResultSet rs) throws SQLException {
        Book book = new Book();
        book.setId(rs.getInt("id"));
        book.setTitle(rs.getString("title"));
        book.setAuthor(rs.getString("author"));
        book.setCategory(rs.getString("category"));
        book.setDescription(rs.getString("description"));
        book.setPrice(rs.getDouble("price"));
        book.setStock(rs.getInt("stock"));
        book.setImageUrl(rs.getString("image_url"));
        return book;
    }

    //  GET ALL BOOKS
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                books.add(mapRow(rs));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.getAllBooks error: " + e.getMessage());
        }
        return books;
    }

    //  SEARCH BY TITLE  (LIKE %query%)
    public List<Book> searchByTitle(String query) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE title LIKE ? ORDER BY title";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + query + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                books.add(mapRow(rs));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.searchByTitle error: " + e.getMessage());
        }
        return books;
    }

    //  SEARCH BY AUTHOR  (LIKE %query%)
    public List<Book> searchByAuthor(String query) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE author LIKE ? ORDER BY author";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + query + "%");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                books.add(mapRow(rs));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.searchByAuthor error: " + e.getMessage());
        }
        return books;
    }


    //  SEARCH BY CATEGORY
    public List<Book> searchByCategory(String query) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE LOWER(category) = LOWER(?) ORDER BY title";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                books.add(mapRow(rs));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.searchByCategory error: " + e.getMessage());
        }
        return books;
    }

    //  SEARCH ALL
    //  Used when user types in the navbar search bar
    //  without specifying a type
    public List<Book> searchAll(String query) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books " +
                "WHERE title    LIKE ? " +
                "   OR author   LIKE ? " +
                "   OR category LIKE ? " +
                "ORDER BY title";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String like = "%" + query + "%";
            ps.setString(1, like);
            ps.setString(2, like);
            ps.setString(3, like);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                books.add(mapRow(rs));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.searchAll error: " + e.getMessage());
        }
        return books;
    }

    public List<String> getAllCategories() {
        List<String> categories = new ArrayList<>();
        String sql = "SELECT DISTINCT category FROM books WHERE category IS NOT NULL ORDER BY category";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                categories.add(rs.getString("category"));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.getAllCategories error: " + e.getMessage());
        }
        return categories;
    }


    //  GET ALL DISTINCT AUTHORS  (for index.jsp + books.jsp)
    public List<String> getAllAuthors() {
        List<String> authors = new ArrayList<>();
        String sql = "SELECT DISTINCT author FROM books WHERE author IS NOT NULL ORDER BY author";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                authors.add(rs.getString("author"));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.getAllAuthors error: " + e.getMessage());
        }
        return authors;
    }

    //  GET TOP 5 FEATURED BOOKS  (for books.jsp)
    public List<Book> getTop5Books() {

        List<Book> books = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM books LIMIT 5");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                books.add(mapRow(rs));
            }

        } catch (SQLException e) {
            System.out.println("BookDAO.getFeaturedBooks error: " + e.getMessage());
        }
        return books;
    }

    public Book getBookById(int id) {
        String sql = "SELECT * FROM books WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);
        } catch (SQLException e) {
            System.out.println("BookDAO.getBookById error: " + e.getMessage());
        }
        return null;
    }

    //Add Book
    public boolean addBook(Book book) {

        try(Connection con = DBConnection.getConnection()) {

            PreparedStatement ps =
                    con.prepareStatement(
                            "INSERT INTO books(title,author,category,price,image_url) VALUES(?,?,?,?,?)"
                    );

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getCategory());
            ps.setDouble(4, book.getPrice());
            ps.setString(5, book.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    //Update
    public boolean updateBook(Book book) {

        try(Connection con = DBConnection.getConnection()) {

            PreparedStatement ps =
                    con.prepareStatement(
                            "UPDATE books SET title=?, author=?, category=?, price=?, image_url=? WHERE id=?"
                    );

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getCategory());
            ps.setDouble(4, book.getPrice());
            ps.setString(5, book.getImageUrl());
            ps.setInt(6, book.getId());

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    //Delete
    public boolean deleteBook(int id) {

        try(Connection con = DBConnection.getConnection()) {

            PreparedStatement ps =
                    con.prepareStatement(
                            "DELETE FROM books WHERE id=?"
                    );

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}