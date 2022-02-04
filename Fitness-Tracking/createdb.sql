CREATE TABLE UserDB(
	userID VARCHAR2(50) PRIMARY KEY,
	username VARCHAR2(50) NOT NULL,
	password VARCHAR2(50) NOT NULL,
	email VARCHAR2(50) NOT NULL,
	fName VARCHAR2(50) NOT NULL,
	lName VARCHAR2(50) NOT NULL
);
INSERT INTO UserDB(userID, username, password, email, fName, lName) VALUES ('12345678', 'admin', 'password', 'example@gmail.com', 'Trish', 'Nguyen');

CREATE TABLE FitnessGoalDB(
	userID VARCHAR2(50) PRIMARY KEY,
	currentBMI NUMBER NOT NULL,
	targetBMI NUMBER NOT NULL,
	timeframe NUMBER NOT NULL,		--in weeks
	FOREIGN KEY(userID) REFERENCES UserDB(userID) ON DELETE CASCADE
);
INSERT INTO FitnessGoalDB(userID, currentBMI, targetBMI, timeframe) VALUES ('12345678', 23, 20, 11);

CREATE TABLE BMILogDB(
	userID VARCHAR2(50),
	bmiLogID VARCHAR2(50),
	bDate VARCHAR2(50) NOT NULL,
	bmi NUMBER NOT NULL, 
	PRIMARY KEY(userID, bmiLogID),
	FOREIGN KEY(userID) REFERENCES UserDB(userID) ON DELETE CASCADE
);
INSERT INTO BMILogDB(userID, bmiLogID, bDate, bmi) VALUES ('12345678', '11111111', '10/29/2021', 29.3);
INSERT INTO BMILogDB(userID, bmiLogID, bDate, bmi) VALUES ('12345678', '22222222', '11/04/2021', 26.93);
INSERT INTO BMILogDB(userID, bmiLogID, bDate, bmi) VALUES ('12345678', '33333333', '12/19/2021', 23.08);
INSERT INTO BMILogDB(userID, bmiLogID, bDate, bmi) VALUES ('12345678', '44444444', '12/11/2021', 22.35);


CREATE TABLE MealLogDB(
	userID VARCHAR2(50),
	mealLogID VARCHAR2(50),
	mDate VARCHAR2(50) NOT NULL,
	contents VARCHAR2(50) NOT NULL,
	calTot NUMBER NOT NULL,
	PRIMARY KEY(userID, mealLogID),
	FOREIGN KEY(userID) REFERENCES UserDB(userID) ON DELETE CASCADE
);
INSERT INTO MealLogDB(userID, mealLogID, mDate, contents, calTot) VALUES ('12345678', '11111111', '10/29/2021', 'latte', 60);
INSERT INTO MealLogDB(userID, mealLogID, mDate, contents, calTot) VALUES ('12345678', '222222', '10/31/2021', 'fish tacos', 380);
INSERT INTO MealLogDB(userID, mealLogID, mDate, contents, calTot) VALUES ('12345678', '7', '11/30/2021', 'ube waffle', 100);
INSERT INTO MealLogDB(userID, mealLogID, mDate, contents, calTot) VALUES ('12345678', '1298', '12/04/2021', 'avocado toast', 230);


CREATE TABLE WorkoutLogDB(
	userID VARCHAR2(50),
	workoutLogID VARCHAR2(50),
	wDate VARCHAR2(50) NOT NULL,
	PRIMARY KEY(userID, workoutLogID),
	FOREIGN KEY(userID) REFERENCES UserDB(userID) ON DELETE CASCADE
);
INSERT INTO WorkoutLogDB(userID, workoutLogID, wDate) VALUES ('12345678', '19273', '10/17/2021');

CREATE TABLE ExerciseLogDB(
	userID VARCHAR2(50),
	workoutLogID VARCHAR2(50),
	exerciseLogID VARCHAR2(50),
	eName VARCHAR2(50) NOT NULL,
	sets NUMBER NOT NULL,
	reps NUMBER NOT NULL,
	weight NUMBER NOT NULL,		--in lbs
	PRIMARY KEY(userID, workoutLogID, exerciseLogID),
	FOREIGN KEY(userID, workoutLogID) REFERENCES WorkoutLogDB(userID, workoutLogID) ON DELETE CASCADE
);
INSERT INTO ExerciseLogDB(userID, workoutLogID, exerciseLogID, eName, sets, reps, weight) VALUES ('12345678', '19273', '1928230', 'Barbell Squats', 4, 5, 95);
INSERT INTO ExerciseLogDB(userID, workoutLogID, exerciseLogID, eName, sets, reps, weight) VALUES ('12345678', '19273', '1203948', 'Calf Raises', 4, 5, 110);
INSERT INTO ExerciseLogDB(userID, workoutLogID, exerciseLogID, eName, sets, reps, weight) VALUES ('12345678', '19273', '11929380', 'Goblet Squats', 4, 5, 50);
INSERT INTO ExerciseLogDB(userID, workoutLogID, exerciseLogID, eName, sets, reps, weight) VALUES ('12345678', '19273', '1919230', 'Bulgarian Split Squat', 4, 5, 50);

