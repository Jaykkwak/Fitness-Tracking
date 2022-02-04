<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="java.util.Calendar, java.util.Date, java.text.SimpleDateFormat, EasyFit_Model.MealPlan, EasyFit_Model.MealPlanDBHelper"%>
	
	
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

.body{
    background-color: white;
}

div.top{
  color:#B3D6A4;
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
table{
  text-align: center;
}
.button{
    position: absolute;
    left: 450px;
    bottom: 100px;
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

}
</style>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="workout-planner.css">
  <title>Workout Planner</title>
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
    <h1>WORKOUT PLANNER</h1>
    <svg width="110" height="110" viewBox="0 0 110 110" fill="none" xmlns="http://www.w3.org/2000/svg">
      <rect x="22.794" y="22.7939" width="63.8232" height="63.8232" rx="13.6764" stroke="#B3D6A4" stroke-width="6" />
      <path d="M27.3528 45.5884H82.0585" stroke="#B3D6A4" stroke-width="5" stroke-linecap="round" />
      <path d="M42.1827 69.9249L48.7469 76.0494C49.344 76.6065 50.2988 76.4922 50.7476 75.8099L67.2287 50.751" stroke="#B3D6A4" stroke-width="5" />
    </svg>
  </div>
<form action = "WorkoutPlan_output.jsp">
  <table cellspacing="20">
    <tr>
      <td>
        <h2>Workout Preferences</h2>
      </td>
    <tr>
      <td>
        <label for="coding">Home</label>
        <input type="checkbox" id="preference" name="preference" value="Home">
      </td>
      <td>
        <label for="coding">Gym</label>
        <input type="checkbox" id="preference" name="preference" value="Gym">
      </td>
    </tr>
  </table>
  <table cellspacing="20">
    <tr>
      <td>
        <h2>Area of Concentration</h2>
      </td>
    </tr>
    
    </table>
    <div class="bottom">
    <table style="width:70%">
  <tr>
    <th>S</th>
    <th>M</th>
    <th>T</th>
    <th>W</th>
    <th>R</th>
    <th>F</th>
    <th>S</th>
  </tr>
  <tr>
    <td><select name="sunday">
    <option value="rest">Rest</option>
    <option value="chest">Chest</option>
    <option value="back">Back</option>
    <option value="legs">Legs</option>
    <option value="arms">Arms</option>
     </select></td>

     <td><select name="monday">
	    <option value="rest">Rest</option>
	    <option value="chest">Chest</option>
	    <option value="back">Back</option>
	    <option value="legs">Legs</option>
	    <option value="arms">Arms</option>
      </select></td>

      <td><select name="tuesday">
	    <option value="rest">Rest</option>
	    <option value="chest">Chest</option>
	    <option value="back">Back</option>
	    <option value="legs">Legs</option>
	    <option value="arms">Arms</option>
       </select></td>

       <td><select name="wednesday">
	    <option value="rest">Rest</option>
	    <option value="chest">Chest</option>
	    <option value="back">Back</option>
	    <option value="legs">Legs</option>
	    <option value="arms">Arms</option>
        </select></td>

        <td><select name="thursday">
	    <option value="rest">Rest</option>
	    <option value="chest">Chest</option>
	    <option value="back">Back</option>
	    <option value="legs">Legs</option>
	    <option value="arms">Arms</option>
         </select></td>

         <td><select name="friday">
	    <option value="rest">Rest</option>
	    <option value="chest">Chest</option>
	    <option value="back">Back</option>
	    <option value="legs">Legs</option>
	    <option value="arms">Arms</option>
          </select></td>

          <td><select name="saturday">
	    <option value="rest">Rest</option>
	    <option value="chest">Chest</option>
	    <option value="back">Back</option>
	    <option value="legs">Legs</option>
	    <option value="arms">Arms</option>
           </select></td>
 	 </tr>

		</table>
	</div>
  
 
  <button type="submit" class="button" role="button">CREATE WORKOUT PLAN</button>

</form>

</body>
</html>