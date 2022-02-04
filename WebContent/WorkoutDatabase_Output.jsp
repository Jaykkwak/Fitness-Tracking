<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="java.sql.*, java.util.*, java.util.Calendar, java.util.Date, java.text.SimpleDateFormat, EasyFit_Model.ExampleWorkout, EasyFit_Model.ExampleExercise, EasyFit_Model.ExampleWorkoutDBHelper"%>

<!DOCTYPE html>
<html>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);

:root{
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

body{
    background-color: white;
}

.navbar{
    width: 100%;
    background: var(--orange);
    z-index: 999;
    top: 0;
    position: sticky;
}

.nav-container{
    display: grid;
    grid-template-columns: 1fr auto 2fr;
    align-items: center;
    justify-items: end;
    height: 80px;
    width: 70%;
    max-width: 1900px;
    margin: 0 auto;
}

.nav-logo{
    color: white;
    justify-self: start;
    font-size: 2.3rem;
    font-weight: 1000;
    cursor: pointer;
}

.nav-menu{
    display: grid;
    grid-template-columns: repeat(4, 130px);
    list-style: none;
    text-align: center;
    width: 70%;
    justify-content: end;
    z-index: 1;
}

.nav-links{
    font-size: 1.2rem;
    color: white;
    text-decoration: none;
}

.nav-links:hover{
    color: var(--green);
    transition: all 0.2 ease-out;
}

.nav-btn{
    background-color: var(--green);
    padding: 6px 20px;
    border-radius: 4px;
    font-weight: 600;
}

.nav-btn:hover{
    background-color: #aed093;
    color: white;
    padding: 5px 19px;
    border-radius: 4px;
    transition: all 0.3s ease-out;
}

.nav-toggle .bar{
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
    margin: 50px auto 50px auto;
    border-bottom: 4px solid #efefef;
    width: 60%;
}

.main-body{
    text-align: start;
    justify-content: center;
    margin: 0 auto;
    width: 60%;
}

.search-bar{
    text-align: center;
    justify-content: center;
}

.search-bar input[type=text]{
    width: 559px;
    height: 48px;
    padding: 12px 20px;
    font-size: 1.2rem;
    border-radius: 6px;
    background-color: #f8f9fa;
    border: 1px solid #efeeee;
}

#search-btn{
    width: 129px;
    height: 48px;
    background-color: #b3d6a4;
    color: white;
    font-size: 1.2rem;
    font-weight: 600;
    border: 1px solid #efeeee;
    border-radius: 6px;
    cursor: pointer;
    margin-left: 35px;
}

.main-body h1{
    margin-top: 50px;
}

.workout-tb{
    display: block;
    max-height: 400px;
    overflow-y: scroll;
    width: 100%;
    margin-top: 20px;
    text-align: center;
    font-size: 1.1rem;
    border-collapse: collapse;
    overflow-y: auto;
}

.workout-tb tbody {
    display: block;
    max-height: 400px;
    overflow-y: scroll;
  }

tr, thead{
    display: table;
    height: 56px;
    width: 100%;
    table-layout: fixed;
}

.rows{
    cursor: pointer;
}

.rows:hover{
    background-color: #eafbff;
}

.workout-tb th{
    background: #f5f5f5;
    border-bottom: 1px solid #b1b1b1;
    padding: 8px;
}

.workout-tb td{
    border-bottom: 0.5px solid #f5f5f5;
    padding: 8px;
}

.workout-tb td:nth-child(1){
    width: 180px;
}
.workout-tb th:nth-child(1){
    width: 180px;
}

.modal{
    position: fixed;
    z-index: 10;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(190, 190, 190, 0.5);
}

.modal-content{
    background: #adadad;
    position: relative;
    margin: 12% auto;
    width: 830px;
    height: 720px;
    box-shadow: 0 5px 8px 0 rgba(0,0,0, 0.2), 0 7px 20px 0 rgba(0,0,0,0.2);
    border-radius: 3px;
    min-height: 500px;

}

