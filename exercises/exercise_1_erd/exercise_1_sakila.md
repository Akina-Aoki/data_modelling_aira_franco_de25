## 4. Sakila exercise

In SQL course we have queried the sakila database a lot to learn various concepts such as joining, union, filtering. Now lets [download it from kaggle](https://www.kaggle.com/datasets/atanaskanev/sqlite-sakila-sample-database?resource=download) and try to understand its data model.

Study the ERD and try to answer the following questions 
![Sakila ERD](../assets/Sakila_ERD.png)

### a) Is this a conceptual, logical or physical ERD, motivate?
- Logical Data Model: 

| Component            | How it appears in this Diagram                                                                 |
|----------------------|--------------------------------------------------------------------------------------------------|
| Entities (Tables)    | Shown as orange-headed boxes (e.g., `film`, `actor`, `customer`).                                |
| Attributes (Columns) | Listed below the table name (e.g., `title`, `first_name`, `email`).                              |
| Primary Keys (PK)    | Marked with `(PK)` next to the column name (e.g., `actor_id`, `film_id`).                        |
| Foreign Keys (FK)    | Marked with `(FK)` to indicate table relationships (e.g., `store_id` in the `customer` table). |
| Relationships        | Represented by lines connecting related tables (e.g., `city` connects to `address`).           |
| Cardinality          | Shown using Crow’s Foot notation (symbols at the ends of relationship lines).                   |

### b) How many entities are in the database?
15

### c) Which are the composite entities?

| Composite Entity | Parent Entities        | Relationship Type | Foreign Keys Used                    | Purpose in the Data Model                                  |
|------------------|------------------------|-------------------|--------------------------------------|------------------------------------------------------------|
| film_actor       | film ↔ actor           | Many-to-Many      | film_id (FK), actor_id (FK)           | Links films with actors appearing in them                  |
| film_category    | film ↔ category        | Many-to-Many      | film_id (FK), category_id (FK)        | Links films with their associated categories               |

- `film_actor`
- Purpose: resolves the many-to-many relationship between films and actors

- `film_category`
- Purpose: resolves the many-to-many relationship between films and categories
- The combination of these keys uniquely identifies each record

| Reason                     | Explanation                                                                                                                     |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Resolves M:N Relationships | Relational databases cannot directly implement many-to-many relationships; composite entities decompose them into two one-to-many relationships. |
| Dependent Identity         | These entities do not represent standalone business objects; they exist only because their parent entities (e.g., `film` and `actor`) exist.     |
| Derived Keys               | Their identity is derived from a composite primary key formed by the foreign keys of the parent tables.                         |
| Data Enforcement           | They enforce the business rules governing how the two parent entities relate and interact within the data model.               |


### d) Try to find suitable relationship labels between entities

| Entity A   | Relationship Label     | Entity B     | How to Read It Verbally                                           |
|------------|------------------------|--------------|-------------------------------------------------------------------|
| country    | contains               | city         | A country contains one or many cities                              |
| city       | contains               | address      | A city contains one or many addresses                              |
| address    | is used by             | customer     | An address is used by one or many customers                        |
| address    | is assigned to         | staff        | An address is assigned to one or many staff members                |
| address    | is assigned to         | store        | An address is assigned to exactly one store                        |
| store      | serves                 | customer     | A store serves many customers                                      |
| store      | employs                | staff        | A store employs many staff members                                 |
| store      | stocks                 | inventory    | A store stocks many inventory items                                |
| film       | has copies in          | inventory    | A film has many copies in inventory                                |
| inventory  | is rented through      | rental       | An inventory item is rented through many rentals                   |
| customer   | makes                  | rental       | A customer makes many rentals                                      |
| staff      | processes              | rental       | A staff member processes many rentals                              |
| rental     | generates              | payment      | A rental generates one or many payments                            |
| customer   | makes                  | payment      | A customer makes many payments                                     |
| staff      | processes              | payment      | A staff member processes many payments                             |
| film       | features               | actor        | A film features one or many actors                                 |
| actor      | appears in             | film         | An actor appears in one or many films                               |
| film       | belongs to             | category     | A film belongs to one or many categories                           |
| category   | classifies             | film         | A category classifies one or many films                             |
| language   | is used by             | film         | A language is used by one or many films                             |
| staff      | manages                | store        | A staff member manages exactly one store                           |


### e) Try to write out some possible relationship statements between the entities.

| Relationship (Parent → Child) | Crow’s Foot Meaning                         | Cardinality (Parent → Child) | Cardinality (Child → Parent) | How to Read It in the Sakila ERD                                                                 |
|-------------------------------|---------------------------------------------|------------------------------|------------------------------|--------------------------------------------------------------------------------------------------|
| country → city                | One-to-many (mandatory)                     | 1 → Many                     | Many → 1                     | One country can have many cities; each city belongs to exactly one country                       |
| city → address                | One-to-many (mandatory)                     | 1 → Many                     | Many → 1                     | One city can have many addresses; each address must belong to one city                           |
| address → customer            | One-to-many (optional on customer side)     | 1 → Many                     | Many → 1                     | One address can be shared by multiple customers; each customer has exactly one address          |
| address → staff               | One-to-many                                 | 1 → Many                     | Many → 1                     | One address can be linked to many staff members; each staff member has one address               |
| address → store               | One-to-one (mandatory)                      | 1 → 1                        | 1 → 1                        | Each store has exactly one address, and each address maps to one store                           |
| store → customer              | One-to-many                                 | 1 → Many                     | Many → 1                     | One store serves many customers; each customer is assigned to one store                          |
| store → inventory             | One-to-many                                 | 1 → Many                     | Many → 1                     | One store holds many inventory items; each inventory item belongs to one store                  |
| film → inventory              | One-to-many                                 | 1 → Many                     | Many → 1                     | One film can exist in many inventory copies; each copy references one film                      |
| inventory → rental            | One-to-many (optional)                      | 1 → Many                     | Many → 1                     | One inventory item can be rented many times; each rental references one inventory item          |
| customer → rental             | One-to-many                                 | 1 → Many                     | Many → 1                     | One customer can have many rentals; each rental belongs to one customer                         |
| staff → rental                | One-to-many                                 | 1 → Many                     | Many → 1                     | One staff member can process many rentals; each rental is handled by one staff member           |
| rental → payment              | One-to-many                                 | 1 → Many                     | Many → 1                     | One rental can generate multiple payments; each payment is tied to one rental                  |
| customer → payment            | One-to-many                                 | 1 → Many                     | Many → 1                     | One customer can make many payments; each payment belongs to one customer                       |
| staff → payment               | One-to-many                                 | 1 → Many                     | Many → 1                     | One staff member can process many payments; each payment is handled by one staff member         |
| film → film_actor → actor     | Many-to-many (via junction table)           | Many ↔ Many                  | Many ↔ Many                  | A film can have many actors and an actor can appear in many films                               |
| film → film_category → category | Many-to-many (via junction table)         | Many ↔ Many                  | Many ↔ Many                  | A film can belong to many categories and a category can include many films                     |
| language → film               | One-to-many                                 | 1 → Many                     | Many → 1                     | One language can be used by many films; each film uses one language                             |
| store → staff                 | One-to-many                                 | 1 → Many                     | Many → 1                     | One store employs many staff members; each staff member works at one store                     |
| staff → store (manager)       | One-to-one (manager relationship)           | 1 → 1                       | 1 → 1                       | Each store has one manager; a manager manages one store                                        |

### f) Can you find if there is any errors/mistakes in this ERD? 
NONE