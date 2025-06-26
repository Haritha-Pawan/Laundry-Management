package dao;


import model.User;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
   

	public boolean insertUser(User user) {
        String sql = "INSERT INTO users (first_name, last_name, address, nic, role, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getAddress());
            stmt.setString(4, user.getNic());
            stmt.setString(5, user.getRole());
            stmt.setString(6, user.getEmail());
            stmt.setString(7, user.getPhone());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();

        String sql = "SELECT * FROM users";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setAddress(rs.getString("address"));
                user.setNic(rs.getString("nic"));
                user.setRole(rs.getString("role"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
    
    
    public boolean deleteUserById(int id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    

    public static User getUserById(int id) {
        User user = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?")) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setNic(rs.getString("nic"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    
    public boolean updateUser(User user) {
        String query = "UPDATE users SET first_name = ?, last_name = ?, email = ?, phone = ?, nic = ?, address = ?, role = ?  WHERE id = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getNic());
            ps.setString(6, user.getAddress());
            ps.setString(7, user.getRole());
            ps.setInt(8, user.getId());
            
            int rowsAffected = ps.executeUpdate();
            
            return rowsAffected > 0; // Return true if update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
 
    
    
    public static int getStaffCount() {
        int count = 0;
        String query = "SELECT COUNT(*) FROM users ";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
             
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
    
    
    
   


    

    
    
    
    
    
    
}