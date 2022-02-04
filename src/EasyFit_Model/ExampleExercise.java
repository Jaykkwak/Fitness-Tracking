package EasyFit_Model;

public class ExampleExercise {
	private String exerciseID;
	private String name;
	private int sets;
	private int reps;
	
	public ExampleExercise(String exerciseID, String name, int sets, int reps) {
		this.name = name;
		this.sets = sets;
		this.reps = reps;
		this.exerciseID = exerciseID;
	}
	
	public String toString() {
		return "{" + name + ", " + sets + ", " + reps + "}";
	}

	public String getExerciseID() {
		return this.exerciseID;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSets() {
		return sets;
	}

	public void setSets(int sets) {
		this.sets = sets;
	}

	public int getReps() {
		return reps;
	}

	public void setReps(int reps) {
		this.reps = reps;
	}
}
