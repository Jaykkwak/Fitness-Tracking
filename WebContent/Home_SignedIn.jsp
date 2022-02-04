<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="style.css">
<title>Easy Fit</title>
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
	background-color: #ffffff;
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

.hero {
	background: #eaf3e4;
}

.hero_container {
	display: grid;
	grid-template-columns: 1fr 1fr;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
	height: 500px;
	max-width: 1500px;
}

.hero_text {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: 0 auto;
	color: black;
	width: 80%;
}

.hero_text h1 {
	font-size: 2.6rem;
}

.hero_img {
	text-align: center;
}

#workout_img {
	width: 85%;
	height: 85%;
}

.main_btn {
	position: relative;
	color: white;
	font-weight: 800;
	text-decoration: none;
	font-size: 1.3rem;
	background-color: #041e39;
	padding: 13px 50px;
	border: none;
	outline: none;
	border: none;
	border-radius: 4px;
	margin-top: 50px;
	cursor: pointer;
	transition: all 0.35s;
}

.main_btn:hover {
	color: white;
	background-color: #9ac57c;
}

.services {
	font-size: 1rem;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
	padding: 7rem 0;
}

.services_wrapper {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr;
}

.services_card {
	font-family: 'Comfortaa';
	top: 0px;
	margin: 35px;
	height: 250px;
	width: 260px;
	border-radius: 30px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	color: black;
	background-color: #C8E1BD;
	padding: 20px;
	box-shadow: 2px 2px 2px 1px rgba(0, 0, 0, 0.2);
}

.btn {
	position: relative;
	color: white;
	font-weight: 800;
	text-decoration: none;
	font-size: 1.3rem;
	background-color: #C8E1BD;
	padding: 13px 70px;
	border: none;
	outline: none;
	border: none;
	border-radius: 4px;
	margin-top: 5px;
	cursor: pointer;
	transition: all 0.35s;
}

#calorie_img {
	height: 50%;
	width: 65%;
	margin-bottom: 60px;
}

.aboutus {
	padding: 5rem 0 15rem 0;
	margin: 0 auto;
}

.about_container {
	display: grid;
	grid-template-columns: 1fr 1fr;
	align-items: center;
	text-align: center;
	justify-content: center;
	margin: 0 auto;
	height: 90%;
	z-index: 1;
	width: 100%;
	max-width: 1500px;
	padding: 0 50px;
}

.about_left {
	font-size: 4.5rem;
}

.about_right {
	width: 100%;
	justify-self: start;
	text-align: left;
	margin-left: 100px;
}

.about_right h1 {
	font-size: 4rem;
	color: gray;
	margin-bottom: 10px;
}

