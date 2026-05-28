package dao;

import model.Admin;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    public Admin login(String username, String password) {

        try(Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM admin WHERE username=? AND password=?"
            );

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                Admin admin = new Admin();

                admin.setId(rs.getInt("id"));
                admin.setUsername(rs.getString("username"));

                return admin;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}