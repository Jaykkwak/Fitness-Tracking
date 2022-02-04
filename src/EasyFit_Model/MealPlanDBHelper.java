package EasyFit_Model;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class MealPlanDBHelper {
	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public MealPlanDBHelper() {
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

	public boolean addEntry(String userID, MealPlan e) {
		try {
			pstmt = con.prepareStatement("INSERT INTO MealPlanDB(userID, dailyCalIntake, targetBMI, protein, carbs, fat) VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, userID);
			pstmt.setInt(2, e.getIntake());
			pstmt.setInt(3, e.getTargetBMI());
			pstmt.setInt(4, e.getProtein());
			pstmt.setInt(5, e.getCarbs());
			pstmt.setInt(6, e.getFat());
			
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
	
	public MealPlan getMealPlan(String userID) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM MealPlanDB WHERE userID = ?");
			pstmt.setString(1, userID);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.getFetchSize()==0) {
				System.out.println("MealPlanDB: no existing mp");
				return null;
			}
			else {
				System.out.println("MealPlanDB: existing mp");
				rs.next();
				int intake = rs.getInt("dailyCalIntake");
				int targetBMI = rs.getInt("targetBMI");
				int protein = rs.getInt("protein");
				int fat = rs.getInt("carbs");
				int carbs = rs.getInt("fat");
				
				MealPlan mp = new MealPlan(intake, targetBMI, protein, carbs, fat);
				return mp;
			}
			
			
		} catch (SQLException e4) {
			// TODO Auto-generated catch block
			e4.printStackTrace();
		}
		return null;
	}

	public boolean deleteEntry(String userID) {
		try {
			pstmt = con.prepareStatement("DELETE FROM MealPlanDB WHERE userID = ?");
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
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}
		return false;
	}
}