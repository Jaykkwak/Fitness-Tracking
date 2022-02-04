package EasyFit_Model;

import java.sql.*;

public class FitnessGoalDBHelper {
	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public FitnessGoalDBHelper() {
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
			System.out.println("ERROR: FitnessGoalDBHelper_ctor: ");
			e.printStackTrace();
		}
	}
	
	public FitnessGoal getFG(String userID) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM FitnessGoalDB WHERE userID = ?");
			pstmt.setString(1, userID);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			double currentBMI = rs.getDouble("currentBMI");
			double targetBMI = rs.getDouble("targetBMI");
			int timeframe = rs.getInt("timeframe");
			

			FitnessGoal fg = new FitnessGoal(currentBMI, targetBMI, timeframe);
			return fg;
		}catch (Exception e2) {
			System.out.println("ERROR: FitnessGoalEntry_addEntry: ");
			e2.printStackTrace();
		}
		return null;
	}

	public boolean addEntry(String userID, FitnessGoal e) {
		try {
			pstmt = con.prepareStatement("INSERT INTO FitnessGoalDB(userID, currentBMI, targetBMI, timeframe) VALUES (?, ?, ?, ?)");
			pstmt.setString(1, userID);
			pstmt.setDouble(2, e.getCurrentBMI());
			pstmt.setDouble(3, e.getTargetBMI());
			pstmt.setInt(4, e.getTimeFrame());

			int flag = pstmt.executeUpdate();

			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		}catch (Exception e2) {
			System.out.println("ERROR: FitnessGoalEntry_addEntry: ");
			e2.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteEntry(String userID) {
		try {
			pstmt = con.prepareStatement("DELETE FROM FitnessGoalDB WHERE userID = ?");
			pstmt.setString(1, userID);
			int flag = pstmt.executeUpdate();

			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e3) {
			System.out.println("ERROR: FitnessGoalEntry_deleteEntry: ");
			e3.printStackTrace();
		}
		return false;
	}
} 