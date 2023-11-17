-- Sample data for User table
INSERT INTO User (id, first_name, last_name, email, password_hash, password_salt, date_of_birth, user_type)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', 'password_hash1', 'salt1', '1990-01-15', 'Client'),
    (2, 'Alice', 'Smith', 'alice.smith@example.com', 'password_hash2', 'salt2', '1985-04-22', 'Client'),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', 'password_hash3', 'salt3', '1988-07-07', 'Client'),
    (4, 'Sarah', 'Brown', 'sarah.brown@example.com', 'password_hash4', 'salt4', '1982-12-30', 'Client'),
    (5, 'Coach1', 'Trainer', 'coach1@example.com', 'coach_hash1', 'coach_salt1', '1975-03-12', 'Coach'),
    (6, 'Coach2', 'Instructor', 'coach2@example.com', 'coach_hash2', 'coach_salt2', '1980-06-25', 'Coach'),
    (7, 'Coach3', 'Fitness', 'coach3@example.com', 'coach_hash3', 'coach_salt3', '1987-11-18', 'Coach'),
    (8, 'Emily', 'Adams', 'emily.adams@example.com', 'password_hash5', 'salt5', '1995-08-07', 'Client'),
    (9, 'Michael', 'Lee', 'michael.lee@example.com', 'password_hash6', 'salt6', '1992-05-19', 'Client'),
    (10, 'Sophia', 'Garcia', 'sophia.garcia@example.com', 'password_hash7', 'salt7', '1998-02-10', 'Client');

-- Sample data for Coach table
INSERT INTO Coach (id, user_id)
VALUES (1, 5), (2, 6), (3, 7);

-- Sample data for Client table
INSERT INTO Client (id, user_id, coach_id)
VALUES (1, 1, 1), (2, 2, 1), (3, 3, 2), (4, 4, 2), (8, 8, 3), (9, 9, 3), (10, 10, 3);






-- Sample data for ExerciseLibrary
-- Coach 1's Library
INSERT INTO ExerciseLibrary (id, coach_id)
VALUES (1, 1);

-- Coach 2's Library
INSERT INTO ExerciseLibrary (id, coach_id)
VALUES (2, 2);

-- Coach 3's Library
INSERT INTO ExerciseLibrary (id, coach_id)
VALUES (3, 3);






-- Sample data for Exercise Table
-- Exercises for Coach 1's Library
INSERT INTO Exercise (id, name, category, video_link, description, exercise_library_id)
VALUES
    (1, 'Push-up', 'Strength', 'https://example.com/pushup', 'Basic upper body exercise', 1),
    (2, 'Squats', 'Strength', 'https://example.com/squats', 'Lower body strength exercise', 1),
    (3, 'Plank', 'Core', 'https://example.com/plank', 'Core stabilization exercise', 1),
    (4, 'Lunges', 'Strength', 'https://example.com/lunges', 'Leg workout with lunges', 1),
    (5, 'Jumping Jacks', 'Cardio', 'https://example.com/jumping-jacks', 'Full-body cardio exercise', 1),
    (6, 'Burpees', 'Cardio', 'https://example.com/burpees', 'High-intensity cardio exercise', 1),
    (7, 'Bicycle Crunches', 'Core', 'https://example.com/bicycle-crunches', 'Core exercise with rotation', 1),
    (8, 'Dumbbell Rows', 'Strength', 'https://example.com/dumbbell-rows', 'Upper body strength exercise', 1);

-- Exercises for Coach 2's Library
INSERT INTO Exercise (id, name, category, video_link, description, exercise_library_id)
VALUES
    (9, 'Dumbbell Bench Press', 'Strength', 'https://example.com/dumbbell-bench-press', 'Chest workout with dumbbells', 2),
    (10, 'Deadlift', 'Strength', 'https://example.com/deadlift', 'Full-body strength exercise', 2),
    (11, 'Russian Twists', 'Core', 'https://example.com/russian-twists', 'Core exercise with a twist', 2),
    (12, 'Bicep Curls', 'Strength', 'https://example.com/bicep-curls', 'Isolation exercise for biceps', 2),
    (13, 'Treadmill Running', 'Cardio', 'https://example.com/treadmill-running', 'Running on a treadmill for cardio', 2),
    (14, 'Jump Rope', 'Cardio', 'https://example.com/jump-rope', 'Jump rope for cardio and coordination', 2),
    (15, 'Leg Raises', 'Core', 'https://example.com/leg-raises', 'Core exercise for lower abs', 2),
    (16, 'Lat Pulldowns', 'Strength', 'https://example.com/lat-pulldowns', 'Upper body exercise for lats', 2);

