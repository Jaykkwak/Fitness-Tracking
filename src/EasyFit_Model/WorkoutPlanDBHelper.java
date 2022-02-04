package EasyFit_Model;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;

public class WorkoutPlanDBHelper {
	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public WorkoutPlanDBHelper() {
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
			System.out.println("ERROR: WorkoutPlanDB_ctor: ");
			e.printStackTrace();
		}
	}

	public boolean addEntry(String userID, WorkoutPlan e) {
		try {
			pstmt = con.prepareStatement("INSERT INTO WorkoutPlanDB(userID, pref, sun, mon, tues, wed, thurs, fri, sat) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? )");
			pstmt.setString(1, userID);
			pstmt.setString(2, e.getPreference());
			pstmt.setString(3, e.getSun());
			pstmt.setString(4, e.getMon());
			pstmt.setString(5, e.getTues());
			pstmt.setString(6, e.getWed());
			pstmt.setString(7, e.getThurs());
			pstmt.setString(8, e.getFri());
			pstmt.setString(9, e.getSat());
			
			int flag = pstmt.executeUpdate(); 

			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		}catch (Exception e2) {
			System.out.println("ERROR: WorkoutPlanDB_addEntry: ");
			e2.printStackTrace();
		}
		return false;
	}

	//checks if workoutplan exists for this user or not
	public WorkoutPlan getWorkoutPlan(String userID) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM WorkoutPlanDB WHERE userID = ?");
			pstmt.setString(1, userID);
			ResultSet rs = pstmt.executeQuery(); 
			
			
			if(rs.getFetchSize()==0) {
				System.out.println("WorkoutPlanDB: no existing wp");
				return null;
			}
			else {
				System.out.println("WorkoutPlanDB: existing wp");
				rs.next();
				String pref = rs.getString("pref");
				String sun = rs.getString("sun");
				String mon = rs.getString("mon");
				String tues = rs.getString("tues");
				String wed = rs.getString("wed");
				String thurs = rs.getString("thurs");
				String fri = rs.getString("fri");
				String sat = rs.getString("sat");
				
				Map<String, String> sched = new HashMap<String, String>();
				sched.put("sun", sun);
				sched.put("mon", mon);
				sched.put("tues", tues);
				sched.put("wed", wed);
				sched.put("thurs", thurs);
				sched.put("fri", fri);
				sched.put("sat", sat);
				
				WorkoutPlan wp = new WorkoutPlan(pref, sched);
				return wp;
			}
		} catch (SQLException e4) {
			System.out.println("ERROR: WorkoutPlanDB_addEntry: ");
			e4.printStackTrace();
		}
		return null;
	}

	public boolean deleteEntry(String userID) {
		try {
			pstmt = con.prepareStatement("DELETE FROM WorkoutPlanDB WHERE userID = ?");
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
			System.out.println("ERROR: WorkoutPlanDB_deleteEntry: ");
			e3.printStackTrace();
		}
		return false;
	}
}