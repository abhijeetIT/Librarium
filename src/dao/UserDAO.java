package dao;

import model.User;
import util.DBConnection;

import java.sql.*;

public class UserDAO {

    // ── Validate login
    public User validateUser(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password); // hash in production
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapRow(rs);
            }

        } catch (SQLException e) {
            System.out.println("UserDAO.validateUser error: " + e.getMessage());
        }
        return null;
    }

    // ── Register new user
    public boolean registerUser(User user) {
        // Check email already exists
        if (emailExists(user.getEmail())) return false;

        String sql = "INSERT INTO users (name, email, password, phone, address) VALUES (?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getAddress());
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("UserDAO.registerUser error: " + e.getMessage());
            return false;
        }
    }

    // ── Update profile (name, phone, address)
    public boolean updateUser(User user) {
        String sql = "UPDATE users SET name=?, phone=?, address=? WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getId());
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("UserDAO.updateUser error: " + e.getMessage());
            return false;
        }
    }

    // ── Delete account
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("UserDAO.deleteUser error: " + e.getMessage());
            return false;
        }
    }

    // ── Get user by id (refresh session after update)
    public User getUserById(int id) {
        String sql = "SELECT * FROM users WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return mapRow(rs);

        } catch (SQLException e) {
            System.out.println("UserDAO.getUserById error: " + e.getMessage());
        }
        return null;
    }

    private boolean emailExists(String email) {
        String sql = "SELECT id FROM users WHERE email = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            return ps.executeQuery().next();
        } catch (SQLException e) {
            return false;
        }
    }

    private User mapRow(ResultSet rs) throws SQLException {
        User u = new User();
        u.setId(rs.getInt("id"));
        u.setName(rs.getString("name"));
        u.setEmail(rs.getString("email"));
        u.setPassword(rs.getString("password"));
        u.setPhone(rs.getString("phone"));
        u.setAddress(rs.getString("address"));
        u.setCreatedAt(rs.getTimestamp("created_at"));
        return u;
    }
}