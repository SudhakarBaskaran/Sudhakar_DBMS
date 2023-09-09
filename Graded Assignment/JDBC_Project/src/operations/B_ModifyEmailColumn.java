package operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class B_ModifyEmailColumn {

	public static void main(String[] args) {
		String url = "jdbc:mysql://localhost:3306/GL";
        String username = "root";
        String password = "2000";

        try (Connection conn = DriverManager.getConnection(url, username, password);
             Statement stmt = conn.createStatement()) {
            String sql = "ALTER TABLE employee MODIFY Email_Id VARCHAR(30) NOT NULL";
            stmt.executeUpdate(sql);
            System.out.println("Email_Id column modified successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

}
