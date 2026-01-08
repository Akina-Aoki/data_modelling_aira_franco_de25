# Exercise 1 - going in to logical and physical data modeling

These exercises are for you to learn fundamental concepts in data modeling. Many of them can be done with pen and paper, physical whiteboard or with an ERD software such as Lucidchart and dbdiagram. It is good practice to work analogue as an important part of data modeling is to align various stakeholders with a mix of technical and business knowledge. It is also advised to discuss with your peers as data modeling usually is not done in solitude.

## Reference materials (Other Github Repository to create logical and physical data models)
[Conceptual ERD](https://github.com/AIgineerAB/data_modeling_course/tree/main/03_erd_conceptual_model)
[Logical and Physical ERD](https://github.com/AIgineerAB/data_modeling_course/tree/main/04_erd_logical_physical_model)
[Database Keys](https://github.com/AIgineerAB/data_modeling_course/tree/main/06_database_keys)
[PostgreSQL Docs](https://www.postgresql.org/docs/current/)


## Class lecture: Book Library

Going back to the library exercise from [exercise0, task 0](https://github.com/AIgineerAB/data_modeling_course/blob/main/exercises/exercise0.md), we will build logical and physical data models. This is the conceptual data model after we've added the composite entities to take care of many-to-many relationships.


#### Create a logical data model using lucidcharts. Identify different keys on the various entities

![Book Excel Logical Model](../assets/exercise/ex_erd7.png)
![Book Logical Model](../assets/exercise/ex_erd9.png)

**Why These Entities Exist (Design Rationale)**
- Book is introduced to satisfy 3NF normalization, avoiding duplication of title/author across copies.
- BookCopy separates logical books from physical inventory.
- BorrowItem exists explicitly to break the M:N relationship between Borrow and BookCopy, enabling:
- Multiple books per borrow transaction
- Future extensibility (e.g., due_date, return_date, fines per item)


| From Entity | To Entity  | Cardinality | Business Meaning                                         |
| ----------- | ---------- | ----------- | -------------------------------------------------------- |
| Member      | Borrow     | 1 → N       | A member can have zero, one, or many borrow transactions |
| Borrow      | Member     | N → 1       | Each borrow belongs to exactly one member                |
| Borrow      | BorrowItem | 1 → N       | A borrow can contain one or many borrowed items          |
| BorrowItem  | Borrow     | N → 1       | Each borrowed item belongs to one borrow                 |
| BookCopy    | BorrowItem | 1 → N       | A book copy can appear in many borrow items over time    |
| BorrowItem  | BookCopy   | N → 1       | Each borrow item references exactly one book copy        |
| Book        | BookCopy   | 1 → N       | A book can have one or many physical copies              |


#### Identify child entities and parent entities. What makes them into parent/child relationships?
| Parent Entity | Child Entity | Relationship Basis |
|---------------|--------------|--------------------|
| Member        | Borrow       | Borrow cannot exist without a Member |
| Book          | Borrow       | Borrow cannot exist without a Book |

#### Create a physical data model using dbdiagram
![DBL of Book Borrow Member](../assets/exercise/ex_erd6.png)

#### Natural Keys and Surrogate Keys
![Book Model's Natural and Surrogate Keys](../assets/exercise/ex_erd10.png)
- A primary key is implemented using either a natural key or a surrogate key; the distinction is conceptual and depends on whether the key has real-world meaning or is system-generated.

| Entity     | Natural Key | Surrogate Key  | Why                                 |
| ---------- | ----------- | -------------- | ----------------------------------- |
| Book       | ISBN_nr     | —              | ISBN is globally unique and stable  |
| BookCopy   | —           | book_id        | Physical copies need artificial IDs |
| Member     | —           | member_id      | Real-world data is unstable         |
| Borrow     | —           | borrow_id      | System event, no natural identifier |
| BorrowItem | —           | borrow_item_id | Bridge table needs simple joins     |
