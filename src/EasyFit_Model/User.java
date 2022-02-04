package EasyFit_Model;

public class User {
	private String userID;
	private String username;
	private String password;
	private String email;
	private String fName;
	private String lName;
	
	public User(String username, String password, String email, String fName, String lName) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.fName = fName;
		this.lName = lName;
	}
	
	public String toString() {
		return userID + ", " + username  + ", " + password  + ", " + email  + ", " + fName  + ", " + lName;
	}
	
	public void setID(String id) {
		userID = id;
	}

	public String hashcode() {
		int num = username.hashCode() + password.hashCode() + email.hashCode() + fName.hashCode() + lName.hashCode();
		return num + "";
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserID() {
		if(userID == null) {
			this.userID = this.hashcode();
		}
		return userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}
	
	public static void main(String args[]) {
		User testU = new User("username", "password", "email", "fName", "lName");
		UserEntryDBHelper user_db = new UserEntryDBHelper();
		boolean delete = user_db.deleteEntry(testU);
		boolean add = user_db.addEntry(testU);
		System.out.println("delete status: " + delete);
		System.out.println("add status: " + add);
	}
	
}
