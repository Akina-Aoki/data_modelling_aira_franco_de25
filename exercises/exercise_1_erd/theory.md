## Theory
| Question | Brief Answer |
|--------|--------------|
| a) What are common RDBMS constraints? | **NOT NULL** enforces mandatory values. **UNIQUE** prevents duplicate values. **CHECK** enforces conditional rules. **DEFAULT** assigns a fallback value. **PRIMARY KEY** uniquely identifies a row. **FOREIGN KEY** enforces relationships between tables. |
| b) What does physical modeling have that logical modeling does not? | Physical modeling includes DB-specific details such as data types, indexes, storage structures, performance optimizations, and implementation constraints. |
| c) How do you ensure referential integrity and why is it desirable? | Referential integrity is ensured using **FOREIGN KEY constraints**. It prevents orphan records, preserves data consistency, and enforces valid relationships across tables. |
| d) How do cardinality relationships affect implementation? | Cardinality determines table structure: **1-to-many** uses foreign keys, **many-to-many** requires bridge tables, and **1-to-1** may be merged or constrained depending on design. |
| e) What does domain constraint mean? | A domain constraint restricts the allowed values for a column based on data type, range, format, or predefined rules. |
| f) What is a composite key and when do you use it? | A composite key is a primary key made of multiple columns. It is used when no single column uniquely identifies a row (common in bridge tables). |
| g) What is DBML used for? | DBML is used to define database schemas in a readable text format and generate ER diagrams and SQL code. |


## Glossary
| Term | Meaning |
|------|--------|
| composite entity | An entity that resolves a many-to-many relationship, typically implemented as a bridge table with foreign keys. |
| domain | The set of valid values that an attribute is allowed to have. |
| constraint | A rule enforced by the database to maintain data accuracy and consistency. |
| domain constraint | A rule that restricts the values of an attribute based on type, range, format, or allowed values. |
| entity constraint | A rule that applies at the row level, ensuring each entity instance is uniquely identifiable (e.g., primary key). |
| primary key | A column or set of columns that uniquely identifies each row in a table and cannot be NULL. |
| foreign key | A column that references a primary key in another table to enforce relationships. |
| bridge table | A table used to implement a many-to-many relationship by storing foreign keys from related tables. |
| information engineering | A data modeling methodology focused on structured analysis and clear entity-relationship representation. |
| attributes | Properties or characteristics that describe an entity. |
| data integrity | The overall accuracy, consistency, and reliability of data in a database. |
| entity integrity | Ensures that each table has a primary key and that the key uniquely identifies each row. |
| referential integrity | Ensures that foreign key values correspond to existing primary key values in related tables. |
| relation instance | The actual data (rows) contained in a table at a specific point in time. |
| child entity | An entity that contains a foreign key referencing another entity. |
| parent entity | An entity whose primary key is referenced by a foreign key in another entity. |
| natural key | A key formed from real-world, meaningful data (e.g., ISBN, email). |
| surrogate key | A system-generated key with no business meaning, often an auto-increment ID. |
| candidate key | Any attribute or combination of attributes that can uniquely identify a row. |
| alternate key | A candidate key that was not selected as the primary key. |