CREATE TABLE ExampleWorkoutDB(
	workoutID VARCHAR2(50) PRIMARY KEY,
	wName VARCHAR2(50) NOT NULL,
	preference VARCHAR2(50) NOT NULL,
	calburn NUMBER NOT NULL,
	wTime NUMBER NOT NULL,
	difficulty VARCHAR2(50) NOT NULL
); 
INSERT INTO ExampleWorkoutDB(workoutID, wName, preference, calburn, wTime, difficulty) VALUES ('w1', 'Bodyweight Workout', 'Gym/Home', 158, 20, 'Easy');
INSERT INTO ExampleWorkoutDB(workoutID, wName, preference, calburn, wTime, difficulty) VALUES ('w2', 'Full Body Weightlifting', 'Gym', 233, 60, 'Medium');
INSERT INTO ExampleWorkoutDB(workoutID, wName, preference, calburn, wTime, difficulty) VALUES ('w3', 'Upper Pull Workout', 'Gym', 465, 60, 'Hard');


CREATE TABLE ExampleExerciseDB(
	workoutID VARCHAR2(50),
	exerciseID VARCHAR2(50),
	eName VARCHAR2(50)NOT NULL,
	sets NUMBER NOT NULL,
	reps NUMBER NOT NULL,
	PRIMARY KEY(workoutID, exerciseID),
	FOREIGN KEY(workoutID) REFERENCES ExampleWorkoutDB(workoutID) ON DELETE CASCADE
);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w1', 'e1', 'Bodyweight Squats', 3, 20);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w1', 'e2', 'Dumbbell Rows', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w1', 'e3', 'Push-ups', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w1', 'e4', 'Bodyweight Lunges', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w1', 'e5', 'Jumping Jacks', 3, 30);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w2', 'e1', 'Goblet Squat', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w2', 'e2', 'Reverse-Grip Pulldown', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w2', 'e3', 'Bent-Over Barbell Row', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w2', 'e4', 'Bent-Knee Deadlift', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w2', 'e5', 'Dumbell Lunge', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w3', 'e1', 'Weighted Pull Ups', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w3', 'e2', 'Dumbell Bench Press', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w3', 'e3', 'Seated Row', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w3', 'e4', 'Dumbbell Reverse Flies', 3, 10);
INSERT INTO ExampleExerciseDB(workoutID, exerciseID, eName, sets, reps) VALUES ('w3', 'e5', 'Band Pulls', 3, 10);

CREATE TABLE MealDB(
	MealID VARCHAR2(50) PRIMARY KEY,
	protein NUMBER NOT NULL,	--in grams per pound of bodyweight?
	carb NUMBER NOT NULL,		--in grams per pound of bodyweight?
	fat NUMBER NOT NULL,		--in grams per pound of bodyweight?
	cal NUMBER NOT NULL,		--in grams per pound of bodyweight?
	diet VARCHAR2(30) NOT NULL,	--vegetarian, normal, etc.
	img VARCHAR2(50)			--datapath to image (maybe??)
);

CREATE TABLE MealPlanDB(
	userID VARCHAR2(50) PRIMARY KEY,
	dailyCalIntake NUMBER NOT NULL,
	targetBMI NUMBER NOT NULL,
	protein NUMBER NOT NULL,
	carbs NUMBER NOT NULL,
	fat NUMBER NOT NULL,
	FOREIGN KEY(userID) REFERENCES UserDB(userID) ON DELETE CASCADE
);
INSERT INTO MealPlanDB(userID, dailyCalIntake, targetBMI, protein, carbs, fat) VALUES ('12345678', 2100, 21.4, 500, 300, 400);

CREATE TABLE WorkoutPlanDB(
	userID VARCHAR2(50) PRIMARY KEY,
	pref VARCHAR2(10),
	sun VARCHAR2(10),
	mon VARCHAR2(10),
	tues VARCHAR2(10),
	wed VARCHAR2(10),
	thurs VARCHAR2(10),
	fri VARCHAR2(10),
	sat VARCHAR2(10),
	FOREIGN KEY(userID) REFERENCES UserDB(userID) ON DELETE CASCADE
);
INSERT INTO WorkoutPlanDB(userID, pref, sun, mon, tues, wed, thurs, fri, sat) VALUES ('12345678', 'Gym', 'Rest', 'Chest', 'Back', 'Rest', 'Legs', 'Arms', 'Rest');

COMMIT WORK;