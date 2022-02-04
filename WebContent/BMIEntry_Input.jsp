<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="java.util.Calendar, java.util.Date, java.text.SimpleDateFormat, EasyFit_Model.BMIEntry, EasyFit_Model.BMIEntryDBHelper"%>

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
body {
	background-color: white;
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
.main-container {
	display: flex;
	justify-content: center;
	text-align: center;
	align-items: center;
	font-size: 2.5rem;
	letter-spacing: 0.3rem;
	color: #b0daaa;
	margin: 50px auto 50px auto;
	border-bottom: 4px solid #efefef;
	width: 50%;
}
.main-body {
	display: grid;
	grid-template-columns: 1.5fr 1fr;
	/* align-items: center; */
	justify-content: center;
	margin: 0 auto;
	width: 65%;
}
.body-text {
	height: 80%;
	margin-left: 50px;
}
.bmi-body {
	font-size: 3rem;
	font-weight: 800;
}
.main-body #date {
	font-size: 2.3rem;
	color: #b3d6a4;
	margin-bottom: 20px;
}
#table1 {
	height: 200px;
	width: 90%;
	margin-bottom: 15px;
}
#table1 .th1 {
	font-size: 2rem;
	text-align: start;
	letter-spacing: 0.1rem;
}
#table1 input[type=text] {
	width: 300px;
	height: 40px;
	background-color: #efefef;
	border: 0;
	color: black;
	font-size: 1.5rem;
}
#unit {
	font-size: 1rem;
	color: #b3d6a4;
}
.button {
	position: relative;
	left: 20%;
	top: 10%;
	width: 430px;
	height: 50px;
	font-size: 1.8rem;
	font-weight: 400;
	color: white;
	background-color: #96c774;
	border: 0;
	border-radius: 20px;
	cursor: pointer;
}
.button:hover {
	background-color: #b0daaa;
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
</style>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BMI Entry Input</title>
</head>
<body>
	<%
		SimpleDateFormat f = new SimpleDateFormat("MM/dd/yyyy");
		Date d = Calendar.getInstance().getTime();
		String date = f.format(d) + "";
	%>
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
	 
	<div class="main">
		<div class="main-container">
			<h1>BMI TRACKER</h1>
			<svg width="102" height="102" viewBox="0 0 102 102" fill="none"
				xmlns="http://www.w3.org/2000/svg">
                <path
					d="M71.5989 37.9053L59.9761 55.3395C57.6483 58.8311 52.4171 58.5054 50.5404 54.7521V54.7521C48.6637 50.9987 43.4324 50.673 41.1047 54.1646L29.4819 71.5989"
					stroke="#B3D6A4" stroke-width="5" stroke-linecap="round"
					stroke-linejoin="round" />
                <rect x="12.635" y="12.635" width="75.8106"
					height="75.8106" rx="8.4234" stroke="#B3D6A4" stroke-width="5" />
                </svg>
		</div>

		<div class="main-body">
			<form action = "BMIEntry_Output.jsp" class="body-text">
				<span class="bmi-body">NEW BMI LOG</span>
				<%
					out.print("<div id='date'>" + date + "</div>");
				%>


				<table id="table1">
					<tr>
						<th class="th1">Height
							<div id="unit">(in inches)</div>
						</th>
						<th><input name="height-input" type="text" value="" required>
							<br></th>
					</tr>
					<tr>
						<th class="th1">Weight
							<div id="unit">(in pounds)</div>
						</th>
						<th><input name="weight-input" type="text" value="" required>
							<br></th>
					</tr>
				</table>
					<button type="submit" class="button" role="button">SAVE</button>
			</form>
			<div class="body-img">
				<img src="img/bmi-input.svg" id="meal-img" alt="">
			</div>
		</div>
	</div>
	

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