## 0. Hospital example
The json data below represent data of three table: Hospital, Department and Doctor. 

```json
{
  "hospital": "Sjukhusstock",
  "address": "Drottninggatan 3, Stockholm",
  "departments": [
    {
      "name": "Kardiologi",
      "doctors": [
        { "id": 1, "name": "Dr. Abra Abrahamson" },
        { "id": 2, "name": "Dr. Erika Eriksson" }
      ]
    },
    {
      "name": "Neurologi",
      "doctors": [{ "id": 3, "name": "Dr. Sven Svensson" }]
    }
  ]
}
```

### a) Can you draft three tables and covert these json data into rows of respective tables. 
![Hospital Example Tables](../assets/exercise/ex_erd11.png)


### b) This is the conceptual data model after we've added the composite entities to take care of many-to-many relationships. We will build the logical and physical models upon it. 

<img src="https://github.com/kokchun/assets/blob/main/data_modeling/conceptual_hospital.png?raw=true" alt="hospital conceptual" width="500">

From the relationship cardinalities on the diagram, can you describe the business rules of this hospital system, for instance, are doctors allowed to work in multiple hospitals and departments?

| # | Relationship                    | Implemented Via    | Cardinality Implied | Business Rule                                                                                  |
| - | ------------------------------- | ------------------ | ------------------- | ---------------------------------------------------------------------------------------------- |
| 1 | Hospital ↔ Department           | HospitalDepartment | Many-to-Many        | A hospital **can have many departments**, and a department **can exist in multiple hospitals** |
| 2 | Hospital ↔ Doctor               | HospitalDoctor     | Many-to-Many        | A hospital **can employ many doctors**, and a doctor **can work at multiple hospitals**        |
| 3 | Department ↔ Doctor             | DepartmentDoctor   | Many-to-Many        | A department **can have many doctors**, and a doctor **can work in multiple departments**      |
| 4 | HospitalDepartment ↔ Hospital   | FK constraint      | Many-to-One         | Each hospital–department association **must reference exactly one hospital**                   |
| 5 | HospitalDepartment ↔ Department | FK constraint      | Many-to-One         | Each hospital–department association **must reference exactly one department**                 |
| 6 | HospitalDoctor ↔ Hospital       | FK constraint      | Many-to-One         | Each hospital–doctor association **must reference exactly one hospital**                       |
| 7 | HospitalDoctor ↔ Doctor         | FK constraint      | Many-to-One         | Each hospital–doctor association **must reference exactly one doctor**                         |
| 8 | DepartmentDoctor ↔ Department   | FK constraint      | Many-to-One         | Each department–doctor association **must reference exactly one department**                   |
| 9 | DepartmentDoctor ↔ Doctor       | FK constraint      | Many-to-One         | Each department–doctor association **must reference exactly one doctor**                       |


### c) Create a logical data model using lucidcharts
### d) Identify different keys on the various entities
![Hospital Logical Model](../assets/exercise/ex_erd12.png)

### e) Identify child entities and parent entities. What makes them into parent/child relationships?

| # | Parent Entity | Child Entity       | Relationship Implemented Via | Why This Is a Parent–Child Relationship            |
| - | ------------- | ------------------ | ---------------------------- | -------------------------------------------------- |
| 1 | Hospital      | HospitalDepartment | `hospital_id` (FK)           | HospitalDepartment cannot exist without a Hospital |
| 2 | Department    | HospitalDepartment | `department_id` (FK)         | HospitalDepartment depends on a Department         |
| 3 | Hospital      | HospitalDoctor     | `hospital_id` (FK)           | HospitalDoctor rows reference a valid Hospital     |
| 4 | Doctor        | HospitalDoctor     | `doctor_id` (FK)             | HospitalDoctor cannot exist without a Doctor       |
| 5 | Department    | DepartmentDoctor   | `department_id` (FK)         | DepartmentDoctor depends on a Department           |
| 6 | Doctor        | DepartmentDoctor   | `doctor_id` (FK)             | DepartmentDoctor cannot exist without a Doctor     |


### f) Create a physical data model using dbdiagram
* See ex1_hospital.dbml file.
![Hospital Physical Model](../assets/exercise/ex_erd13.png)