.modal-container{
    justify-content: center;
    text-align: center;
    margin: 0 auto;
    padding: 30px 10px;
    color: white;
}

.modal-container h1{
    font-size: 3rem;
    letter-spacing: 0.3rem;
}

.modal-container h2{
    font-size: 2rem;
    letter-spacing: 0.2rem;
}

.workout-db{
    margin: 0 auto;
    width: 593px;
    height: 293px;
    font-size: 1.8rem;
    border-spacing: 15px;
}

#db-header{
    border-bottom: 3px solid #ffc882;
}

.db-rows td {
    background-color: #efefef;
    color: black;
    border-spacing: 30px;
    font-size: 1.3rem;
    padding: 10px 3px;
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
    <link rel="stylesheet" href="workout-db.css">
    <title>Workout Database</title>
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

    <div class="main">
        <div class="main-container">            
            <h1>WORKOUT DATABASE</h1> 
        </div>
        <div class="main-body">
            <form action="/" class="search-bar">
                <input type="text" placeholder="Search by exercise or name">
                <button type="submit" id="search-btn" value="submit">Search</button>
            </form>
            <h1>Workouts</h1>
            <table class="workout-tb">
                <tr id="header">
                    <th>Workout #</th>
                    <th>Name</th>
                    <th>Exercise</th>
                    <th>Difficulty</th>
                </tr>
                <%
                	ExampleWorkoutDBHelper ewdbhelp = new ExampleWorkoutDBHelper();
                	ArrayList<ExampleWorkout> workouts = ewdbhelp.getExampleWorkouts();
                	
                	int row = 1;
                	//prints workout table
                	for(ExampleWorkout w: workouts){
                		System.out.println("WorkoutDB.jsp: " + w.getDescription());
                		
                		out.print("<tr class='rows' onclick='workout_modal(this)'>");
                		out.print("<td>"+row+"</td>");
                		out.print("<td>"+w.getName()+"</td>");
                		out.print("<td>"+w.getDescription()+"</td>");
                		out.print("<td>"+w.getDifficulty()+"</td>");
                		out.print("</tr>");
                		
                		row++;
                	}
                %>           
            </table>
        </div>

    </div>
    
    <input type="hidden" name="workout-name">
	<input type="hidden" name="rowID">
	
    <div class="modal" id="workout-modal">
        <div class="modal-content">
            <div class="modal-container">
            	<%
            		//prints out modal
            		String wName = request.getParameter("workout-name");
            		System.out.println("WorkoutDB_Out.jsp: " + wName);
            		
            		int workoutIndex;
            		if(wName.equals("Bodyweight Workout")){
            			workoutIndex = 0;
            		}
            		else if(wName.equals("Full Body Weightlifting")){
            			workoutIndex = 1;
            		}
            		//Upper Pull Workout
            		else{
            			workoutIndex = 2;
            		}
            		
            		ExampleWorkout w = workouts.get(workoutIndex);
            		out.print("<h1>"+w.getName()+"</h1>");
            		out.print("<h2>("+w.getDifficulty()+")</h2>");
            		out.print("<table class='workout-db'>");
            		out.print("<tr id='db-header'>");
            		out.print("<th>Exercise</th>");
         			out.print("<th>Reps</th>");
         			out.print("<th>Sets</th>");
         			out.print("</tr>");
         			
         			ArrayList<ExampleExercise> exercises = w.getExercises();
         			for(ExampleExercise e: exercises){
         				out.print("<tr class='db-rows'>");
         				out.print("<td>"+e.getName()+"</td>");
             			out.print("<td>"+e.getReps()+"</td>");
             			out.print("<td>"+e.getSets()+"</td>");
             			out.print("</tr>");             
         			}
         			out.print("</table>"); 
         			   
            	%>   
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