-- Exercises for Coach 3's Library
INSERT INTO Exercise (id, name, category, video_link, description, exercise_library_id)
VALUES
    (17, 'Pull-ups', 'Strength', 'https://example.com/pull-ups', 'Upper body pull exercise', 3),
    (18, 'Hollow Body Hold', 'Core', 'https://example.com/hollow-body-hold', 'Core strengthening exercise', 3),
    (19, 'Mountain Climbers', 'Cardio', 'https://example.com/mountain-climbers', 'Cardio exercise with knee drive', 3),
    (20, 'Dumbbell Lunges', 'Strength', 'https://example.com/dumbbell-lunges', 'Leg workout with dumbbells', 3);







-- Sample data for Program Table
-- Program for Coach 1
INSERT INTO Program (id, program_name, description, duration, coach_id)
VALUES (1, 'Strength Training', 'Build strength and muscle', 60, 1);

-- Program for Coach 2
INSERT INTO Program (id, program_name, description, duration, coach_id)
VALUES (2, 'Weight Loss Challenge', 'Lose weight and improve fitness', 90, 2);

-- Program for Coach 3
INSERT INTO Program (id, program_name, description, duration, coach_id)
VALUES (3, 'Core Workout', 'Strengthen your core muscles', 30, 3);






-- Sample data for ClientProgram Table
-- Client 1 participating in Program 1
INSERT INTO ClientProgram (client_id, program_id)
VALUES (1, 1);

-- Client 3 participating in Program 2
INSERT INTO ClientProgram (client_id, program_id)
VALUES (3, 2);

-- Client 8 participating in Program 3
INSERT INTO ClientProgram (client_id, program_id)
VALUES (8, 3);







-- Sample data for Workout Table
-- Workouts for Program 1
INSERT INTO Workout (id, workout_name, description, program_id)
VALUES
    (1, 'Upper Body Strength', 'Focus on upper body strength exercises', 1),
    (2, 'Lower Body Strength', 'Leg and lower body strength workout', 1),
    (3, 'Core and Cardio', 'Core and cardio workout for endurance', 1);

-- Workouts for Program 2
INSERT INTO Workout (id, workout_name, description, program_id)
VALUES
    (4, 'Cardio Intervals', 'High-intensity cardio workout', 2),
    (5, 'Full-Body Circuit', 'Full-body workout with circuit training', 2),
    (6, 'Weightlifting Session', 'Weightlifting and resistance training', 2);

-- Workouts for Program 3
INSERT INTO Workout (id, workout_name, description, program_id)
VALUES
    (7, 'Core Strengthening', 'Focus on core muscle strengthening', 3),
    (8, 'Cardio Blast', 'Cardio-intensive workout for fat burning', 3),
    (9, 'Functional Fitness', 'Functional exercises for overall fitness', 3);








-- Sample data for the WarmUp table
INSERT INTO WarmUp (id, name, instructions, workout_id)
VALUES
    (1, 'Warm-up Routine', 'A warm-up routine for cardio and flexibility.', 1),
    (2, 'Stretching', 'Stretching exercises to prepare for cardio.', 2),
    (3, 'Warm-up Routine 1', 'Begin with light stretching and warm-up exercises', 4),
    (4, 'Warm-up Routine 2', 'Start with dynamic stretching and warm-up', 7);

