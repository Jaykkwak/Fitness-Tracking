<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ page
	import="java.text.SimpleDateFormat, EasyFit_Model.MealPlan, EasyFit_Model.MealPlanDBHelper"%>
	
<!DOCTYPE html>
<html>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

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

.main-container{
    display: flex;
    justify-content: center;
    text-align: center;
    align-items: center;
    font-size: 2.5rem;
    letter-spacing: 0.3rem;
    color: #b0daaa;
    margin: 50px auto 30px auto;
    border-bottom: 4px solid #efefef;
    width: 50%;

}

.main-body{
    display: grid;
    grid-template-columns: 1.5fr 1fr;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    width: 70%;
}

.body-text{
    height: 80%;
    margin-left: 50px;
}

.main-body h2{
    font-size: 2rem;
    margin-top: 20px;
    margin-bottom: 15px;
}

#table1{
    height: 130px;
    width: 90%;
}

#table1 .th1{
    font-size: 2rem;
    text-align: start;
}

#table1 input[type=text]{
    width: 300px;
    height: 35px;
    background-color:#efefef;
    border: 0;
    color: black;
    font-size: 1.5rem;
}

#table2{
    margin-left: 50px;
    width: 80%;
    font-size: 1.3rem;
    text-align: center;
}

#table2 input[type=text]{
    width: 120px;
    height: 35px;
    background-color:#efefef;
    border: 0;
    color: black;
    font-size: 1.5rem;
}

.button{
    position: relative;
    left: 20%;
    top: 20%;
    width: 430px;
    height: 45px;
    font-size: 1.7rem;
    font-weight: 400;
    color: white;
    background-color: #96c774;
    border: 0;
    border-radius: 20px;
    cursor: pointer;
}

.button:hover{
    background-color: #b0daaa;
}

@media screen and (max-width: 768px) {
    .navbar{
        position: relative;
    }

    .nav-menu{
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

    #nav-logo{
        margin-left: 20px;
    }

    .nav-menu.active{
        background: #e2c095;
        justify-content: center;
        width: 100%;
        left: 0;
        top: 100%;
        opacity: 1;
    }

    .nav-links{
        text-align: center;
        line-height: 60px;
        width: 100%;
        display: table;
    }

    .nav-links:hover{
        background-color: #9ac57c;
        color: var(--white);
        width: 100%;
        transition: all 0.4s ease-out;
    }

    .nav-container{
        width: 90%;
    }

    .nav-btn{
        background: #e2c095;
        justify-content: center;
        width: 100%;
        left: 0;
        top: 100%;
        opacity: 1;
        transition: all 0.3s ease;
        z-index: 1;
    }

    #menu-toggle{
        position: absolute;
        top: 20%;
        right: 5%;
        transform: translate(5%, 20%);
    }

    .nav-toggle .bar{
        display: block;
        cursor: pointer;
    }

    .nav-toggle:hover{
        cursor: pointer;
    }

    #menu-toggle.is-active .bar:nth-child(2){
        opacity: 0;
    }
    #menu-toggle.is-active .bar:nth-child(1){
        transform: translatey(8px) rotate(45deg);
    }
    #menu-toggle.is-active .bar:nth-child(3){
        transform: translatey(-8px) rotate(-45deg);
    }

}

</style>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="MealPlan_Input.css">
    <title>MealPlan_Input</title>
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
<%
	String intake = request.getParameter("intake");
	String BMI = request.getParameter("bmi");
	String protein = request.getParameter("protein");
	String carbs = request.getParameter("carbs");
	String fat = request.getParameter("fat");
	
%>

    <div class="main">
        <div class="main-container">
            <h1>MEAL PLANNER</h1>
            <svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect x="20" y="13.3333" width="43.3333" height="56.6667" rx="6.66667" stroke="#B3D6A4" stroke-width="5.14286"/>
                <path d="M49.9999 33.3333V26.6666" stroke="#B3D6A4" stroke-width="5.14286" stroke-linecap="round"/>
                <path d="M13.3333 30H26.6667" stroke="#B3D6A4" stroke-width="5.14286" stroke-linecap="round"/>
                <path d="M13.3333 43.3333H26.6667" stroke="#B3D6A4" stroke-width="5.14286" stroke-linecap="round"/>
                <path d="M13.3333 56.6667H26.6667" stroke="#B3D6A4" stroke-width="5.14286" stroke-linecap="round"/>
            </svg>
        </div>
        <div class="main-body">
            <form action = "MealPlan_output.jsp" class="body-text">
            	<input type="hidden" name="edit-calorie-intake" value="<%=intake%>">
				<input type="hidden" name="edit-target-bmi" value="<%=BMI%>">
                <table id="table1">
                    <tr>
                        <th class="th1"> Daily Calorie Intake </th>
                        <th>
                        
                        <input type="text" name="target-bmi" value="<%out.print(BMI);%>"  required>
                        <br></th>
                    </tr>
                    <tr>
                        <th class="th1"> Target BMI </th>
                        <th><input type="text" name="calorie-intake" value="<%out.print(intake);%>" required> <br></th>
                    </tr>
                </table>
                <h2>Macronutrients</h2>
                <table id="table2">
                    <tr>
                        <th> Protein </th>
                        <th> Carbs </th>
                        <th> Fat </th>
                    </tr>
                    <tr>
                        <th><input type="text" name="protein" value="<%out.print(protein);%>" required> <br></th>
                        <th><input type="text" name="carbs" value="<%out.print(carbs);%>" required> <br></th>
                        <th><input type="text" name="fat" value="<%out.print(fat);%>" required> <br></th>
                    </tr>
                </table>
                <button type="submit" class="button" role="button">Save</button>
            </form>
            <div class="body-img">
                <img src="img/mealplanner.svg" id="meal-img" alt="">
            </div>
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