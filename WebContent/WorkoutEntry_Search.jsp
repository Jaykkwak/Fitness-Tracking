<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="java.sql.*, java.util.*, java.text.SimpleDateFormat, EasyFit_Model.WorkoutEntry, EasyFit_Model.WorkoutEntryDBHelper, EasyFit_Model.Exercise"%>
	
<!DOCTYPE html>
<html>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);

@import
	url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300)
	;

:root {
	--green: #6eb73a;
	--orange: #fac780;
	--background: #fcfcea;
}

* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'Exo', sans-serif;
	scroll-behavior: smooth;
}

.navbar {
	width: 100%;
	background: var(--orange);
	z-index: 999;
	top: 0;
	position: sticky;
}

.nav-container {
	display: grid;
	grid-template-columns: 1fr auto 2fr;
	align-items: center;
	justify-items: end;
	height: 80px;
	width: 70%;
	max-width: 1900px;
	margin: 0 auto;
}

.nav-logo {
	color: white;
	justify-self: start;
	font-size: 2.3rem;
	font-weight: 1000;
	cursor: pointer;
}

.nav-menu {
	display: grid;
	grid-template-columns: repeat(4, 130px);
	list-style: none;
	text-align: center;
	width: 70%;
	justify-content: end;
	z-index: 1;
}

.nav-links {
	font-size: 1.2rem;
	color: white;
	text-decoration: none;
}

.nav-links:hover {
	color: var(--green);
	transition: all 0.2 ease-out;
}

.nav-btn {
	background-color: var(--green);
	padding: 6px 20px;
	border-radius: 4px;
	font-weight: 600;
}

.nav-btn:hover {
	background-color: #aed093;
	color: white;
	padding: 5px 19px;
	border-radius: 4px;
	transition: all 0.3s ease-out;
}

.nav-toggle .bar {
	width: 25px;
	height: 3px;
	margin: 5px auto;
	transition: all 0.3s ease-in-out;
	background: white;
}

}
@media screen and (max-width: 768px) {
	.navbar {
		position: relative;
	}
	.nav-menu {
		display: grid;
		grid-template-columns: repeat(1, 100%);
		background: #e2c095;
		margin: 0;
		width: 100%;
		position: absolute;
		left: 0;
		top: -1000px;
		opacity: 0;
		z-index: 2;
	}
	#nav-logo {
		margin-left: 20px;
	}
	.nav-menu.active {
		background: #e2c095;
		justify-content: center;
		width: 100%;
		left: 0;
		top: 100%;
		opacity: 1;
	}
	.nav-links {
		text-align: center;
		line-height: 60px;
		width: 100%;
		display: table;
	}
	.nav-links:hover {
		background-color: #9ac57c;
		color: var(--white);
		width: 100%;
		transition: all 0.4s ease-out;
	}
	.nav-container {
		width: 90%;
	}
	.nav-btn {
		background: #e2c095;
		justify-content: center;
		width: 100%;
		left: 0;
		top: 100%;
		opacity: 1;
		transition: all 0.3s ease;
		z-index: 1;
	}
	#menu-toggle {
		position: absolute;
		top: 20%;
		right: 5%;
		transform: translate(5%, 20%);
	}
	.nav-toggle .bar {
		display: block;
		cursor: pointer;
	}
	.nav-toggle:hover {
		cursor: pointer;
	}
	#menu-toggle.is-active .bar:nth-child(2) {
		opacity: 0;
	}
	#menu-toggle.is-active .bar:nth-child(1) {
		transform: translatey(8px) rotate(45deg);
	}
	#menu-toggle.is-active .bar:nth-child(3) {
		transform: translatey(-8px) rotate(-45deg);
	}
}

.body {
	background-color: white;
}

div.top {
	color: #B3D6A4;
	font-size: 2.5rem;
	display: flex;
	justify-content: center;
	text-align: center;
	align-items: center;
	letter-spacing: 0.3rem;
	margin: 50px auto 30px auto;
	border-bottom: 4px solid #efefef;
	width: 70%;
}

.bmi-body {
	padding: 10px;
}

.search-bar {
	text-align: center;
	justify-content: center;
}