-- Sample data for the WarmUpExercise table, associating exercises with warm-up routines
INSERT INTO WarmUpExercise (exercise_order, reps, sets, tempo, rest, instructions, warm_up_id, exercise_id)
VALUES
    -- Workout id: 1
    (1, 10, 2, '2:2:2', 30, 'Start with 10 reps of jumping jacks.', 1,1),
    (2, 8, 2, '2:2:2', 15, 'Stretch your legs with lunges.', 1, 2),
    (3, 10, 2, 'Normal', 30, 'Jumping jacks', 1, 3),
    -- Workout id: 2
    (1, 10, 2, 'Normal', 30, 'High knees', 2, 4),
    (2, 10, 2, 'Normal', 30, 'Bodyweight squats', 2, 5),
    (3, 12, 2, 'Normal', 30, 'Arm circles', 2, 6),
    -- Workout id: 4
    (1, 12, 2, 'Normal', 30, 'Leg swings', 3, 9),
    (2, 12, 2, 'Normal', 30, 'Jump rope', 3, 10),
    (3, 10, 2, '2:2:2', 30, 'Start with 10 reps of jumping jacks.', 3, 11),
    -- Workout id: 7
    (1, 8, 2, '2:2:2', 15, 'Stretch your legs with lunges.', 4, 17),
    (2, 10, 2, 'Normal', 30, 'Bodyweight squats', 4, 18),
    (3, 10, 2, 'Normal', 30, 'Jumping jacks', 4, 19);


-- Sample data for the Supersets table, creating a superset with two exercises
INSERT INTO Supersets (id, name, instructions, workout_id)
VALUES
    -- Workout id: 1
    (1, 'Strength Superset 1', 'Combine push-ups and bicep curls for a strength superset.', 1),
    -- Workout id: 4
    (2, 'Upper Body Superset', 'Alternating sets for upper body', 4),
    -- Workout id: 7
    (3, 'Leg Superset', 'Alternating sets for leg strength', 7);


-- Sample data for the SupersetExercise table, associating exercises with warm-up routines
INSERT INTO SupersetExercises (exercise_order, reps, sets, tempo, rest, instructions, superset_id, exercise_id)
VALUES
    (4, 10, 2, '2:2:2', 30, 'Start with 10 reps of jumping jacks.', 1, 8),
    (5, 8, 2, '2:2:2', 15, 'Stretch your legs with lunges.', 1, 7),
    (4, 10, 2, 'Normal', 30, 'Jumping jacks', 2, 13),
    (5, 10, 2, 'Normal', 30, 'High knees', 2, 16),
    (4, 10, 2, 'Normal', 30, 'Bodyweight squats', 3, 20),
    (5, 10, 2, 'Normal', 30, 'Jumping jacks', 3, 19);


-- Sample data for the WorkoutExercise table, associating exercises with workouts
INSERT INTO WorkoutExercise (id, exercise_order, reps, sets, tempo, rest, instructions, exercise_id, workout_id)
VALUES
    -- Workout id: 1
    (1, 6, 10, 3, '2:2:2', 60, 'Do 3 sets of 12 reps with 60 seconds rest.', 2, 1),
    -- Workout id: 2
    (2, 4, 10, 3, '2:2:2', 45, 'Lunges for leg strength.', 4, 2),
    -- Workout id: 4
    (3, 6, 10, 3, '2:2:2', 60, 'Do 3 sets of 12 reps with 60 seconds rest.', 12, 4),
    -- Workout id: 7
    (4, 6, 10, 3, '2:2:2', 45, 'Lunges for leg strength.', 18, 7);


-- Sample data for the Circuits table
INSERT INTO Circuits (id, name, instructions, workout_id)
VALUES
    -- Workout id: 1
    (1, 'Cardio Circuit', 'A circuit of cardio exercises.', 1),
    -- Workout id: 2
    (2, 'Full-Body Circuit', 'Complete all exercises in sequence', 2),
    -- Workout id: 4
    (3, 'Core Circuit', 'Complete core exercises in circuit', 4),
    -- Workout id:7
    (4, 'Full-Body Circuit', 'Complete all exercises in sequence', 7);

