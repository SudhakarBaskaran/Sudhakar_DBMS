package operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class E_DeleteEmployeeByIds {

	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/GL";
        String username = "root";
        String password = "2000";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            int[] employeeIdsToDelete = {3, 4};

            for (int id : employeeIdsToDelete) {
                deleteEmployee(conn, id);
            }

            System.out.println("Employee records with Id 3 and 4 deleted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void deleteEmployee(Connection conn, int id) throws SQLException {
        String sql = "DELETE FROM employee WHERE Id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }
	}

}