.search-bar input[type=text] {
	width: 286px;
	height: 42px;
	padding: 12px 20px;
	font-size: 1.1rem;
	border-radius: 6px;
	background-color: #F8F9FA;
	border: 1px solid #CED4DA;
}

#search-btn {
	width: 150px;
	height: 45px;
	background-color: #B3D6A4;
	color: white;
	font-size: 1.2rem;
	font-weight: 600;
	border: 1px solid #efeeee;
	border-radius: 6px;
	cursor: pointer;
	margin-left: 180px;
}

#newentry-btn {
	position: relative;
	left: 550px;
	top: 50px;
	width: 230px;
	height: 50px;
	font-size: 1.8rem;
	font-weight: 400;
	color: white;
	background-color: #B3D6A4;
	border: 0;
	border-radius: 20px;
	cursor: pointer;
}

.workoutplan {
	position: absolute;
	color: white;
	font-weight: 800;
	text-decoration: none;
	right: 50px;
	top: 100px;
	padding: 12px 80px;
	font-size: 1.2rem;
	background-color: #B3D6A4;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	outline: none;
}

select {
	padding: 10px 30px;
	background: #f8f9fa;
	border: 1px solid #dddddd;
	cursor: pointer;
	border-radius: 6px;
	font-size: 15px;
}

.middle {
	padding-left: 80px;
}

.middle h2 {
	margin-top: 25px;
}

.meal-tb {
	display: block;
	max-height: 400px;
	overflow-y: scroll;
	width: 90%;
	margin-top: 20px;
	text-align: center;
	font-size: 1.1rem;
	border-collapse: collapse;
	overflow-y: auto;
}

.meal-tb tbody {
	display: block;
	max-height: 400px;
	overflow-y: scroll;
}

tr, thead {
	display: table;
	height: 56px;
	width: 100%;
	table-layout: fixed;
}

.rows {
	cursor: pointer;
}

.rows:hover {
	background-color: #eafbff;
}

.meal-tb th {
	background: #f5f5f5;
	border-bottom: 1px solid #b1b1b1;
	padding: 8px;
}

.meal-tb td {
	border-bottom: 0.5px solid #f5f5f5;
	padding: 8px;
}

/* Add media queries for smaller screens */
@media screen and (max-width:720px) {
	.weekdays li, .days li {
		width: 13.1%;
	}
}

@media screen and (max-width: 420px) {
	.weekdays li, .days li {
		width: 12.5%;
	}
	.days li .active {
		padding: 2px;
	}
}

@media screen and (max-width: 290px) {
	.weekdays li, .days li {
		width: 12.2%;
	}
}
</style>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="search-workout.css">
<title>Workout Entry Search</title>
</head>
<body>
	<!-- navbar -->
	<nav class="navbar">
		<div class="nav-container">
			<div class="nav-logo" onClick="navHome()">EASY FIT</div>
			<div class="nav-toggle" id="menu-toggle">
				<span class="bar"></span> <span class="bar"></span> <span
					class="bar"></span>
			</div>
			<ul class="nav-menu">
				<li><a href="#home" class="nav-links" onClick="navHome()">Home</a></li>
				<li><a href="#services" class="nav-links" onClick="navServices()">Services</a></li>
				<li><a href="#services" class="nav-links" onClick="navSettings()">Settings</a></li>
				<li><a href="#signout" class="nav-links nav-btn" onClick="signout()">Sign Out</a></li>
			</ul>
		</div>
	</nav>
	
	<!--nav scripts -->
	<script>
		function navHome(){
			window.location="UserDashboard.jsp";
		}
		function navServices(){
			window.location="Home_SignedIn.jsp";
		}
		function navSettings(){
			window.location="Home_Settings.jsp";
		}
		function signout(){
			window.location="Signed-Out.jsp";
		}
	</script> 

	<div class="top">
		<h1>WORKOUT TRACKER</h1>
		<svg width="110" height="110" viewBox="0 0 110 110" fill="none"
			xmlns="http://www.w3.org/2000/svg">
<rect x="22.7939" y="22.7939" width="63.8232" height="63.8232"
				rx="13.6764" stroke="#B3D6A4" stroke-width="6" />
