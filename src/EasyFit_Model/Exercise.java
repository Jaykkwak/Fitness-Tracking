package EasyFit_Model;

public class Exercise {
	private String exerciseID;
	private String name;
	private int sets;
	private int reps;
	private int weight;
	
	public Exercise(String name, int sets, int reps, int weight) {
		this.name = name;
		this.sets = sets;
		this.reps = reps;
		this.weight = weight;
		
		this.exerciseID = this.genID();
	}
	
	public String toString() {
		return "[" + name + ", " + sets + ", " + reps + ", " + weight + "]";
	}

	public String getExerciseID() {
		return this.exerciseID;
	}
	
	public void setExerciseID(String exerciseLogID) {
		this.exerciseID = exerciseLogID;
	}
	
	public String genID(){
		return name.hashCode() + sets * reps * weight + "" ;
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

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
	
}
