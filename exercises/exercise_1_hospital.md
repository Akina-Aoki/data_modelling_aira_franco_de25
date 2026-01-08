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

### Conceptual Data Model
<img src="https://github.com/kokchun/assets/blob/main/data_modeling/conceptual_hospital.png?raw=true" alt="hospital conceptual" width="500">
- 

a) Can you draft three tables and covert these json data into rows of respective tables. 

b) This is the conceptual data model after we've added the composite entities to take care of many-to-many relationships. We will build the logical and physical models upon it. 

<img src="https://github.com/kokchun/assets/blob/main/data_modeling/conceptual_hospital.png?raw=true" alt="hospital conceptual" width="500">

From the relationship cardinalities on the diagram, can you describe the business rules of this hospital system, for instance, are doctors allowed to work in multiple hospitals and departments?

c) Create a logical data model using lucidcharts

d) Identify different keys on the various entities

e) Identify child entities and parent entities. What makes them into parent/child relationships?

f) Create a physical data model using dbdiagram

g) Create a few tables manually, insert given data plus some more, and try to manually link foreign keys to primary keys. Can you satisfy that a doctor can work at several departments and several hospitals?


## 2. Implement hospital example in postgres

a) Now implement your physical model from e) and add the data below. Make sure that you have correctly specified different column constraints.

b) Now lets try to add a row in HospitalDepartment with a hospital_id that doesn't exist in the hospital table. What happens here and why?

c) Do similar to b) but try adding a department_id to HospitalDepartment that doesn't exist in the Department.

d) Now try to do normal delete a record in Hospital that the HospitalDepartment refers to. What happens?

e) Now use delete on cascade and check what happens.

f) Try to violate a column constraint, what did you try and what result did you get?
