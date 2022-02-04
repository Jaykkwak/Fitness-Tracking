package EasyFit_Model;

public class MealPlan {

	int intake, targetBMI, protein, carbs, fat;

	public MealPlan(int intake, int targetBMI, int protein, int carbs, int fat) {
		this.protein = protein;
		this.carbs = carbs;
		this.fat = fat;
		this.intake = intake;
		this.targetBMI = targetBMI; 
	}

	
	public int getProtein() {
		return protein;
	}


	public void setProtein(int protein) {
		this.protein = protein;
	}


	public int getCarbs() {
		return carbs;
	}


	public void setCarbs(int carbs) {
		this.carbs = carbs;
	}


	public int getFat() {
		return fat;
	}


	public void setFat(int fat) {
		this.fat = fat;
	}


	public int getIntake() {
		return intake;
	}

	public void setIntake(int intake) {
		this.intake = intake;
	}

	public int getTargetBMI() {
		return targetBMI;
	}

	public void setTargetBMI(int targetBMI) {
		this.targetBMI = targetBMI;
	}

}