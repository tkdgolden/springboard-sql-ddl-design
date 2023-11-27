-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferred_region_id INT REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  text TEXT NOT NULL,
  user_id INT REFERENCES users ON DELETE SET NULL,
  region_id INT REFERENCES regions ON DELETE SET NULL,
  location TEXT, 
  category_id INT REFERENCES categories ON DELETE CASCADE
);