package EasyFit_Model;

import java.util.*;
import java.sql.*;

public class ExampleWorkoutDBHelper {
	private String workoutID;
	private String name;
	private String preference;
	private ArrayList<ExampleWorkout> workouts;		

	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public ExampleWorkoutDBHelper() {
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
			System.out.println("ERROR: ExampleWorkoutDBHelper_ctor: ");
			e.printStackTrace();
		}
	}

	public ArrayList<ExampleWorkout> searchExampleWorkouts(String searchCrit){
		try {
			pstmt = con.prepareStatement("SELECT * FROM ExampleWorkoutDB, ExampleExerciseDB WHERE ExampleWorkoutDB.workoutID=ExampleExerciseDB.workoutID AND ExampleWorkoutDB.wName=?");
			pstmt.setString(1, searchCrit);
			ResultSet rs = pstmt.executeQuery();

			workouts = new ArrayList<>();
			ArrayList<ExampleExercise> exercises = new ArrayList<>();
			String w = "";

			//dummy values
			String workoutID ="empty";
			String wName = "empty";
			String pref = "empty";
			int calburn = -1;
			int wTime = -1;
			String difficulty = "empty";

			while (rs.next()) {
				//System.out.println("rs processing started");
				String currentW = rs.getString("workoutID");
				//first iteration
				if(w.isEmpty()) {
					//System.out.println("first iteration");
					workoutID = currentW;
					wName = rs.getString("wName");
					pref = rs.getString("preference");
					calburn = rs.getInt("calburn");
					wTime = rs.getInt("wTime");
					difficulty = rs.getString("difficulty");

					w = currentW;
				}
				//new workout
				else if(!currentW.equals(w)) {

					//create example workout w/ previous exercises
					ExampleWorkout currentWorkout = new ExampleWorkout(workoutID, wName, pref, calburn, wTime, difficulty, exercises);
					workouts.add(currentWorkout);

					//System.out.println("new workout: " + currentWorkout.toString());

					//prepare next workout
					exercises = new ArrayList<>();			//reset arraylist
					w = currentW;							//reset w for next round
					workoutID = currentW;
					wName = rs.getString("wName");
					pref = rs.getString("preference");
					calburn = rs.getInt("calburn");
					wTime = rs.getInt("wTime");
					difficulty = rs.getString("difficulty");
				}

				//add current exercise to appropriate 
				String exerciseID = rs.getString("exerciseID");
				String eName = rs.getString("eName");
				int sets = rs.getInt("sets");
				int reps = rs.getInt("reps");

				ExampleExercise currentExercise = new ExampleExercise(exerciseID, eName, sets, reps);
				exercises.add(currentExercise);

				//System.out.println("same workout// exercise : " + currentExercise);
			}

			//add last workout
			ExampleWorkout currentWorkout = new ExampleWorkout(workoutID, wName, pref, calburn, wTime, difficulty, exercises);
			workouts.add(currentWorkout);

			//System.out.println("last workout: " + currentWorkout.toString());
			return workouts;

		}catch(SQLException e4) {
			System.out.println("ERROR: ExampleWorkoutDBHelper_getWorkout: ");
			e4.printStackTrace();
		}
		return null;
	}

	public ArrayList<ExampleWorkout> getExampleWorkouts() {

		try {
			pstmt = con.prepareStatement("SELECT * FROM ExampleWorkoutDB, ExampleExerciseDB  WHERE ExampleWorkoutDB.workoutID=ExampleExerciseDB.workoutID");
			ResultSet rs = pstmt.executeQuery();

			workouts = new ArrayList<>();
			ArrayList<ExampleExercise> exercises = new ArrayList<>();
			String w = "";

			//dummy values
			String workoutID ="empty";
			String wName = "empty";
			String pref = "empty";
			int calburn = -1;
			int wTime = -1;
			String difficulty = "empty";

			while (rs.next()) {
				//System.out.println("rs processing started");
				String currentW = rs.getString("workoutID");
				//first iteration
				if(w.isEmpty()) {
					//System.out.println("first iteration");
					workoutID = currentW;
					wName = rs.getString("wName");
					pref = rs.getString("preference");
					calburn = rs.getInt("calburn");
					wTime = rs.getInt("wTime");
					difficulty = rs.getString("difficulty");

					w = currentW;
				}
				//new workout
				else if(!currentW.equals(w)) {

					//create example workout w/ previous exercises
					ExampleWorkout currentWorkout = new ExampleWorkout(workoutID, wName, pref, calburn, wTime, difficulty, exercises);
					workouts.add(currentWorkout);

					//System.out.println("new workout: " + currentWorkout.toString());

					//prepare next workout
					exercises = new ArrayList<>();			//reset arraylist
					w = currentW;							//reset w for next round
					workoutID = currentW;
					wName = rs.getString("wName");
					pref = rs.getString("preference");
					calburn = rs.getInt("calburn");
					wTime = rs.getInt("wTime");
					difficulty = rs.getString("difficulty");
				}

				//add current exercise to appropriate 
				String exerciseID = rs.getString("exerciseID");
				String eName = rs.getString("eName");
				int sets = rs.getInt("sets");
				int reps = rs.getInt("reps");

				ExampleExercise currentExercise = new ExampleExercise(exerciseID, eName, sets, reps);
				exercises.add(currentExercise);

				//System.out.println("same workout// exercise : " + currentExercise);
			}

			//add last workout
			ExampleWorkout currentWorkout = new ExampleWorkout(workoutID, wName, pref, calburn, wTime, difficulty, exercises);
			workouts.add(currentWorkout);

			//System.out.println("last workout: " + currentWorkout.toString());
			return workouts;

		}catch(SQLException e4) {
			System.out.println("ERROR: ExampleWorkoutDBHelper_getWorkout: ");
			e4.printStackTrace();
		}
		return null;
	}

	public static void main(String args[]) {
		ExampleWorkoutDBHelper test = new ExampleWorkoutDBHelper();
		test.getExampleWorkouts();
		System.out.println("MAIN TEST: " + test.workouts.toString());
	}

}
