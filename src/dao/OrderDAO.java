package dao;

import model.CartItem;
import model.Order;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    /*
     SQL to create the orders table (run once in MySQL):

     CREATE TABLE orders (
         id           INT AUTO_INCREMENT PRIMARY KEY,
         user_id      INT NOT NULL,
         book_id      INT NOT NULL,
         book_title   VARCHAR(255),
         quantity     INT NOT NULL DEFAULT 1,
         total_price  DOUBLE NOT NULL,
         address      TEXT,
         phone        VARCHAR(20),
         payment_mode VARCHAR(20) DEFAULT 'COD',
         status       VARCHAR(20) DEFAULT 'PLACED',
         ordered_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
         FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
     );
    */

    // ── Place all cart items as individual order rows
    public boolean placeOrder(int userId, List<CartItem> cartItems,
                              String address, String phone, String paymentMode) {

        String sql = "INSERT INTO orders " +
                     "(user_id, book_id, book_title, quantity, total_price, address, phone, payment_mode, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'PLACED')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            for (CartItem item : cartItems) {
                ps.setInt(1, userId);
                ps.setInt(2, item.getBookId());
                ps.setString(3, item.getTitle());
                ps.setInt(4, item.getQuantity());
                ps.setDouble(5, item.getSubtotal());
                ps.setString(6, address);
                ps.setString(7, phone);
                ps.setString(8, paymentMode);
                ps.addBatch();
            }

            ps.executeBatch();
            return true;

        } catch (SQLException e) {
            System.out.println("OrderDAO.placeOrder error: " + e.getMessage());
            return false;
        }
    }

    // ── Get all orders for a user (for profile page)
    public List<Order> getOrdersByUser(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id = ? ORDER BY ordered_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setUserId(rs.getInt("user_id"));
                o.setBookId(rs.getInt("book_id"));
                o.setBookTitle(rs.getString("book_title"));
                o.setQuantity(rs.getInt("quantity"));
                o.setTotalPrice(rs.getDouble("total_price"));
                o.setAddress(rs.getString("address"));
                o.setPhone(rs.getString("phone"));
                o.setPaymentMode(rs.getString("payment_mode"));
                o.setStatus(rs.getString("status"));
                o.setOrderedAt(rs.getTimestamp("ordered_at"));
                orders.add(o);
            }

        } catch (SQLException e) {
            System.out.println("OrderDAO.getOrdersByUser error: " + e.getMessage());
        }
        return orders;
    }
}
