package dao;

import model.CartItem;
import model.Order;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    // Place order of all item currently in cart
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

    // Get all orders for a user (for profile page)
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

    public List<Order> getAllOrders() {

        List<Order> list = new ArrayList<>();

        try(Connection con = DBConnection.getConnection()) {

            String sql =
                    "SELECT o.*, u.name, u.email " + "FROM orders o " + "JOIN users u ON o.user_id = u.id " +
                            "ORDER BY o.ordered_at DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

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

                o.setOrderedAt(
                        rs.getTimestamp("ordered_at")
                );

                // user table
                o.setUserName(rs.getString("name"));

                o.setUserEmail(rs.getString("email"));

                list.add(o);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateOrderStatus(int orderId, String status) {

        try(Connection con = DBConnection.getConnection()) {

            PreparedStatement ps =
                    con.prepareStatement(
                            "UPDATE orders SET status=? WHERE id=?"
                    );

            ps.setString(1, status);

            ps.setInt(2, orderId);

            return ps.executeUpdate() > 0;

        } catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
