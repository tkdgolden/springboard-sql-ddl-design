-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE medical_centers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL
);

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
    suite_number INT,
    specialty TEXT,
    hire_date DATE NOT NULL,
    medical_center_id INT NOT NULL REFERENCES medical_centers ON DELETE CASCADE
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    address TEXT NOT NULL,
    emergency_contact TEXT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    symptoms TEXT NOT NULL
);

CREATE TABLE doctor_client_list
(
  doctor_id INT NOT NULL REFERENCES doctors ON DELETE CASCADE,
  patient_id INT NOT NULL REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE patient_diagnoses
(
  disease_id INT NOT NULL REFERENCES diseases ON DELETE CASCADE,
  patient_id INT NOT NULL REFERENCES patients ON DELETE CASCADE,
  diagnosis_date DATE NOT NULL
);