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
    position: relative;
    left: 33%;
    top: 15%;
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
	
	<!-- prefill out form -->
	<%
		String pref = request.getParameter("pref");
		String sun = request.getParameter("sunday");
		String mon = request.getParameter("monday");
		String tues = request.getParameter("tuesday");
		String wed = request.getParameter("wednesday");
		String thurs = request.getParameter("thursday");
		String fri = request.getParameter("friday");
		String sat = request.getParameter("saturday");
		
		System.out.println("WP_Edit_In.jsp: "+ pref + ", " + sun + ", " + mon + ", " + tues + ", " + wed + ", " + thurs + ", " + fri+ ", " + sat);

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
        <%
			if(pref.equalsIgnoreCase("Home")){
				System.out.println("WP_Edit_In.jsp: home pref");
				out.print("<input type='checkbox' name='preference' value='Home' checked>");
			}
			else{
				out.print("<input type='checkbox' name='preference' value='Home'>");
			}
        %>
      </td>
      <td>
        <label for="coding">Gym</label>
        <%
			if(pref.equalsIgnoreCase("Gym")){
				System.out.println("WP_Edit_In.jsp: gym pref");
				out.print("<input type='checkbox' name='preference' value='Gym' checked>");
			}
			else{
				out.print("<input type='checkbox' name='preference' value='Gym'>");
			}
        %>
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
   <td><select id="sunday" name="sunday">
    <option value="rest"  <% if(sun.equals("rest")) out.print("selected"); else out.print(""); %>>Rest</option>
    <option value="chest" <% if(sun.equals("chest")) out.print("selected"); else out.print(""); %>>Chest</option>
    <option value="back" <% if(sun.equals("back")) out.print("selected"); else out.print(""); %>>Back</option>
    <option value="legs" <% if(sun.equals("legs")) out.print("selected"); else out.print(""); %>>Legs</option>
    <option value="arms"<% if(sun.equals("arms")) out.print("selected"); else out.print(""); %>>Arms</option>
     </select></td>

     <td><select id="monday" name="monday">
   	<option value="rest"  <% if(mon.equals("rest")) out.print("selected"); else out.print(""); %>>Rest</option>
    <option value="chest" <% if(mon.equals("chest")) out.print("selected"); else out.print(""); %>>Chest</option>
    <option value="back" <% if(mon.equals("back")) out.print("selected"); else out.print(""); %>>Back</option>
    <option value="legs" <% if(mon.equals("legs")) out.print("selected"); else out.print(""); %>>Legs</option>
    <option value="arms"<% if(mon.equals("arms")) out.print("selected"); else out.print(""); %>>Arms</option>
      </select></td>

      <td><select id="tuesday" name="tuesday">
    <option value="rest"  <% if(tues.equals("rest")) out.print("selected"); else out.print(""); %>>Rest</option>
    <option value="chest" <% if(tues.equals("chest")) out.print("selected"); else out.print(""); %>>Chest</option>
    <option value="back" <% if(tues.equals("back")) out.print("selected"); else out.print(""); %>>Back</option>
    <option value="legs" <% if(tues.equals("legs")) out.print("selected"); else out.print(""); %>>Legs</option>
    <option value="arms"<% if(tues.equals("arms")) out.print("selected"); else out.print(""); %>>Arms</option>
       </select></td>

       <td><select id="wednesday" name="wednesday">
    <option value="rest"  <% if(wed.equals("rest")) out.print("selected"); else out.print(""); %>>Rest</option>
    <option value="chest" <% if(wed.equals("chest")) out.print("selected"); else out.print(""); %>>Chest</option>
    <option value="back" <% if(wed.equals("back")) out.print("selected"); else out.print(""); %>>Back</option>
    <option value="legs" <% if(wed.equals("legs")) out.print("selected"); else out.print(""); %>>Legs</option>
    <option value="arms"<% if(wed.equals("arms")) out.print("selected"); else out.print(""); %>>Arms</option>
        </select></td>

        <td><select id="thursday" name="thursday">
    <option value="rest"  <% if(thurs.equals("rest")) out.print("selected"); else out.print(""); %>>Rest</option>
    <option value="chest" <% if(thurs.equals("chest")) out.print("selected"); else out.print(""); %>>Chest</option>
    <option value="back" <% if(thurs.equals("back")) out.print("selected"); else out.print(""); %>>Back</option>
    <option value="legs" <% if(thurs.equals("legs")) out.print("selected"); else out.print(""); %>>Legs</option>
    <option value="arms"<% if(thurs.equals("arms")) out.print("selected"); else out.print(""); %>>Arms</option>
         </select></td>

         <td><select id="friday" name="friday">
    <option value="rest"  <% if(fri.equals("rest")) out.print("selected"); else out.print(""); %>>Rest</option>
    <option value="chest" <% if(fri.equals("chest")) out.print("selected"); else out.print(""); %>>Chest</option>
    <option value="back" <% if(fri.equals("back")) out.print("selected"); else out.print(""); %>>Back</option>
    <option value="legs" <% if(fri.equals("legs")) out.print("selected"); else out.print(""); %>>Legs</option>
    <option value="arms"<% if(fri.equals("arms")) out.print("selected"); else out.print(""); %>>Arms</option>
          </select></td>

          <td><select id="saturday" name="saturday">
    <option value="rest"  <% if(sat.equals("rest")) out.print("selected"); else out.print(""); %>>Rest</option>
    <option value="chest" <% if(sat.equals("chest")) out.print("selected"); else out.print(""); %>>Chest</option>
    <option value="back" <% if(sat.equals("back")) out.print("selected"); else out.print(""); %>>Back</option>
    <option value="legs" <% if(sat.equals("legs")) out.print("selected"); else out.print(""); %>>Legs</option>
    <option value="arms"<% if(sat.equals("arms")) out.print("selected"); else out.print(""); %>>Arms</option>
           </select></td>
 	 </tr>

		</table>
	</div>
  <br>
  <br>
  <br>
 
  <button type="submit" class="button" role="button">SAVE WORKOUT PLAN</button>

</form>

</body>
</html>