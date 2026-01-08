CREATE TABLE "Hospital" (
  "hospital_id" integer PRIMARY KEY,
  "hospital_name" string,
  "address" string
);

CREATE TABLE "Department" (
  "department_id" integer PRIMARY KEY,
  "department_name" string
);

CREATE TABLE "Doctor" (
  "doctor_id" integer PRIMARY KEY,
  "doctor_name" string NOT NULL
);

CREATE TABLE "HospitalDepartment" (
  "hospital_department_id" integer PRIMARY KEY,
  "hospital_id" integer NOT NULL,
  "department_id" integer NOT NULL
);

CREATE TABLE "HospitalDoctor" (
  "hospital_doctor_id" integer PRIMARY KEY,
  "hospital_id" integer NOT NULL,
  "doctor_id" integer NOT NULL
);

CREATE TABLE "DepartmentDoctor" (
  "department_doctor_id" integer PRIMARY KEY,
  "department_id" integer NOT NULL,
  "doctor_id" integer NOT NULL
);

ALTER TABLE "HospitalDepartment" ADD FOREIGN KEY ("hospital_id") REFERENCES "Hospital" ("hospital_id");

ALTER TABLE "HospitalDepartment" ADD FOREIGN KEY ("department_id") REFERENCES "Department" ("department_id");

ALTER TABLE "HospitalDoctor" ADD FOREIGN KEY ("hospital_id") REFERENCES "Hospital" ("hospital_id");

ALTER TABLE "HospitalDoctor" ADD FOREIGN KEY ("doctor_id") REFERENCES "Doctor" ("doctor_id");

ALTER TABLE "DepartmentDoctor" ADD FOREIGN KEY ("department_id") REFERENCES "Department" ("department_id");

ALTER TABLE "DepartmentDoctor" ADD FOREIGN KEY ("doctor_id") REFERENCES "Doctor" ("doctor_id");