### g) Create a few tables manually, insert given data plus some more, and try to manually link foreign keys to primary keys. Can you satisfy that a doctor can work at several departments and several hospitals?
```sql
-- Inserting Hospitals
INSERT INTO Hospital VALUES (1, 'St. Jude Medical', '123 Care Ave');
INSERT INTO Hospital VALUES (2, 'City General', '456 Metro Blvd');

-- Inserting Departments
INSERT INTO Department VALUES (101, 'Cardiology');
INSERT INTO Department VALUES (102, 'Neurology');
INSERT INTO Department VALUES (103, 'Pediatrics');

-- Inserting Doctors
INSERT INTO Doctor VALUES (501, 'Dr. Alice Smith');
INSERT INTO Doctor VALUES (502, 'Dr. Bob Jones');
INSERT INTO Doctor VALUES (503, 'Dr. Charlie Day');

-- Linking Hospitals to Departments
INSERT INTO HospitalDepartment VALUES (1, 1, 101); -- St. Jude has Cardiology
INSERT INTO HospitalDepartment VALUES (2, 1, 103); -- St. Jude has Pediatrics
INSERT INTO HospitalDepartment VALUES (3, 2, 101); -- City General also has Cardiology

-- Linking Doctors to Hospitals
INSERT INTO HospitalDoctor VALUES (1, 1, 501); -- Dr. Smith at St. Jude
INSERT INTO HospitalDoctor VALUES (2, 1, 502); -- Dr. Jones at St. Jude
INSERT INTO HospitalDoctor VALUES (3, 2, 503); -- Dr. Day at City General

-- Linking Doctors to Departments
INSERT INTO DepartmentDoctor VALUES (1, 501, 101); -- Dr. Smith is in Cardiology
INSERT INTO DepartmentDoctor VALUES (2, 502, 103); -- Dr. Jones is in Pediatrics
```


## 2. Implement hospital example in postgres
SEE `exercises/sql/ex1_hospital_dbdiagram.sql` for the ddl

### a) Now implement your physical model from e) and add the data below. Make sure that you have correctly specified different column constraints.

To implement the hospital system in PostgreSQL and test its referential integrity, set up the schema with strict constraints (Foreign Keys, Primary Keys, and NOT NULL).

```SQL
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
```

### b) Now lets try to add a row in HospitalDepartment with a hospital_id that doesn't exist in the hospital table. What happens here and why?
#### Violating Hospital Foreign Key
- Action: `INSERT INTO HospitalDepartment (hospital_id, department_id) VALUES (999, 1);`
- Result: `Error` 
- Why: PostgreSQL checks the Foreign Key constraint. Since `hospital_id 999` does not exist in the Hospital table, the database rejects the row to maintain **Referential Integrity**.

### c) Do similar to b) but try adding a department_id to HospitalDepartment that doesn't exist in the Department.
#### Violating Department Foreign Key
- Action: `INSERT INTO HospitalDepartment (hospital_id, department_id) VALUES (1, 888);`
- Result: `Error`.
- Why: Similar to C, the Department table does not contain `ID 888`. The junction table is a "child" and cannot point to a "parent" that isn't there.

### d) Now try to do normal delete a record in Hospital that the HospitalDepartment refers to. What happens?
#### Normal Delete (Restrict)
- Action: `DELETE FROM Hospital WHERE hospital_id = 1;`
- Result: `Error`.
- Why: By default, SQL prevents deleting a parent record if child records (in HospitalDepartment or HospitalDoctor) still point to it. This prevents "orphan" records.

### e) Now use delete on cascade and check what happens.
#### `ON DELETE CASCADE`
- When you define a relationship with ON DELETE CASCADE, you are telling PostgreSQL: "If the parent dies, take the children with it."
- Action: Modify the constraint
```sql
ALTER TABLE HospitalDepartment 
DROP CONSTRAINT hospitaldepartment_hospital_id_fkey,
ADD CONSTRAINT hospitaldepartment_hospital_id_fkey 
FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE;

DELETE FROM Hospital WHERE hospital_id = 1;
```
- Result: The Hospital is deleted, AND all rows in `HospitalDepartment` associated with `Hospital 1` are automatically deleted.

- Detailed explanation:
```sql
-- First, remove the standard constraints
ALTER TABLE HospitalDepartment DROP CONSTRAINT hospitaldepartment_hospital_id_fkey;
ALTER TABLE HospitalDoctor DROP CONSTRAINT hospitaldoctor_hospital_id_fkey;

-- Second, add them back with CASCADE enabled
ALTER TABLE HospitalDepartment 
ADD CONSTRAINT hospitaldepartment_hospital_id_fkey 
FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE;

ALTER TABLE HospitalDoctor 
ADD CONSTRAINT hospitaldoctor_hospital_id_fkey 
FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id) ON DELETE CASCADE;
```

- Then run the `DELETE` command
```sql
DELETE FROM Hospital WHERE hospital_id = 1;
```

- PostgreSQL identifies that Hospital 1 is being deleted.
- It looks at all tables where `hospital_id` is a Foreign Key with a `CASCADE` rule.
- It finds any rows in HospitalDoctor linked to Hospital 1.
- It deletes all of them instantly in a single transaction.
- The Result: If you then run `SELECT * FROM HospitalDepartment;`, the table will be empty (or missing those specific rows). There are no "orphan" rows left behind pointing to a hospital that no longer exists.

### f) Try to violate a column constraint, what did you try and what result did you get?
#### Violating Columns Constraints
- `INSERT INTO Hospital (hospital_name, address) VALUES (NULL, 'Test Road');`
- `Error`: defined `hospital_name` as NOT NULL. The database acts as a gatekeeper, ensuring that required data is never missing.