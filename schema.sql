-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- User Management:

CREATE TABLE User (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash CHAR(60) NOT NULL,
    password_salt CHAR(16) NOT NULL,
    date_of_birth DATE NOT NULL,
    user_type TEXT NOT NULL CHECK (user_type IN ('Coach', 'Client'))
);


-- Coach Table
CREATE TABLE Coach (
    id INT PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

-- Client Table
CREATE TABLE Client (
    id INT PRIMARY KEY,
    user_id INT,
    coach_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (coach_id) REFERENCES Coach(id)
);

-- Messages Table
CREATE TABLE Messages (
    message_id INT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    message_text TEXT,
    timestamp TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(id),
    FOREIGN KEY (receiver_id) REFERENCES User(id)
);


-- Exercise Library
CREATE TABLE ExerciseLibrary (
    id INT PRIMARY KEY,
    coach_id INT, -- Reference to the coach who owns the library
    FOREIGN KEY (coach_id) REFERENCES Coach(id)
);

-- Exercise Table
CREATE TABLE Exercise (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(50),
    video_link VARCHAR(255),
    description Text,
    exercise_library_id INT, -- Foreign key referencing ExerciseLibrary
    FOREIGN KEY (exercise_library_id) REFERENCES ExerciseLibrary(id)
);




-- Workout Programs:

-- Workout Program Table
CREATE TABLE Program (
    id INT PRIMARY KEY,
    program_name VARCHAR(50) NOT NULL,
    description TEXT,
    duration INT, -- in days or weeks
    coach_id INT,
    FOREIGN KEY (coach_id) REFERENCES Coach(id)
);

-- Junction Table to Associate Many Clients with One Program
CREATE TABLE ClientProgram (
    client_id INT,
    program_id INT,
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (program_id) REFERENCES Program(id)
);

-- Individual Workout Table
CREATE TABLE Workout (
    id INT PRIMARY KEY,
    workout_name VARCHAR(50) NOT NULL,
    description TEXT,
    program_id INT,
    FOREIGN KEY (program_id) REFERENCES Program(id)
);


-- Workout Components:

-- Exercise Table Specific for Workout
CREATE TABLE WorkoutExercise (
    id INT PRIMARY KEY,
    exercise_order INT,
    reps INT,
    sets INT,
    tempo VARCHAR(30),
    rest INT, -- in seconds
    instructions TEXT,
    exercise_id INT,
    workout_id INT,
    FOREIGN KEY (exercise_id) REFERENCES Exercise(id),
    FOREIGN KEY (workout_id) REFERENCES Workout(id)
);

-- Warm-up Table ()
CREATE TABLE WarmUp (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    instructions TEXT,
    workout_id INT,
    FOREIGN KEY (workout_id) REFERENCES Workout(id)
);

-- Junction Table to Associate Multiple Exercises with a Warm-up
CREATE TABLE WarmUpExercise (
    exercise_order INT,
    reps INT,
    sets INT,
    tempo VARCHAR(30),
    rest INT, -- in seconds
    instructions TEXT,
    warm_up_id INT,
    exercise_id INT,
    PRIMARY KEY (warm_up_id, exercise_id),
    FOREIGN KEY (warm_up_id) REFERENCES WarmUp(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(id)
);

-- Supersets Table
CREATE TABLE Supersets (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    instructions TEXT,
    workout_id INT,
    FOREIGN KEY (workout_id) REFERENCES Workout(id)
);

-- Junction Table for Exercises within Supersets
CREATE TABLE SupersetExercises (
    exercise_order INT, -- Order of exercises within the circuit
    reps INT,
    sets INT,
    tempo VARCHAR(30),
    rest INT, -- in seconds
    instructions TEXT,
    superset_id INT,
    exercise_id INT,
    PRIMARY KEY (superset_id, exercise_id),
    FOREIGN KEY (superset_id) REFERENCES Supersets(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(id)
);

-- Circuits Table
CREATE TABLE Circuits (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    instructions TEXT,
    workout_id INT,
    FOREIGN KEY (workout_id) REFERENCES Workout(id)
);

-- Junction Table for Exercises within Circuits
CREATE TABLE CircuitExercises (
    exercise_order INT, -- Order of exercises within the circuit
    reps INT,
    sets INT,
    tempo VARCHAR(30),
    rest INT, -- in seconds
    instructions TEXT,
    circuit_id INT,
    exercise_id INT,
    PRIMARY KEY (circuit_id, exercise_id),
    FOREIGN KEY (circuit_id) REFERENCES Circuits(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(id)
);

-- Cardio Table
CREATE TABLE Cardio (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    instructions TEXT,
    workout_id INT,
    FOREIGN KEY (workout_id) REFERENCES Workout(id)
);

-- Junction Table for Exercises within Cardio
CREATE TABLE CardioExercises (
    exercise_order INT, -- Order of exercises within the circuit
    reps INT,
    sets INT,
    tempo VARCHAR(30),
    rest INT, -- in seconds
    instructions TEXT,
    cardio_id INT,
    exercise_id INT,
    PRIMARY KEY (cardio_id, exercise_id),
    FOREIGN KEY (cardio_id) REFERENCES Cardio(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(id)
);

-- Client Submissions:

-- Client Submissions Table
CREATE TABLE ClientSubmissions (
    id INT PRIMARY KEY,
    notes Text, -- 'Notes'
    data_url VARCHAR(255), -- Reference to stored photos or videos
    submission_date TIMESTAMP,
    coach_response TEXT,
    client_id INT,
    coach_id INT,
    exercise_id INT,
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (coach_id) REFERENCES Coach(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercise(id)
);




-- INDEX's
-- Exercise Name
CREATE INDEX idx_exercise_name ON Exercise (name);

-- User email
CREATE INDEX idx_user_email ON User (email);

-- Exercise Index
CREATE INDEX idx_exercise_id ON Exercise (id);



-- VIEWS


-- See who coach and client relationship
CREATE VIEW CoachClientAssociations AS
SELECT
    CO.id AS coach_id,
    COU.first_name || ' ' || COU.last_name AS coach_name,
    CLU.first_name || ' ' || CLU.last_name AS client_name,
    CL.id AS client_id
FROM Coach CO
LEFT JOIN User COU ON CO.user_id = COU.id
LEFT JOIN Client CL ON CO.id = CL.coach_id
LEFT JOIN User CLU ON CL.user_id = CLU.id;




CREATE VIEW MessageView AS
SELECT
    M.message_id,
    M.sender_id AS sender_user_id,
    M.receiver_id AS receiver_user_id,
    U1.first_name || ' ' || U1.last_name AS sender_name,
    U2.first_name || ' ' || U2.last_name AS receiver_name,
    M.message_text,
    M.timestamp
FROM
    Messages M
    INNER JOIN User U1 ON M.sender_id = U1.id
    INNER JOIN User U2 ON M.receiver_id = U2.id;





CREATE VIEW Library AS
SELECT
    CO.id AS coach_id,
    U.first_name || ' ' || U.last_name AS coach_name,
    EL.id AS library_number,
    E.name AS exercise_name,
    E.category AS exercise_category,
    E.video_link AS exercise_video_link,
    E.description AS exercise_description
FROM ExerciseLibrary EL
JOIN Exercise E ON EL.id = E.exercise_library_id
JOIN Coach CO ON EL.coach_id = CO.id
JOIN User U ON CO.user_id = U.id;


-- ProgramWorkouts View
CREATE VIEW ProgramWorkouts AS
SELECT
    W.program_id,
    P.program_name,
    W.id AS workout_id,
    W.workout_name,
    W.description AS workout_description,
    P.description AS program_description,
    P.duration AS program_duration
FROM Workout W
JOIN Program P ON W.program_id = P.id;


-- Workout Overview
CREATE VIEW WorkoutComponents AS
SELECT
    WU.workout_id AS Workout_ID,
    WE.exercise_order AS Order_Exercise,
    WU.name AS Component_Name,
    E.name AS Exercise_Name,
    'WarmUp' AS Component_Type,
    WE.reps AS Reps,
    WE.sets AS Sets,
    WE.tempo AS Tempo,
    WE.rest AS Rest_Seconds,
    WE.instructions AS Instructions
FROM WarmUp WU
LEFT JOIN WarmUpExercise WE ON WU.id = WE.warm_up_id
LEFT JOIN Exercise E ON WE.exercise_id = E.id
UNION ALL
SELECT
    S.workout_id AS Workout_ID,
    SE.exercise_order AS Order_Exercise,
    S.name AS Component_Name,
    E.name AS Exercise_Name,
    'Superset' AS Component_Type,
    SE.reps AS Reps,
    SE.sets AS Sets,
    SE.tempo AS Tempo,
    SE.rest AS Rest_Seconds,
    SE.instructions AS Instructions
FROM Supersets S
LEFT JOIN SupersetExercises SE ON S.id = SE.superset_id
LEFT JOIN Exercise E ON SE.exercise_id = E.id
UNION ALL
SELECT
    C.workout_id AS Workout_ID,
    CE.exercise_order AS Order_Exercise,
    C.name AS Component_Name,
    E.name AS Exercise_Name,
    'Circuit' AS Component_Type,
    CE.reps AS Reps,
    CE.sets AS Sets,
    CE.tempo AS Tempo,
    CE.rest AS Rest_Seconds,
    CE.instructions AS Instructions
FROM Circuits C
LEFT JOIN CircuitExercises CE ON C.id = CE.circuit_id
LEFT JOIN Exercise E ON CE.exercise_id = E.id
UNION ALL
SELECT
    CR.workout_id AS Workout_ID,
    CE.exercise_order AS Order_Exercise,
    CR.name AS Component_Name,
    E.name AS Exercise_Name,
    'Cardio' AS Component_Type,
    CE.reps AS Reps,
    CE.sets AS Sets,
    CE.tempo AS Tempo,
    CE.rest AS Rest_Seconds,
    CE.instructions AS Instructions
FROM Cardio CR
LEFT JOIN CardioExercises CE ON CR.id = CE.cardio_id
LEFT JOIN Exercise E ON CE.exercise_id = E.id
ORDER BY Workout_ID, Order_Exercise;
