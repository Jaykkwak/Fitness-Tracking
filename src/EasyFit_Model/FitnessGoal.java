package EasyFit_Model;

public class FitnessGoal {

	double currentBMI, targetBMI;
	int height, weight, targetWeight, timeFrame;

	public FitnessGoal(int height, int weight, int targetWeight, int timeFrame) {
		this.height = height;
		this.weight = weight;
		this.timeFrame = timeFrame;
		
		currentBMI = this.calculateBMI(height, weight);
		targetBMI = this.calculateBMI(height, targetWeight);
	}
	
	public FitnessGoal(double currentBMI, double targetBMI, int timeframe) {
		this.currentBMI = currentBMI;
		this.targetBMI = targetBMI;
		this.timeFrame = timeframe;
	}
	
	
	
	public int getHeight() {
		return height;
	}


	public void setHeight(int height) {
		this.height = height;
	}



	public int getWeight() {
		return weight;
	}



	public void setWeight(int weight) {
		this.weight = weight;
	}



	public int getTargetWeight() {
		return targetWeight;
	}



	public void setTargetWeight(int targetWeight) {
		this.targetWeight = targetWeight;
	}



	public void setCurrentBMI(double currentBMI) {
		this.currentBMI = currentBMI;
	}



	public void setTargetBMI(double targetBMI) {
		this.targetBMI = targetBMI;
	}



	public double getCurrentBMI() {
		return currentBMI;
	}

	public void setCurrentBMI(int currentBMI) {
		this.currentBMI = currentBMI;
	}

	public double getTargetBMI() {
		return targetBMI;
	}

	public void setTargetBMI(int targetBMI) {
		this.targetBMI = targetBMI;
	}

	public int getTimeFrame() {
		return timeFrame;
	}

	public void setTimeFrame(int timeFrame) {
		this.timeFrame = timeFrame;
	}

	public String hashcode(){
		double num = this.hashCode() + (this.currentBMI * this.targetBMI) / 123 ; 
		return num + "";
	}
	
	public double calculateBMI(int height, int weight) {
		return 703 * weight / (Math.pow(height, 2));
	}

}

