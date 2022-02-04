<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="javax.servlet.http.Cookie"%>

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

body {
	background-color: white;
}

div.title {
	color: #707070;
	font-size: 1.1rem;
	display: flex;
	margin: 30px auto 0px 50px;
}

div.username {
	color: black;
	font-size: 2.3rem;
	display: flex;
	margin: 0px auto 0px 50px;
}

div.table {
	position: absolute;
	right: 300px;
	top: 85px;
	line-height: 3.5em;
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

div.try {
	display: flex;
	justify-content: center;
}

/*dumbell icon*/
.dumbell{
	/* Line_light */
	
	position: absolute;
	width: 173.06px;
	height: 173.06px;
	left: 1067.77px;
	top: 0px;
	
	
	
	/* Rectangle 53 */
	
	position: absolute;
	left: 30.83%;
	right: 30.83%;
	top: 35.83%;
	bottom: 50%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	border-radius: 28.8438px;
	transform: rotate(90deg);
	
	
	/* Rectangle 54 */
	
	position: absolute;
	left: 83.33%;
	right: -21.67%;
	top: 35.83%;
	bottom: 50%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	border-radius: 28.8438px;
	transform: rotate(90deg);
	
	
	/* Vector 184 */
	
	position: absolute;
	left: 32.5%;
	right: 30.83%;
	top: 50.83%;
	bottom: 49.17%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	
	
	/* Vector 185 */
	
	position: absolute;
	left: 32.5%;
	right: 31.25%;
	top: 60.83%;
	bottom: 39.17%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	
	
	/* Vector 187 */
	
	position: absolute;
	left: 83.33%;
	right: 7.08%;
	top: 60.83%;
	bottom: 39.17%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	
	
	/* Vector 189 */
	
	position: absolute;
	left: 83.33%;
	right: 7.08%;
	top: 50%;
	bottom: 50%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	
	
	/* Vector 188 */
	
	position: absolute;
	left: 90.83%;
	right: -0.83%;
	top: 60%;
	bottom: 40%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	transform: rotate(-90deg);
	
	
	/* Vector 190 */
	
	position: absolute;
	left: 17.08%;
	right: 73.33%;
	top: 50%;
	bottom: 50%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	transform: rotate(179.97deg);
	
	
	/* Vector 191 */
	
	position: absolute;
	left: 17.08%;
	right: 73.33%;
	top: 60.83%;
	bottom: 39.17%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	transform: rotate(179.97deg);
	
	
	/* Vector 192 */
	
	position: absolute;
	left: 9.58%;
	right: 81.25%;
	top: 50.84%;
	bottom: 49.16%;
	
	/* fill_icon */
	border: 7.21094px solid #FFFFFF;
	transform: rotate(89.97deg);
	
}

</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard</title>
</head>
<body>
	<%
		Cookie fnameC = null;
		Cookie lnameC = null;
		Cookie[] cookies = request.getCookies();
		for (Cookie c : cookies) {
			if (c.getName().equals("fname")) {
				fnameC = c;
			}
			if (c.getName().equals("lname")) {
				lnameC = c;
			}
		}

		String fname = "John";
		String lname = "Doe";
		if (fnameC.getValue() != null || lnameC.getValue() != null) {
			fname = fnameC.getValue();
			lname = lnameC.getValue();
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
			window.location="Settings.jsp";
		}
		function signout(){
			window.location="Signed-Out.jsp";
		}
	</script> 

	<div class="title">
		<h1>WELCOME BACK,</h1>
	</div>
	<div class="username">
		<h1>
			<%
				out.print(fname + ' ' + lname);
			%>
		</h1>
	</div>


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
				<a class="btn" href="MealEntry_Search.jsp">MEAL TRACKER</a>
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
				<a class="btn" href="BMIEntry_Search.jsp">BMI TRACKER</a>
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
				<a class="btn" href="WorkoutDatabase_Input.jsp">WORKOUT DATABASE</a>
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
				<a class="btn" href="WorkoutEntry_Search.jsp">WORKOUT TRACKER</a>
			</div>

		</div>
	</div>
	<div class="try">
		<svg width="276" height="218" viewBox="0 0 276 218" fill="none"
			xmlns="http://www.w3.org/2000/svg">
<g clip-path="url(#clip0_44:228)">
<path
				d="M106.508 192.945L113.874 199.726L108.02 189.904C112.632 181.541 120.175 174.312 120.175 174.312C120.175 174.312 135.824 189.305 135.824 201.091C135.824 212.876 128.818 216.991 120.175 216.991C111.532 216.991 104.526 212.876 104.526 201.091C104.526 198.467 105.303 195.686 106.508 192.945Z"
				fill="#F2F2F2" />
<path
				d="M115.768 200.094V200.675C115.803 207.427 116.942 212.696 119.176 216.405C119.208 216.46 119.242 216.512 119.274 216.566L119.524 216.414L119.763 216.264C117.284 212.258 116.407 206.596 116.375 200.706C116.372 200.516 116.369 200.324 116.372 200.131C116.381 197.638 116.533 195.116 116.778 192.665C116.795 192.476 116.815 192.283 116.835 192.09C117.175 188.858 117.663 185.769 118.164 183.086C118.198 182.896 118.236 182.706 118.273 182.519C119.139 177.981 120.022 174.694 120.223 173.967C120.246 173.878 120.26 173.829 120.263 173.817L119.99 173.74L119.987 173.737L119.711 173.659C119.708 173.671 119.659 173.834 119.579 174.139C119.271 175.278 118.472 178.37 117.686 182.448C117.652 182.632 117.615 182.821 117.58 183.011C117.172 185.188 116.772 187.621 116.456 190.175C116.375 190.816 116.303 191.449 116.24 192.073C116.217 192.266 116.197 192.458 116.18 192.648C115.915 195.297 115.778 197.779 115.768 200.094Z"
				fill="white" />
<path
				d="M117.686 182.447C117.879 182.473 118.075 182.499 118.273 182.519C118.812 182.575 119.353 182.603 119.895 182.603C122.204 182.606 124.484 182.091 126.567 181.096C126.688 181.248 126.808 181.401 126.932 181.556C124.741 182.626 122.334 183.18 119.895 183.178C119.317 183.178 118.739 183.147 118.164 183.086C117.968 183.066 117.773 183.04 117.58 183.011C115.989 182.783 114.443 182.315 112.993 181.622C113.117 181.464 113.237 181.309 113.355 181.156C114.728 181.798 116.187 182.233 117.686 182.447Z"
				fill="white" />
<path
				d="M116.239 192.073C116.438 192.084 116.636 192.09 116.835 192.09C116.895 192.093 116.958 192.093 117.019 192.093C119.52 192.093 121.985 191.488 124.202 190.33C126.42 189.172 128.324 187.494 129.753 185.441C129.868 185.611 129.983 185.78 130.095 185.953C128.606 188.031 126.643 189.723 124.369 190.891C122.095 192.059 119.575 192.668 117.019 192.668C116.938 192.668 116.858 192.668 116.777 192.665C116.576 192.662 116.378 192.657 116.179 192.648C113.109 192.491 110.148 191.452 107.652 189.657C107.744 189.487 107.836 189.318 107.931 189.148C110.357 190.911 113.244 191.927 116.239 192.073Z"
				fill="white" />
<path
				d="M115.768 200.094C115.969 200.111 116.17 200.122 116.372 200.131C116.588 200.14 116.803 200.145 117.019 200.145C120.38 200.141 123.65 199.049 126.339 197.031C129.027 195.013 130.99 192.179 131.933 188.953C132.062 189.186 132.192 189.416 132.315 189.649C131.253 192.868 129.203 195.67 126.457 197.658C123.711 199.645 120.409 200.717 117.019 200.721C116.803 200.721 116.588 200.718 116.375 200.706C116.171 200.7 115.969 200.689 115.768 200.675C111.702 200.356 107.908 198.505 105.156 195.495C105.216 195.282 105.285 195.072 105.355 194.86C108.013 197.892 111.748 199.769 115.768 200.094Z"
				fill="white" />
<path
				d="M238.249 76.6574C217.4 76.6574 200.498 59.7558 200.498 38.9066C200.498 18.0575 217.4 1.15588 238.249 1.15588C259.098 1.15588 276 18.0575 276 38.9066C276 59.7558 259.098 76.6574 238.249 76.6574Z"
				fill="#E4E4E4" />
<path
				d="M238.249 70.3659C220.875 70.3659 206.79 56.2813 206.79 38.907C206.79 21.5327 220.875 7.448 238.249 7.448C255.623 7.448 269.708 21.5327 269.708 38.907C269.708 56.2813 255.623 70.3659 238.249 70.3659Z"
				fill="#FFC882" />
<path
				d="M138 76.6574C117.151 76.6574 100.249 59.7558 100.249 38.9066C100.249 18.0575 117.151 1.15588 138 1.15588C158.849 1.15588 175.751 18.0575 175.751 38.9066C175.751 59.7558 158.849 76.6574 138 76.6574Z"
				fill="#E4E4E4" />
<path
				d="M138 70.3659C120.626 70.3659 106.541 56.2813 106.541 38.907C106.541 21.5327 120.626 7.448 138 7.448C155.374 7.448 169.459 21.5327 169.459 38.907C169.459 56.2813 155.374 70.3659 138 70.3659Z"
				fill="white" />
<path
				d="M37.7507 76.6574C16.9015 76.6574 -4.57764e-05 59.7558 -4.57764e-05 38.9066C-4.57764e-05 18.0575 16.9015 1.15588 37.7507 1.15588C58.5999 1.15588 75.5015 18.0575 75.5015 38.9066C75.5015 59.7558 58.5999 76.6574 37.7507 76.6574Z"
				fill="#E4E4E4" />
<path
				d="M37.751 70.3659C20.3767 70.3659 6.29205 56.2813 6.29205 38.907C6.29205 21.5327 20.3767 7.448 37.751 7.448C55.1253 7.448 69.21 21.5327 69.21 38.907C69.21 56.2813 55.1253 70.3659 37.751 70.3659Z"
				fill="white" />
<path
				d="M231.508 54.9119C231.426 54.9119 231.345 54.9099 231.263 54.906C230.543 54.8713 229.84 54.6813 229.2 54.3491C228.561 54.0169 228.001 53.5503 227.559 52.9814L220.579 44.0065C219.766 42.9591 219.402 41.632 219.566 40.3164C219.73 39.0008 220.41 37.8041 221.455 36.9889L221.707 36.7934C222.754 35.9807 224.081 35.6166 225.397 35.781C226.713 35.9454 227.909 36.6249 228.725 37.6704C229.118 38.1763 229.616 38.5911 230.185 38.8866C230.753 39.1821 231.379 39.3513 232.019 39.3825C232.659 39.4137 233.299 39.3062 233.893 39.0674C234.488 38.8286 235.024 38.4642 235.465 37.999L249.639 23.0371C250.09 22.5603 250.631 22.1772 251.231 21.9095C251.831 21.6419 252.478 21.495 253.134 21.4773C253.791 21.4596 254.444 21.5713 255.058 21.8062C255.671 22.0411 256.232 22.3945 256.709 22.8462L256.94 23.0654C257.903 23.9776 258.464 25.2349 258.5 26.5606C258.535 27.8864 258.043 29.1721 257.131 30.1349L235.137 53.3502C234.67 53.8437 234.107 54.2366 233.483 54.5052C232.859 54.7737 232.187 54.9121 231.508 54.9119Z"
				fill="white" />
<path
				d="M154.568 31.2629H179.416V9.65323C179.39 8.3152 178.835 7.04191 177.873 6.11247C176.91 5.18303 175.618 4.67329 174.279 4.695H166.02C159.706 4.695 154.568 9.65377 154.568 15.7489V31.2629Z"
				fill="#54595E" />
<path
				d="M145.369 212.091L150.086 212.091L152.331 193.897L145.369 193.897L145.369 212.091Z"
				fill="#FFB6B6" />
<path
				d="M144.166 216.664L159.376 216.663V216.471C159.376 214.901 158.752 213.395 157.642 212.285C156.532 211.174 155.026 210.551 153.456 210.551H153.456L144.166 210.551L144.166 216.664Z"
				fill="#54595E" />
<path
				d="M188.847 212.091L193.564 212.091L195.808 193.897L188.846 193.897L188.847 212.091Z"
				fill="#FFB6B6" />
<path
				d="M187.644 216.664L202.854 216.663V216.471C202.854 214.901 202.23 213.395 201.12 212.285C200.01 211.174 198.504 210.551 196.934 210.551H196.934L187.644 210.551L187.644 216.664Z"
				fill="#54595E" />
<path
				d="M183.151 65.9218L186.229 85.5445L156.988 85.9291L160.836 67.0762L183.151 65.9218Z"
				fill="#FFB6B6" />
<path
				d="M185.381 80.7534L194.694 105.552L195.849 208.322H187.961L169.108 125.752L151.794 206.166H144.099L149.485 115.748C149.485 115.748 147.897 97.6002 156.026 86.8914L158.005 81.1746L185.381 80.7534Z"
				fill="#54595E" />
<path
				d="M145.432 100.085C146.246 99.8634 147.002 99.4657 147.646 98.9202C148.29 98.3747 148.806 97.6946 149.159 96.9279C149.511 96.1613 149.691 95.3266 149.687 94.4827C149.682 93.6389 149.492 92.8063 149.13 92.0438L161.57 51.4869L152.42 49.6731L141.043 89.4273C139.802 90.1194 138.858 91.2426 138.39 92.5841C137.922 93.9256 137.963 95.3921 138.504 96.7058C139.045 98.0196 140.049 99.0892 141.326 99.712C142.603 100.335 144.064 100.468 145.432 100.085H145.432Z"
				fill="#FFB6B6" />
<path
				d="M161.895 76.7585L182.052 76.3694C182.628 76.3572 183.184 76.1564 183.635 75.7979C184.086 75.4393 184.407 74.9428 184.549 74.3843C185.63 70.106 188.008 58.956 186.746 47.8507C186.498 45.6994 185.82 43.6198 184.753 41.735C183.686 39.8503 182.253 38.1986 180.536 36.8777C178.82 35.5568 176.856 34.5936 174.761 34.045C172.666 33.4964 170.482 33.3735 168.339 33.6837C166.078 34.0074 163.911 34.8055 161.98 36.0256C160.049 37.2457 158.398 38.8603 157.135 40.7634C155.872 42.6665 155.026 44.8152 154.652 47.0684C154.278 49.3216 154.384 51.6285 154.964 53.8376C157.501 63.4732 158.935 70.3665 159.224 74.3267C159.267 74.8993 159.496 75.4422 159.876 75.8723C160.256 76.3025 160.767 76.5963 161.33 76.709C161.498 76.7422 161.668 76.759 161.839 76.7592C161.857 76.7592 161.876 76.759 161.895 76.7585Z"
				fill="#E4E4E4" />
<path
				d="M223.123 41.1342C223.002 41.4057 222.903 41.6864 222.826 41.9736L197.595 50.5473L192.72 46.2882L185.33 52.8058L193.228 61.1845C193.866 61.8614 194.707 62.313 195.623 62.4716C196.54 62.6302 197.483 62.4872 198.312 62.0641L225.31 48.2732C226.287 48.8721 227.422 49.1596 228.566 49.0974C229.71 49.0351 230.807 48.6262 231.713 47.9249C232.619 47.2236 233.289 46.2633 233.636 45.1715C233.982 44.0798 233.988 42.9085 233.653 41.8133C233.317 40.7181 232.656 39.7511 231.758 39.0407C230.859 38.3304 229.766 37.9104 228.623 37.8367C227.48 37.7629 226.341 38.0389 225.359 38.628C224.377 39.217 223.597 40.0912 223.123 41.1342V41.1342Z"
				fill="#FFB6B6" />
<path
				d="M197.542 49.18C197.54 48.8325 197.464 48.4896 197.317 48.1745C197.17 47.8595 196.958 47.5798 196.693 47.3545L187.455 39.4851C186.285 38.1454 184.633 37.324 182.859 37.2011C181.085 37.0783 179.335 37.6639 177.992 38.8297C176.65 39.9955 175.824 41.6461 175.697 43.4197C175.57 45.1932 176.151 46.9449 177.313 48.2904L183.892 58.535C184.08 58.8273 184.329 59.0758 184.621 59.2634C184.914 59.451 185.243 59.5734 185.587 59.6222C185.931 59.671 186.282 59.6452 186.615 59.5463C186.948 59.4475 187.256 59.278 187.517 59.0494L196.715 51.0159C196.977 50.7874 197.186 50.5051 197.329 50.1883C197.472 49.8714 197.545 49.5275 197.542 49.18Z"
				fill="#E4E4E4" />
<path
				d="M162.128 61.76C162.435 61.5982 162.704 61.3721 162.916 61.0969C163.129 60.8217 163.279 60.504 163.357 60.1654L166.088 48.341C166.739 46.6864 166.707 44.8413 165.999 43.2104C165.291 41.5795 163.966 40.2958 162.313 39.6408C160.66 38.9859 158.815 39.0131 157.182 39.7166C155.549 40.4201 154.262 41.7424 153.603 43.3936L147.538 53.9508C147.365 54.2521 147.259 54.5872 147.227 54.9332C147.195 55.2792 147.238 55.628 147.353 55.9559C147.468 56.2837 147.653 56.5829 147.894 56.8331C148.135 57.0833 148.427 57.2785 148.751 57.4056L160.117 61.871C160.441 61.9982 160.788 62.0542 161.135 62.035C161.482 62.0159 161.82 61.922 162.128 61.76Z"
				fill="#E4E4E4" />
<path
				d="M152.349 6.80677C151.416 4.62189 153.021 1.84191 155.934 0.597507C158.847 -0.646899 161.966 0.115496 162.899 2.30038C163.832 4.48526 162.227 7.26526 159.314 8.50966C156.401 9.75407 153.283 8.99165 152.349 6.80677Z"
				fill="#54595E" />
<path
				d="M161.387 23.0471C158.27 17.3461 160.366 10.1981 166.067 7.08162C171.768 3.96516 178.916 6.06037 182.032 11.7614C185.148 17.4624 183.053 24.6104 177.352 27.7268C171.651 30.8433 164.503 28.7481 161.387 23.0471Z"
				fill="#FFB6B6" />
<path
				d="M165.256 3.93038H178.712C179.699 3.91762 180.654 4.27829 181.385 4.94006C182.117 5.60184 182.571 6.51578 182.658 7.49861C182.692 8.02091 182.62 8.54478 182.444 9.03777C182.268 9.53077 181.992 9.98238 181.635 10.3646C181.277 10.7469 180.845 11.0516 180.365 11.2599C179.884 11.4683 179.367 11.5758 178.843 11.5758C177.829 11.5758 176.857 11.9786 176.14 12.6955C175.423 13.4124 175.02 14.3847 175.02 15.3985V31.0717H153.995V15.1908C153.995 13.7121 154.287 12.2478 154.853 10.8816C155.419 9.51546 156.248 8.27412 157.294 7.22849C158.339 6.18286 159.581 5.35342 160.947 4.78753C162.313 4.22164 163.777 3.93038 165.256 3.93038Z"
				fill="#54595E" />
<path
				d="M98.9225 217.238H244.568C244.669 217.238 244.767 217.198 244.838 217.126C244.91 217.054 244.95 216.957 244.95 216.856C244.95 216.754 244.91 216.657 244.838 216.585C244.767 216.514 244.669 216.473 244.568 216.473H98.9225C98.8211 216.473 98.7239 216.514 98.6522 216.585C98.5805 216.657 98.5402 216.754 98.5402 216.856C98.5402 216.957 98.5805 217.054 98.6522 217.126C98.7239 217.198 98.8211 217.238 98.9225 217.238Z"
				fill="#CACACA" />
</g>
<defs>
<clipPath id="clip0_44:228">
<rect width="276" height="217.238" fill="white"
				transform="matrix(-1 0 0 1 276 0)" />
</clipPath>
</defs>
</svg>
	</div>
</body>
</html>