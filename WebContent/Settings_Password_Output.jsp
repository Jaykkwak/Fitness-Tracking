<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="javax.servlet.http.Cookie, EasyFit_Model.User, EasyFit_Model.UserEntryDBHelper, EasyFit_Model.FitnessGoal, EasyFit_Model.FitnessGoalDBHelper"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="setting.css">
<title>Settings Password Output</title>
</head>
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
	margin: 50px auto 5px auto;
	border-bottom: 4px solid #efefef;
	width: 50%;
}

#setting-img {
	height: 71px;
	width: 70px;
}

.main-body {
	display: grid;
	grid-template-columns: 1fr 1fr;
	/* justify-content: center; */
	align-items: center;
	margin: 0 auto;
	width: 80%;
}

.body-img {
	text-align: center;
}

#setting-body {
	width: 85%;
	align-self: flex-end;
}

.body-text {
	justify-self: start;
}

.change {
	margin: 25px auto;
	border-bottom: 4px solid #efefef;
	width: 100%;
}

.change h1 {
	font-size: 2.5rem;
}

.form-validation {
	margin-bottom: 10px;
}

input[type=password] {
	width: 80%;
	padding: 8px 8px;
	height: 30px;
	background-color: #efefef;
	border: 0;
}

input[type=password]:focus {
	background-color: white;
}

.checkbox-inline {
	margin-left: 40px;
}

input[type=checkbox] {
	vertical-align: middle;
	width: 30px;
	height: 30px;
	margin-left: 10px;
	outline: 3px solid #aaa;
	border: 0;
}

.checkbox-prefer label {
	font-size: 1.5rem;
	font-weight: 600;
}

.button-pwd {
	position: absolute;
	right: 50px;
	top: 250px;
	width: 200px;
	height: 42px;
	font-size: 1.7rem;
	color: white;
	background-color: #96c774;
	border: 0;
	border-radius: 20px;
	cursor: pointer;
}
.button-fg {
	position: absolute;
	right: 50px;
	top: 700px;
	width: 200px;
	height: 42px;
	font-size: 1.7rem;
	color: white;
	background-color: #96c774;
	border: 0;
	border-radius: 20px;
	cursor: pointer;
}

.button:hover {
	background-color: #b0daaa;
}

.form-box {
	width: 600px;
	height: 800px;
	position: relative;
	top: 15px;
	margin: 6% auto;
	padding: 0px;
	overflow-y: auto;
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
<body>

	<%
		String newPwd = request.getParameter("settings-new-password");
		String newConfirmedPwd = request.getParameter("settings-confirm-password");
		if(newPwd.equals(newConfirmedPwd)){
			Cookie idC = null;
			Cookie[] cookies = request.getCookies();
			for (Cookie c : cookies) {
				if (c.getName().equals("id")) {
					idC = c;
				}
			}
			
			UserEntryDBHelper udbhelp = new UserEntryDBHelper();
			User u = udbhelp.getUser(idC.getValue());
			System.out.println("Settings_PwdOut.jsp: user = " + u.toString());
			
			u.setPassword(newPwd);
			boolean delete = udbhelp.deleteEntry(u);
			//only add user w/ new pwd if delete is successful
			boolean resetPwd = false;
			if(delete){
				resetPwd = udbhelp.addEntry(u);
			}
			
			if(delete && resetPwd){
				System.out.println("Settings_PwdOut.jsp: password resetted successfully");
				out.print("<script> alert('Saved Succesfully!'); window.location = 'UserDashboard.jsp';</script>");
			}
		}
		else{
			System.out.println("passwords not matching");
			out.print("<script> alert('Passwords Do Not Match\\nPlease Try Again'); window.location = 'Settings.jsp';</script>");
		}
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
			<h1>SETTINGS</h1>
			<img id="setting-img" src="img/setting.png">
		</div>
		<div class="main-body">
			<div class="body-img">
				<img id="setting-body" src="img/setting_body.svg" alt="">
			</div>
			<div class="form-box">
				<form action="Settings_Password_Output.jsp">
					<div class="change" id="change-password">
						<h1>Change Password</h1>
					</div>
					<div class="password">
							<label for="new-password"><h2>New Password</h2></label> 
							<input type="password" name="settings-new-password" value=""><br>
							<label for="confirm-password"><h2>Confirm Password</h2></label> 
								<input type="password" name="settings-confirm-password" value="">
							<button type="submit" class="button-pwd" role="button" disabled>Save</button>
					</div>
				</form>
				<br>
				<br>
				<br>
				<form action="Settings_FG_Output.jsp">
					<div class="change" id="change-fg">
						<h1>Change Fitness Goal</h1>
					</div>
					<div class="password">
							<label for="new-password"><h2>Current Height</h2></label> 
							<input type="password" name="settings-height" placeholder="in inches"><br>
							<label for="confirm-password"><h2>Current Weight</h2></label> 
							<input type="password" name="settings-weight" placeholder="in pounds">
							<label for="confirm-password"><h2>Goal Weight</h2></label> 
							<input type="password" name="settings-weight" placeholder="in pounds">
							<label for="confirm-password"><h2>Time Frame</h2></label> 
							<input type="password" name="settings-weight" placeholder="in months">
							<button type="submit" class="button-fg" role="button" disabled>Save</button>
					</div>
				</form>
					
					
			
		</div>
	</div>
	

	<script>
        //navbar toggle
        const menu = document.querySelector('#menu-toggle');
        const menuLinks = document.querySelector('.nav-menu');
    
        menu.addEventListener('click', function (){
            menu.classList.toggle('is-active');
            menuLinks.classList.toggle('active');
        })
        </script>
</body>
</html>