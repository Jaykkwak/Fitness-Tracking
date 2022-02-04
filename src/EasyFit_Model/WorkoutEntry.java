package EasyFit_Model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import EasyFit_Model.Exercise;

public class WorkoutEntry {
	private String workoutLogID;
	private String date;
	private ArrayList<Exercise> exercises;	//hashcode = workoutLogID
	private int length;
	
	public WorkoutEntry(String date, ArrayList<Exercise> exercises) {
		this.date = date;
		this.exercises = exercises;
		length = exercises.size();
		this.workoutLogID = exercises.hashCode() + "";
	}
	
	public String getDescription() {
		String descr = "";
		for(int i = 0; i < exercises.size(); i++) {
			Exercise e = exercises.get(i);
			if(i == (exercises.size() - 1)) {
				descr = descr + e.getName();
				break;
			}
			descr = descr + e.getName() + ", ";
		}
		return descr;
	}
	
	public String toString() {
		String result = date + " || ";
		for(Exercise e: exercises) {
			result = result + e.toString() + " || ";
		}
		return result;
	}
	
	public void setWorkoutLogID(String workoutLogID) {
		this.workoutLogID = workoutLogID;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWorkoutLogID() {
		return workoutLogID;
	}

	public int getLength() {
		return length;
	}

	public int getSize() {
		return length;
	}
	
	public ArrayList<Exercise> getWorkout(){
		return exercises;
	}
	
	public void addExercise(Exercise e) {
		exercises.add(e);
	}
	
	public void setExercise(int index, Exercise e) {
		exercises.set(index, e);
	}
	
	public void deleteExercise(int index) {
		exercises.remove(index);
	}
	
//	public static void main(String args[]) {
//		Exercise a = new Exercise("push up", 1, 2, 3);
//		Exercise b = new Exercise("sit up", 1, 2, 3);
//		Exercise c = new Exercise("random", 1, 2, 3);
//		
//		ArrayList<Exercise> w = new ArrayList<>();
//		w.add(a);
//		w.add(b);
//		w.add(c);
//		
		//WorkoutEntry we = new WorkoutEntry(w);
//		System.out.println("date = " + we.getDate());
//		System.out.println("workouts = " + we.getWorkouts().toString());
		//System.out.println("workoutID = " + we.getWorkoutLogID());
//		
//		we.deleteExercise(0);
//		System.out.println("new workouts = " + we.getWorkouts().toString());
//		
//		we.addExercise(a);
//		System.out.println("new workouts = " + we.getWorkouts().toString());
		
//		User testU = new User("username", "password", "email", "fName", "lName");
//		UserEntryDBHelper user_db = new UserEntryDBHelper();
//		boolean addU = user_db.addEntry(testU);
//		System.out.println("add user status = " + addU);
//		WorkoutEntryDBHelper wedb = new WorkoutEntryDBHelper();
//		boolean addW = wedb.addEntry(testU.getUserID(), we);
//		System.out.println("add workout status = " + addW);
//	}
}
