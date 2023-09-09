package operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class F_RemoveAllEmployeeRecords {

	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/GL";
        String username = "root";
        String password = "2000";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            removeAllEmployeeRecords(conn);
            System.out.println("All employee records removed successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void removeAllEmployeeRecords(Connection conn) throws SQLException {
        String sql = "DELETE FROM employee";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.executeUpdate();
        }
	}

}
