# Exercise 1 - going in to logical and physical data modeling

These exercises are for you to learn fundamental concepts in data modeling. Many of them can be done with pen and paper, physical whiteboard or with an ERD software such as Lucidchart and dbdiagram. It is good practice to work analogue as an important part of data modeling is to align various stakeholders with a mix of technical and business knowledge. It is also advised to discuss with your peers as data modeling usually is not done in solitude.

## Reference material
[Conceptual ERD](https://github.com/AIgineerAB/data_modeling_course/tree/main/03_erd_conceptual_model)
[Logical and Physical ERD](https://github.com/AIgineerAB/data_modeling_course/tree/main/04_erd_logical_physical_model)

## Extra: Book and Member example

Going back to the hospital exercise from [exercise0, task 0](https://github.com/AIgineerAB/data_modeling_course/blob/main/exercises/exercise0.md), we will build logical and physical data models. This is the conceptual data model after we've added the composite entities to take care of many-to-many relationships.


#### Create a logical data model using lucidcharts. Identify different keys on the various entities
| From Entity | To Entity | Cardinality | Business Meaning |
|------------|-----------|-------------|------------------|
| Member     | Borrow    | One-to-many | A member can have zero, one, or many borrow events |
| Book       | Borrow    | One-to-many | A book can have zero, one, or many borrow events over time |
| Borrow     | Member    | Many-to-one | Each borrow is linked to exactly one member |
| Borrow     | Book      | Many-to-one | Each borrow is linked to exactly one book |

![figure5](../assets/exercise/ex_erd5.png)

#### Identify child entities and parent entities. What makes them into parent/child relationships?
| Parent Entity | Child Entity | Relationship Basis |
|---------------|--------------|--------------------|
| Member        | Borrow       | Borrow cannot exist without a Member |
| Book          | Borrow       | Borrow cannot exist without a Book |

## 0. Hospital example

<img src="https://github.com/kokchun/assets/blob/main/data_modeling/conceptual_hospital.png?raw=true" alt="hospital conceptual" width="500">


#### Create a physical data model using dbdiagram
![DBL of Book Borrow Member](../assets/exercise/ex_erd6.png)

a) Create a logical data model using lucidcharts

b) Identify different keys on the various entities

c) Identify child entities and parent entities. What makes them into parent/child relationships?

d) Create a physical data model using dbdiagram

e) Create a few tables manually, insert given data plus some more, and try to manually link foreign keys to primary keys. Can you satisfy that a doctor can work at several departments and several hospitals?

