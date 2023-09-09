package operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class D_UpdateEmloyeeById {

	public static void main(String[] args) {
		 String url = "jdbc:mysql://localhost:3306/GL";
	        String username = "root";
	        String password = "2000";

	        try (Connection conn = DriverManager.getConnection(url, username, password)) {
	            int employeeIdToUpdate = 3;
	            String newName = "Karthik";
	            String newPhoneNumber = "1234567890";

	            updateEmployee(conn, employeeIdToUpdate, newName, newPhoneNumber);
	            System.out.println("Employee with Id 3 updated successfully.");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    private static void updateEmployee(Connection conn, int id, String newName, String newPhoneNumber) throws SQLException {
	        String sql = "UPDATE employee SET Name = ?, Phone_Number = ? WHERE Id = ?";
	        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	            pstmt.setString(1, newName);
	            pstmt.setString(2, newPhoneNumber);
	            pstmt.setInt(3, id);
	            pstmt.executeUpdate();
	        }

	}

}
