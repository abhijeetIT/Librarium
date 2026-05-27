package dao;

import model.User;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {
       public boolean register(User user){
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

}
