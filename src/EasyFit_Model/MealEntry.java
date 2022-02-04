package EasyFit_Model;

public class MealEntry {
	private String mealLogID;
	private String date;
	private String contents;
	private int calTotal;
	
	public MealEntry(String contents, int calTotal, String date){
		this.date = date;
		this.contents = contents;
		this.calTotal = calTotal;
		
		this.mealLogID = this.genID();
	}
	
	public String toString() {
		return contents + ", " + calTotal + ", " +  date; 
	}
	
	
	public String getMealLogID() {
		return mealLogID;
	}
	
	public String genID() {
		return date.hashCode() + contents.hashCode() + calTotal +"";
	}
	
	public String getDate() {
		return date;
	}

	public void setContents(String newContents) {
		contents = newContents;
	}
	
	public void setCalTotal(int newCalTotal) {
		calTotal = newCalTotal;
	}
	
	public String getContents() {
		return contents;
	}
	
	public int getCalTotal() {
		return calTotal;
	}
}
