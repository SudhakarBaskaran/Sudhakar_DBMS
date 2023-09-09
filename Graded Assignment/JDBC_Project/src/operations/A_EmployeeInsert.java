package operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class A_EmployeeInsert {

	public static void main(String[] args) {
		 String url = "jdbc:mysql://localhost:3306/GL";
	        String username = "root";
	        String password = "2000";

	        try (Connection conn = DriverManager.getConnection(url, username, password)) {
	            String sql = "INSERT INTO employee (id, name, email_id, Phone_number) VALUES (?, ?, ?, ?)";
	            PreparedStatement pstmt = conn.prepareStatement(sql);

	            // Insert 5 records
	            for (int i = 1; i <= 5; i++) {
	                pstmt.setInt(1, i);
	                pstmt.setString(2, "Employee " + i);
	                pstmt.setString(3, "email" + i + "@example.com");
	                pstmt.setString(4, "123456789" + i);
	                pstmt.executeUpdate();
	            }

	            System.out.println("Records inserted successfully.");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	}

}