-- Sample data for the CircuitExercises table, associating exercises with circuits
INSERT INTO CircuitExercises (exercise_order, reps, sets, tempo, rest, instructions, circuit_id, exercise_id)
VALUES
    -- Workout id: 1
    (7, 15, 3, '2:2:2', 30, 'Start with 15 jumping jacks.', 1, 7),
    (8, 10, 3, '2:2:2', 15, 'Run in place for 10 minutes.', 1, 4),
    (9, 15, 3, 'Normal', 60, 'Push-ups', 1, 8),
    -- Workout id: 2
    (5, 15, 3, 'Normal', 60, 'Squats', 2, 1),
    (6, 15, 3, 'Normal', 60, 'Planks', 2, 3),
    (7, 15, 3, 'Normal', 60, 'Russian twists', 2, 2),
    -- Workout id: 4
    (7, 15, 3, 'Normal', 60, 'Leg raises', 3, 12),
    (8, 15, 3, 'Normal', 60, 'Planks', 3, 15),
    (9, 15, 3, 'Normal', 60, 'Push-ups', 3, 9),
    -- Workout id: 7
    (7, 15, 3, 'Normal', 60, 'Squats', 4, 18),
    (8, 15, 3, 'Normal', 60, 'Russian twists', 4, 20),
    (9, 15, 3, 'Normal', 60, 'Planks', 4, 17);

-- Sample data for the Cardio table
INSERT INTO Cardio (id, name, instructions, workout_id)
VALUES
    -- Workout id: 1
    (1, 'Cardio Workout 1', 'A cardio workout for endurance.', 1),
    -- Workout id: 2
    (2, 'Cardio Blast', 'High-intensity cardio session', 2),
    -- Workout id: 4
    (3, 'High-Intensity Cardio', 'Intense cardio and fat burning', 4),
    -- Workout id: 7
    (4, 'Cardio Session', 'Intense cardio and fat burning', 7);

-- Sample data for the CardioExercises table, associating exercises with cardio workouts
INSERT INTO CardioExercises (exercise_order, reps, sets, tempo, rest, instructions, cardio_id, exercise_id)
VALUES
    -- Workout id: 1
    (11, 20, 3, '2:2:2', 30, 'Jump rope for 20 minutes.', 1, 6),
    (12, 15, 3, '2:2:2', 15, 'Run on the treadmill for 15 minutes.', 1, 3),
    (13, 10, 3, 'Normal', 30, 'Jumping jacks', 1, 5),
    -- Workout id: 2
    (8, 12, 3, 'Normal', 30, 'Burpees', 2, 1),
    (9, 15, 3, 'Normal', 30, 'Mountain climbers', 2, 7),
    (10, 15, 3, 'Normal', 30, 'Sprint intervals', 2, 3),
    -- Workout id: 4
    (10, 15, 3, 'Normal', 30, 'Jumping jacks', 3, 13),
    (11, 15, 3, 'Normal', 30, 'Burpees', 3, 16),
    -- Workout id: 7
    (10, 15, 3, 'Normal', 30, 'Jumping jacks', 4, 20),
    (11, 15, 3, 'Normal', 30, 'Burpees', 4, 17),
    (12, 15, 3, 'Normal', 30, 'Mountain climbers', 4, 18);




-- Sample data for Client Submissions
INSERT INTO ClientSubmissions (id, notes, data_url, submission_date, coach_response, client_id, coach_id, exercise_id)
VALUES
    (1, 'Completed the workout as instructed', 'https://example.com/client-submission1', '2023-10-11 08:00:00', 'Great job!', 1, 1, 1),
    (2, 'Struggled with the last set of squats', 'https://example.com/client-submission2', '2023-10-12 09:15:00', 'Youre making progress!', 2, 1, 2),
    (3, 'Enjoyed the cardio session', 'https://example.com/client-submission3', '2023-10-13 10:30:00', 'Keep it up!', 3, 2, 10),
    (4, 'Feeling sore after the circuit', 'https://example.com/client-submission4', '2023-10-14 08:45:00', 'Rest and recover!', 4, 2, 11),
    (5, 'Completed the core workout with ease', 'https://example.com/client-submission5', '2023-10-15 07:30:00', 'Well done!', 8, 3, 17),
    (6, 'Improved speed on the cardio session', 'https://example.com/client-submission6', '2023-10-16 09:45:00', 'Impressive!', 9, 3, 18),
    (7, 'Working on flexibility during warm-up', 'https://example.com/client-submission7', '2023-10-17 11:00:00', 'Great focus!', 10, 3, 19);






-- Sample data for messages between coach and client



--Query to see ClientSubmissions