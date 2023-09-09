package operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class C_InsertTwoRecordsandCheck {

	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/GL";
        String username = "root";
        String password = "2000";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            // Insert the first record
            insertEmployeeRecord(conn, 6, "Employee 6", "email6@example.com", "1234567896");

            // Insert the second record
            insertEmployeeRecord(conn, 7, "Employee 7", "email7@example.com", "1234567897");

            System.out.println("Two records inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void insertEmployeeRecord(Connection conn, int id, String name, String email, String phoneNumber) throws SQLException {
        String sql = "INSERT INTO employee (id, Name, Email_Id, Phone_Number) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.setString(2, name);
            pstmt.setString(3, email);
            pstmt.setString(4, phoneNumber);
            pstmt.executeUpdate();
        }
	}

}
