-- from the terminal run:
-- psql < soccer.sql

DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season_team_enrollment
(
    team_id INT REFERENCES teams ON DELETE CASCADE,
    season_id INT REFERENCES seasons ON DELETE CASCADE,
    season_ranking INT
);

CREATE TABLE team_rosters
(
    team_id INT REFERENCES teams ON DELETE CASCADE,
    player_id INT REFERENCES players ON DELETE CASCADE
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team_1_id INT REFERENCES teams ON DELETE SET NULL,
    team_2_id INT REFERENCES teams ON DELETE SET NULL,
    date DATE NOT NULL,
    winner_id INT REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE goals
(
    game_id INT REFERENCES matches ON DELETE SET NULL,
    player_id INT REFERENCES players ON DELETE SET NULL
);

CREATE TABLE referee_game_assignment
(
    game_id INT REFERENCES matches ON DELETE CASCADE,
    referee_id INT REFERENCES referees ON DELETE SET NULL
);