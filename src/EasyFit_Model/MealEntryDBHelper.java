package EasyFit_Model;

import java.sql.*;

public class MealEntryDBHelper {
	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public MealEntryDBHelper() {
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
			System.out.println("ERROR: MealEntry_ctor: ");
			e.printStackTrace();
		}
	}

	public ResultSet getAllEntries(String userID) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM MealLogDB WHERE userID = ? ORDER BY mDate");		//returns bmi entries for this user sorted by date
			pstmt.setString(1, userID);			
			return pstmt.executeQuery();
		} catch (SQLException e4) {
			// TODO Auto-generated catch block
			e4.printStackTrace();
		}
		return null;
	}
	
	public boolean addEntry(String userID, MealEntry e) {
		try {
			pstmt = con.prepareStatement("INSERT INTO MealLogDB(userID, mealLogID, mDate, contents, calTot) VALUES (?, ?, ?, ?, ?)");
			pstmt.setString(1, userID);
			pstmt.setString(2, e.getMealLogID());
			pstmt.setString(3, e.getDate());
			pstmt.setString(4, e.getContents());
			pstmt.setInt(5, e.getCalTotal());

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


	public boolean deleteEntry(String userID, String mealLogID) {
		try {
			pstmt = con.prepareStatement("DELETE FROM MealLogDB WHERE userID = ? AND mealLogID = ?");
			pstmt.setString(1, userID);
			pstmt.setString(2, mealLogID);
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
