package EasyFit_Model;

import java.sql.*;

public class BMIEntryDBHelper {
	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public BMIEntryDBHelper() {
		try {
			String host = "localhost";				
			String dbName = "xe";
			int port = 1521;
			oracleURL = "jdbc:oracle:thin:@" + host + ":" + port + ":" + dbName;
			//change depending on user
			username = "system";
			password = "Oracle.com0709";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(oracleURL, username, password);

		} catch(Exception e) {
			System.out.println("ERROR: BMIEntry_ctor: ");
			e.printStackTrace();
		}
	}
	
	public ResultSet getAllEntries(String userID) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM BMILogDB WHERE userID = ? ORDER BY bDate");		//returns bmi entries for this user sorted by date
			pstmt.setString(1, userID);			
			return pstmt.executeQuery();
		} catch (SQLException e4) {
			// TODO Auto-generated catch block
			e4.printStackTrace();
		}
		return null;
	}

	public boolean addEntry(String userID, BMIEntry e) {
		try {
			pstmt = con.prepareStatement("INSERT INTO BMILogDB(userID, bmiLogID, bDate, bmi) VALUES (?, ?, ?, ?)");
			pstmt.setString(1, userID);
			pstmt.setString(2, e.hashcode());
			pstmt.setString(3, e.getDate());
			pstmt.setDouble(4, e.calculateBMI());

			int flag = pstmt.executeUpdate();

			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		}catch (Exception e2) {
			System.out.println("ERROR: BMIEntry_addEntry: ");
			e2.printStackTrace();
		}
		return false;
	}


	public boolean deleteEntry(String userID, String bmiLogID) {
		try {
			pstmt = con.prepareStatement("DELETE FROM BMILogDB WHERE userID = ? AND bmiLogID = ?");
			pstmt.setString(1, userID);
			pstmt.setString(2, bmiLogID);
			int flag = pstmt.executeUpdate();

			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e3) {
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}
		return false;
	}
}
