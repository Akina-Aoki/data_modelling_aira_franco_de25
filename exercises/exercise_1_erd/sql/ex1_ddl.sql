-- Create Core Tables
CREATE TABLE Hospital (
    hospital_id PRIMARY KEY,
    hospital_name STRING NOT NULL,
    address STRING
);

CREATE TABLE Department (
    department_id PRIMARY KEY,
    department_name STRING NOT NULL
);

CREATE TABLE Doctor (
    doctor_id PRIMARY KEY,
    doctor_name STRING NOT NULL
);

-- Create Junction Tables with Constraints
CREATE TABLE HospitalDepartment (
    hd_id PRIMARY KEY,
    hospital_id INTEGER REFERENCES Hospital(hospital_id),
    department_id INTEGER REFERENCES Department(department_id)
);

CREATE TABLE HospitalDoctor (
    hdoc_id PRIMARY KEY,
    hospital_id INTEGER REFERENCES Hospital(hospital_id),
    doctor_id INTEGER REFERENCES Doctor(doctor_id)
);

CREATE TABLE DepartmentDoctor (
    ddoc_id PRIMARY KEY,
    doctor_id INTEGER REFERENCES Doctor(doctor_id),
    department_id INTEGER REFERENCES Department(department_id)
);

-- Insert Initial Data
INSERT INTO Hospital (hospital_name, address) VALUES ('Sjukhusstock', 'Drottninggatan 3, Stockholm');
INSERT INTO Department (department_name) VALUES ('Kardiologi'), ('Neurologi');
INSERT INTO Doctor (doctor_name) VALUES ('Dr. Abra Abrahamson'), ('Dr. Erika Eriksson'), ('Dr. Sven Svensson');