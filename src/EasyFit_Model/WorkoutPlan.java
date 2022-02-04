package EasyFit_Model;

import java.util.Map;

public class WorkoutPlan {

	String preference, sun, mon, tues, wed, thurs, fri, sat;
	Map<String, String> schedule;

	public WorkoutPlan(String preference, Map<String, String> schedule) {
		this.preference = preference;
		this.schedule = schedule;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public Map<String, String> getSchedule() {
		return schedule;
	}

	public void setSchedule(Map<String, String> schedule) {
		this.schedule = schedule;
	}
	
	public String getSun() {
		return schedule.get("sun");
	}
	
	public String getMon() {
		return schedule.get("mon");
	}
	
	public String getTues() {
		return schedule.get("tues");
	}
	
	public String getWed() {
		return schedule.get("wed");
	}
	
	public String getThurs() {
		return schedule.get("thurs");
	}
	
	public String getFri() {
		return schedule.get("fri");
	}
	
	public String getSat() {
		return schedule.get("sat");
	}
} 