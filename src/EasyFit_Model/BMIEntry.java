package EasyFit_Model;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;

public class BMIEntry {
	private double bmi;
	private int height;
	private int weight;
	private String date;

	public BMIEntry(int height, int weight, String date) {
		this.date = date;
		this.height = height;
		this.weight = weight;
		bmi = this.calculateBMI();
	}

	public double getBMI() {
		return bmi;
	}
	
	public void setHeight(int newHeight) {
		height = newHeight;
	}

	public void setWeight(int newWeight) {
		weight = newWeight;
	}

	public String getDate() {
		return date;
	}
	
	public int getHeight() {
		return height;
	}

	public int getWeight() {
		return weight;
	}

	public double calculateBMI() {
		return 703 * weight / (Math.pow(height, 2));
	}

	public String hashcode(){
		int num = this.hashCode() + (this.height * this.weight) / 123 ; 
		return num + "";
	}

	public static void main(String args[]) {
		String userID = "192udkskl193";
		BMIEntryDBHelper bmi_db = new BMIEntryDBHelper();
		BMIEntry bmi_ent = new BMIEntry(60, 120, "12/06/2021");
		
		//boolean status = bmi_db.addEntry(userID, bmi_ent);
		//System.out.println("Insertion Successful? --> " + status);
		System.out.println("Date: " + bmi_ent.getDate());
	}
}