.about_right h2 {
	font-size: 2.8rem;
	background: #ff8177;
	background: -webkit-linear-gradient(to right, #0fa30d, #24ff0c);
	background: linear-gradient(to right, #0fa30d, #24ff0c);
	-webkit-background-clip: text;
	-moz-background-clip: text;
	-webkit-text-fill-color: transparent;
	-moz-text-fill-color: transparent;
	margin-bottom: 5px;
}

.about_right p {
	font-size: 2rem;
	font-weight: 500;
}
/* footer */
.footer_container {
	background-color: var(--orange);
	padding: 1rem 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#footer_logo {
	color: black;
	display: flex;
	align-items: center;
	cursor: pointer;
	text-decoration: none;
	font-size: 2rem;
}

.footer_links {
	width: 100%;
	max-width: 1400px;
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
}

.footer_link_container {
	display: flex;
}

.footer_link_items {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin: 16px;
	text-align: left;
	width: 300px;
	box-sizing: border-box;
}

.footer_link_items h2 {
	font-size: 2rem;
	margin-bottom: 16px;
	color: black;
}

.footer_link_items a {
	font-size: 1.2rem;
	color: black;
	text-decoration: none;
	margin-bottom: 0.3rem;
	transition: 0.3 ease-out;
}

.footer_link_items a:hover {
	color: #e9e9e9;
	transition: 0.3 ease-out;
}

.footer_copy {
	display: grid;
	grid-template-columns: 1fr 1fr;
	max-width: 1000px;
	font-size: 1rem;
	align-items: center;
	justify-content: center;
}

.footer_copy a {
	font-size: 1.5rem;
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
		justify-content: right;
		width: 100%;
		right:0;
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
				<li><a href="#signout" class="nav-links nav-btn" onClick="signout()">Sign Out</a></li>
			</ul>
		</div>
	</nav>
	
	<!--nav scripts -->
	<script>
		function navHome(){
			window.locations="UserDashboard.jsp";
		}
		function signout(){
			window.location="Signed-Out.jsp";
		}
	</script> 

	<!-- Home -->
	<div class="hero" id="home" class="">
		<div class="hero_container">
			<div class="hero_text">
				<h1>Welcome to Easy Fit!</h1>
				<a class="main_btn" href="UserDashboard.jsp">Get Started</a>
			</div>
			<div class="hero_img">
				<img src="img/workout.svg" id="workout_img" alt="">
			</div>
		</div>

	</div>

	<!-- Services -->
	<div class="service" id="service">
		<div class="services_wrapper">
			<div class="services_card">
				<svg width="350" height="250" viewBox="0 0 144 143" fill="none"
					xmlns="http://www.w3.org/2000/svg">
          <rect x="36.5464" y="23.9922" width="77.3518" height="101.152"
						rx="11.9003" stroke="white" stroke-width="4.72979" />
          <path d="M90.0977 59.6929V47.7926" stroke="white"
						stroke-width="4.72979" stroke-linecap="round" />
          <path d="M24.6465 53.7429H48.447" stroke="white"
						stroke-width="4.72979" stroke-linecap="round" />
          <path d="M24.6465 77.5435H48.447" stroke="white"
						stroke-width="4.72979" stroke-linecap="round" />
          <path d="M24.6465 101.344H48.447" stroke="white"
						stroke-width="4.72979" stroke-linecap="round" />
        </svg>
				<a class="btn">MEAL TRACKER</a>
			</div>

			<div class="services_card">
				<svg width="200" height="200" viewBox="0 0 151 150" fill="none"
					xmlns="http://www.w3.org/2000/svg">
          <path
						d="M106.513 56.0938L87.5849 84.4862C84.9366 88.4587 78.9849 88.0881 76.8497 83.8179L73.9973 78.1131C71.8622 73.8428 65.9105 73.4723 63.2622 77.4447L44.3339 105.837"
						stroke="white" stroke-width="6.37737" stroke-linecap="round"
						stroke-linejoin="round" />
          <rect x="19.4624" y="18.7861" width="111.923" height="111.923"
						rx="12.4359" stroke="white" stroke-width="6.37737" />
        </svg>
				<a class="btn">BMI TRACKER</a>
			</div>

			<div class="services_card">
				<svg width="174" height="174" viewBox="0 0 174 174" fill="none" xmlns="http://www.w3.org/2000/svg">
					<rect x="54.1338" y="62.0142" width="66.3406" height="24.5172" rx="12.2586" transform="rotate(90 54.1338 62.0142)" stroke="white" stroke-width="7.21094"/>
					<rect x="144.992" y="62.0142" width="66.3406" height="24.5172" rx="12.2586" transform="rotate(90 144.992 62.0142)" stroke="white" stroke-width="7.21094"/>
					<path d="M120.475 87.9734H57.0183" stroke="white" stroke-width="7.21094"/>
					<path d="M119.753 105.28H57.0183" stroke="white" stroke-width="7.21094"/>
					<path d="M161.577 105.28H144.992" stroke="white" stroke-width="7.21094"/>
					<path d="M161.577 86.5312H144.992" stroke="white" stroke-width="7.21094"/>
					<path d="M157.971 86.5312L157.971 103.837" stroke="white" stroke-width="7.21094"/>
					<path d="M13.7527 86.5391L30.3379 86.5312" stroke="white" stroke-width="7.21094"/>
					<path d="M13.7527 105.288L30.3379 105.28" stroke="white" stroke-width="7.21094"/>
					<path d="M17.3589 103.838L17.3589 87.9795" stroke="white" stroke-width="7.21094"/>
				</svg>

				<a class="btn" >WORKOUT DATABASE</a>
			</div>

			<div class="services_card">
				<svg width="200" height="200" viewBox="0 0 172 172" fill="none"
					xmlns="http://www.w3.org/2000/svg">
          <rect x="35.8145" y="35.8147" width="100.281" height="100.281"
						rx="21.4887" stroke="white" stroke-width="5.38512" />
          <path d="M42.9775 71.6289H128.932" stroke="white"
						stroke-width="5.38512" stroke-linecap="round" />
          <path
						d="M66.2785 109.868L76.5924 119.491C77.5306 120.366 79.0308 120.187 79.7358 119.114L105.631 79.7412"
						stroke="white" stroke-width="5.38512" />
        </svg>
				<a class="btn">WORKOUT TRACKER</a>
			</div>

		</div>
	</div>
	
	<!-- About us -->
	<div class="aboutus" id="aboutus">
		<div class="about_container">
			<div class="about_left">
				<h1>EASY FIT</h1>
			</div>
			<div class="about_right">
				<h1>Our Mission</h1>
				<h2>To streamline your fitness journey</h2>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div class="footer_container">
		<div class="footer_links">
			<div class="footer_link_container">
				<div class="footer_link_items">
					<h2>About Us</h2>
					<a href="/">How it works</a> <a href="/">About Us</a>
				</div>
				<div class="footer_link_items">
					<h2>Contact Us</h2>
					<a href="/">Contact</a> <a href="/">Support</a>
				</div>
				<div class="footer_link_items">
					<h2>Services</h2>
					<a href="/">Meal Tracker</a> <a href="/">BMI Tracker</a> <a
						href="/">Workout Database</a> <a href="/">Workout Tracker</a>
				</div>
			</div>
		</div>
		<div class="footer_copy">
			<p>Easy Fit 2021. All rights reserved</p>
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