package dao;

import model.User;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
       public boolean registerUser(User user){
           try(Connection con = DBConnection.getConnection()){
               PreparedStatement ps = con.prepareStatement("INSERT INTO users (name,email,password,phone,address) " +
                       "VALUES (?,?,?,?,?)");
               ps.setString(1,user.getName());
               ps.setString(2,user.getEmail());
               ps.setString(3,user.getPassword());
               ps.setString(4,user.getPhone());
               ps.setString(5,user.getAddress());

               return ps.executeUpdate() > 0;
           } catch (Exception e) {
               throw new RuntimeException(e);
           }
       }

    public User validateUser(String email, String password) {

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setAddress(rs.getString("address"));
                user.setCreatedAt(rs.getTimestamp("created_at"));

                return user;
            }

            return null;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
