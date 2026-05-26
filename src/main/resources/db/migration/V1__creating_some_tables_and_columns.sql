CREATE TABLE physical_assessment(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    weight FLOAT,
    height FLOAT,
    body_fat_percentage FLOAT
);

CREATE TABLE users(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    assessment_id BIGINT UNIQUE,

    CONSTRAINT fk_user_assessment
        FOREIGN KEY (assessment_id)
        REFERENCES physical_assessment(id)
);

CREATE TABLE workouts(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,

    user_id BIGINT,

    CONSTRAINT fk_workout_user
    FOREIGN KEY (user_id)
    REFERENCES users(id)
    ON DELETE CASCADE
);

CREATE TABLE exercises(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE workouts_and_exercises(
    workout_id BIGINT NOT NULL,
    exercise_id BIGINT NOT NULL,

    PRIMARY KEY(workout_id, exercise_id),

    CONSTRAINT fk_wae_workout
    FOREIGN KEY (workout_id)
        REFERENCES workouts(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_wae_exercise
        FOREIGN KEY (exercise_id)
        REFERENCES exercises(id)
        ON DELETE CASCADE
);