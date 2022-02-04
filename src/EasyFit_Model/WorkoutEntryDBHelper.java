package EasyFit_Model;

import java.sql.*;
import java.util.ArrayList;

public class WorkoutEntryDBHelper {
	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public WorkoutEntryDBHelper() {
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
			System.out.println("ERROR: WorkoutEntryDBHelper_ctor: ");
			e.printStackTrace();
		}
	}
	
	//returns exercises for a workout log
	public ArrayList<Exercise> getExercises(String userID, String workoutLogID) {

		try {
			pstmt = con.prepareStatement("SELECT * FROM WorkoutLogDB, ExerciseLogDB WHERE WorkoutLogDB.workoutLogID=ExerciseLogDB.workoutLogID AND ExerciseLogDB.userID = ? AND ExerciseLogDB.workoutLogID = ?");
			pstmt.setString(1,  userID);
			pstmt.setString(2, workoutLogID);
			ResultSet rs = pstmt.executeQuery();

			ArrayList<Exercise> exercises = new ArrayList<>();
			
			while (rs.next()) {
				//add current exercise to exercises
				String exerciseLogID = rs.getString("exerciseLogID");
				String eName = rs.getString("eName");
				int sets = rs.getInt("sets");
				int reps = rs.getInt("reps");
				int weight = rs.getInt("weight");

				Exercise currentExercise = new Exercise(eName, sets, reps, weight);
				currentExercise.setExerciseID(exerciseLogID);
				exercises.add(currentExercise);
			}
			return exercises;

		}catch(SQLException e4) {
			System.out.println("ERROR: ExampleWorkoutDBHelper_getWorkout: ");
			e4.printStackTrace();
		}
		return null;
	}


	public ResultSet getAllEntries(String userID) {
		try {
			pstmt = con.prepareStatement("SELECT * FROM WorkoutLogDB WHERE userID = ? ORDER BY wDate");		//returns bmi entries for this user sorted by date
			pstmt.setString(1, userID);	
			return pstmt.executeQuery();
		} catch (SQLException e4) {
			// TODO Auto-generated catch block
			e4.printStackTrace();
		}
		return null;
	}
	
	public boolean addEntry(String userID, WorkoutEntry w) {
		try {
			pstmt = con.prepareStatement("INSERT INTO WorkoutLogDB(userID, workoutLogID, wDate) VALUES (?, ?, ?)");
			pstmt.setString(1, userID);
			pstmt.setString(2, w.getWorkoutLogID());
			pstmt.setString(3, w.getDate());

			int flag1 = pstmt.executeUpdate();
			
			int flag2 = 0;
			ArrayList<Exercise> exercises = w.getWorkout();
			for(Exercise e: exercises) {
				pstmt = con.prepareStatement("INSERT INTO ExerciseLogDB(userID, workoutLogID, exerciseLogID, eName, sets, reps, weight) VALUES (?, ?, ?, ?, ?, ?, ?)");
				pstmt.setString(1, userID);
				pstmt.setString(2, w.getWorkoutLogID());
				pstmt.setString(3, e.getExerciseID());
				pstmt.setString(4, e.getName());
				pstmt.setInt(5, e.getSets());
				pstmt.setInt(6, e.getReps());
				pstmt.setInt(7, e.getWeight());
				flag2 = flag2 + pstmt.executeUpdate();
			}

			//checks if insertion was successful
			if (flag1 == 1 && flag2 == 4) {
				return true;
			}
			else {
				return false;
			}
		}catch (Exception e2) {
			System.out.println("ERROR: WorkoutEntryDBHelper_addEntry: ");
			e2.printStackTrace();
		}
		return false;
	}


	public boolean deleteEntry(String userID, String e) {
		try {
			pstmt = con.prepareStatement("DELETE FROM WorkoutLogDB WHERE userID = ? AND workoutLogID = ?");
			pstmt.setString(1, userID);
			pstmt.setString(2, e);
			int flag = pstmt.executeUpdate();

			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e3) {
			System.out.println("ERROR: WorkoutEntryDBHelper_addEntry: ");
			e3.printStackTrace();
		}
		return false;
	}
}