<path d="M27.3528 45.588H82.0584" stroke="#B3D6A4" stroke-width="5"
				stroke-linecap="round" />
<path
				d="M42.1828 69.9249L48.747 76.0494C49.3441 76.6065 50.2989 76.4922 50.7477 75.8099L67.2288 50.751"
				stroke="#B3D6A4" stroke-width="5" />
</svg>
	</div>

	<div class="middle">
		<form action="" class="middlepart">
			<div class="bmi-body">
				<table style="width: 70%">
					<tr>
						<td><select>
								<option>Day</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
								<option>22</option>
								<option>23</option>
								<option>24</option>
								<option>25</option>
								<option>26</option>
								<option>27</option>
								<option>28</option>
								<option>29</option>
								<option>30</option>
								<option>31</option>
						</select></td>

						<td><select>
								<option>Month</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
						</select></td>

						<td><select>
								<option>Year</option>
								<option>2021</option>
						</select></td>

						<td>
							<div class="search-bar">
								<input type="text" placeholder="Search by exercises">
							</div>
						</td>
						<td><button type="submit" id="search-btn" value="submit">Search</button></td>
					</tr>
				</table>
			</div>
		</form>

		<h2>Workout Logs</h2>
		<table class="meal-tb" id="workout-logs">
			<tr id="header">
				<th>Log #</th>
				<th>Date</th>
				<th>Exercises</th>
				<th></th> 				<!-- to pass userID -->
				<th></th>				<!-- to pass workoutLogID -->
			</tr>
					<%
						Cookie idC = null;
						Cookie[] cookies = request.getCookies();
						for (Cookie c : cookies) {
							if (c.getName().equals("id")) {
								idC = c;
							}
						}	
						String userID = idC.getValue();
						
						WorkoutEntryDBHelper wdhelp = new WorkoutEntryDBHelper();
						ResultSet rs = wdhelp.getAllEntries(userID);
						
						int counter = 1;
						while(rs.next()){
							String workoutLogID = rs.getString("workoutLogID");
							String wDate = rs.getString("wDate");
							ArrayList<Exercise> exercises = wdhelp.getExercises(userID, workoutLogID);
							WorkoutEntry we = new WorkoutEntry(wDate, exercises);
							System.out.println("Workout_Search.jsp: "+counter+": " + we.toString());
							
							out.print("<tr class='rows' onclick='editEntry(this)'>");
							out.print("<td>"+counter+"</td>");
							out.print("<td>"+we.getDate()+"</td>");
							out.print("<td>"+we.getDescription()+"</td>");
							out.print("<td><input type=hidden id=userID value="+userID+"></td>");
							out.print("<td><input type=hidden id=userID value="+workoutLogID+"></td>");
							out.print("</tr>");
							counter++;
						}
						
					%>
		</table>
	</div>
	<form id="new-workout-entry" action="WorkoutEntry_Input.jsp">
		<button type="submit" id="newentry-btn" value="submit">NEW ENTRY</button>
	</form>
	<a class="workoutplan" href="WorkoutPlan_Loading.jsp">Workout Plan</a>

		<script>
		//sends row's data to edit form
		function editEntry(thisRow){
			//retrieves row's values
			var table = document.getElementById("workout-logs");
			var num = table.rows[thisRow.rowIndex].cells[0].innerHTML;
			var date = table.rows[thisRow.rowIndex].cells[1].innerHTML;
			var descr = table.rows[thisRow.rowIndex].cells[2].innerHTML;
			var userID = table.rows[thisRow.rowIndex].cells[3].children[0].value;
			var workoutLogID = table.rows[thisRow.rowIndex].cells[4].children[0].value;
			window.location="WorkoutEntry_Edit_Input.jsp?num="+num+"&date="+date+"&descr="+descr+"&userID="+userID+"&workoutLogID="+workoutLogID;
		}
		</script>
		
	<script>
		//navbar toggle
		const menu = document.querySelector('#menu-toggle');
		const menuLinks = document.querySelector('.nav-menu');

		menu.addEventListener('click', function() {
			menu.classList.toggle('is-active');
			menuLinks.classList.toggle('active');
		})
	</script>
</body>
</html>