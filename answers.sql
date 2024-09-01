-- Creating Database Hospital_db
CREATE DATABASE hospital_db;
USE hospital_db;

-- Creating table Patients 

CREATE TABLE patients (patients_id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 date_of_birth DATE NOT NULL,
 gender VARCHAR(10),
 language VARCHAR(20) NOT NULL
);

-- Creating Table Providers

CREATE TABLE providers(provider_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
provider_speciality VARCHAR(50) NOT NULL,
email_address VARCHAR(50),
phone_number VARCHAR(20),
date_joined DATE NOT NULL
);

-- Creating Table Visits

CREATE TABLE Visits(visit_id INT PRIMARY KEY AUTO_INCREMENT,
patients_id INT,
FOREIGN KEY (patients_id) REFERENCES patients(patients_id),
providers_id INT,
FOREIGN KEY (providers_id) REFERENCES providers(provider_id),
date_of_visit DATE NOT NULL,
date_scheduled DATE NOT NULL,
visit_department_id VARCHAR(50) NOT NULL,
visit_type VARCHAR(50) NOT NULL,
blood_pressure_systollic INT,
blood_pressure_diastollic DECIMAL,
pulse DECIMAL, 
visit_status VARCHAR(20)
);

-- Creating Table ed_visits

CREATE TABLE ed_visits (ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
visit_id INT,
FOREIGN KEY(visit_id)REFERENCES visits(visit_id),
patients_id INT,
FOREIGN KEY(patients_id)REFERENCES patients(patients_id),
Acuity INT NOT NULL,
reason_for_visit VARCHAR(50) NOT NULL,
disposition VARCHAR(50) NOT NULL
);

-- Creating Tables Admissions

CREATE TABLE admissions(admissions_id INT PRIMARY KEY AUTO_INCREMENT,
patients_id INT,
FOREIGN KEY(patients_id)REFERENCES patients(patients_id),
admission_date DATE NOT NULL,
discharge_date DATE NOT NULL,
discharge_disposition VARCHAR(50) NOT NULL,
service VARCHAR(50) NOT NULL,
primary_diagnosis VARCHAR(255) NOT NULL
);

--Creating Tables Discharges

CREATE TABLE discharges(discharges_id INT PRIMARY KEY AUTO_INCREMENT,
admissions_id INT,
FOREIGN KEY(admissions_id) REFERENCES admissions(admissions_id),
patients_id INT,
FOREIGN KEY(patients_id)REFERENCES patients(patients_id),
discharge_date DATE NOT NULL,
discharge_disposition VARCHAR(50) NOT NULL
);








