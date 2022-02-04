package EasyFit_Model;

import java.util.*;

public class ExampleWorkout {
	private String workoutID;
	private String name;
	private String preference;
	private int calburn;
	private int time;
	private String difficulty;
	private ArrayList<ExampleExercise> exercises;
	
	public ExampleWorkout(String workoutID, String name, String preference, int calburn, int time, String difficulty, ArrayList<ExampleExercise> exercises) {
		this.workoutID = workoutID;
		this.name = name;
		this.preference = preference;
		this.calburn = calburn;
		this.time = time;
		this.difficulty = difficulty;
		this.exercises = exercises;
	}
	
	public String getDescription() {
		String descr = "";
		for(int i = 0; i < exercises.size(); i++) {
			ExampleExercise e = exercises.get(i);
			if(i == (exercises.size() - 1)) {
				descr = descr + e.getName();
				break;
			}
			descr = descr + e.getName() + ", ";
		}
		return descr;
	}
	
	public String getDifficulty() {
		return difficulty;
	}



	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}



	public int getTime() {
		return time;
	}



	public void setTime(int time) {
		this.time = time;
	}



	public String toString() {
		return "---" + name + ", " + preference + ", " + calburn + ", " + time + ", " + difficulty + ", " + exercises.toString() + "---"; 
	}
	
	public ArrayList<ExampleExercise> getExercises() {
		return exercises;
	}

	public String getWorkoutID() {
		return workoutID;
	}

	public void setWorkoutID(String workoutID) {
		this.workoutID = workoutID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public int getCalburn() {
		return calburn;
	}

	public void setCalburn(int calburn) {
		this.calburn = calburn;
	}
	
	
}
