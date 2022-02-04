package EasyFit_Model;

import java.sql.*;

public class UserEntryDBHelper {
	public Connection con;
	private PreparedStatement pstmt;
	private String username;
	private String password;
	private String oracleURL;

	public UserEntryDBHelper() {
		try {
			String host = "localhost";				
			String dbName = "xe";
			int port = 1521;
			oracleURL = "jdbc:oracle:thin:@" + host + ":" + port + ":" + dbName;
			//change depending on user
			username = "system";
			password = "Oracle.com0709";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(oracleURL, username, password);

		} catch(Exception e) {
			System.out.println("ERROR: UserEntry_ctor: ");
			e.printStackTrace();
		}
	}

	public boolean addEntry(User e) {
		try {
			
//			System.out.println("INSERT INTO UserDB(userID, username, password, email, fName, lName) VALUES ('" + e.getUserID() + "', '" + e.getUsername() + "', '" + 
//					e.getPassword() + "', '" + e.getEmail() + "', '" + e.getfName() + "', '"  + e.getlName() + "'); COMMIT WORK");
			
			pstmt = con.prepareStatement("INSERT INTO UserDB(userID, username, password, email, fName, lName) VALUES (?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, e.getUserID());
			pstmt.setString(2, e.getUsername());
			pstmt.setString(3, e.getPassword());
			pstmt.setString(4, e.getEmail());
			pstmt.setString(5, e.getfName());
			pstmt.setString(6, e.getlName());
			int flag = pstmt.executeUpdate();
			
			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		}catch (Exception e2) {
			System.out.println("ERROR: UserEntry_addEntry: ");
			e2.printStackTrace();
		}
		return false;
	}
	
	
	public boolean deleteEntry(User e) {
		try {
			pstmt = con.prepareStatement("DELETE FROM UserDB WHERE userID = ?");
			pstmt.setString(1, e.getUserID());
			int flag = pstmt.executeUpdate();
			
			//checks if insertion was successful
			if (flag == 1) {
				return true;
			}
			else {
				return false;
			}
		} catch (SQLException e3) {
			// TODO Auto-generated catch block
			e3.printStackTrace();
		}
		return false;
	}
	
	public User getUser(String userID) {
		try {
			System.out.println("UserDB: retrieving user w/ userID = " + userID);
			
			pstmt = con.prepareStatement("SELECT * FROM UserDB WHERE userID= ?");
			pstmt.setString(1, userID);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.getFetchSize()==0) {
				System.out.println("UserDB: no matching user");
				return null;
			}
			else {
				rs.next();
				String email = rs.getString("email");
				String fName = rs.getString("fName");
				String lName = rs.getString("lName");
				String username = rs.getString("username");
				String password = rs.getString("password");
				
				User u = new User(username, password, email, fName, lName);
				u.setID(userID);
				System.out.println("UserDB: matching user found: " + u.toString());
				return u;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public User validate(String username, String password) {
		try {
			System.out.println("UserDB: starting validation [username = " + username + ", password = " + password + "]");
			
			pstmt = con.prepareStatement("SELECT * FROM UserDB WHERE username= ? AND password=?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.getFetchSize()==0) {
				System.out.println("UserDB: no matching user");
				return null;
			}
			else {
				rs.next();
				String email = rs.getString("email");
				String fName = rs.getString("fName");
				String lName = rs.getString("lName");
				String id = rs.getString("userID");
				
				User u = new User(username, password, email, fName, lName);
				u.setID(id);
				System.out.println("UserDB: matching user found: " + u.toString());
				return u;
			}
		}
		catch(Exception e4){
			e4.printStackTrace();
		}
		return null;
	}
}
