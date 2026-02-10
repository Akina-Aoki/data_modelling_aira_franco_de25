# Repository Structure

This document provides a complete tree structure of the OLTP Data Modelling repository with descriptions of each section.

## Tree Structure

```
data_modelling_aira_franco_de25/
├── 00_intro/
│   └── README.md
├── 02_database_types/
│   └── README.md
├── 03_erd_conceptual_model/
│   └── README.md
├── 04_logical_physical/
│   ├── README.md
│   ├── online_lecture/
│   │   └── ezecream_physical_model.dbml
│   └── teams/
│       └── Book_physical_model.sql
├── 05_setup_docker/
│   ├── README.md
│   ├── app.py
│   ├── docker-compose.yaml
│   ├── dockerfile
│   └── requirements.txt
├── 05a_docker_image/
│   ├── README.md
│   ├── ages.png
│   ├── app.py
│   ├── docker-compose.yaml
│   ├── dockerfile
│   └── requirements.txt
├── 05b_docker_compose/
│   ├── app.py
│   ├── docker-compose.yml
│   ├── dockerfile
│   ├── output/
│   │   └── ages.png
│   └── requirements.txt
├── 05c_postgresql_container/
│   ├── docker-compose.yml
│   ├── docker-yml.md
│   ├── env.md
│   ├── lecture_docs.md
│   └── sql/
│       ├── ddl_dml_test.sql
│       └── test.sql
├── 06_database_keys/
│   └── README.md
├── 08_windows_functions/
│   ├── README.md
│   ├── documentation.md
│   ├── data/
│   └── sql/
├── a_figlet/
│   ├── README.md
│   ├── app.py
│   └── dockerfile
├── assets/
│   └── exercise/
├── documents_container/
│   ├── connect_mongodb.py
│   ├── docker-compose.yaml
│   ├── documentation.md
│   ├── linkedin_profiles.json
│   └── query_data.ipynb
├── exercises/
│   ├── exercise_0_book/
│   │   └── exercise_0.md
│   ├── exercise_1_erd/
│   │   ├── exercise_1_book.md
│   │   ├── exercise_1_hospital.md
│   │   ├── exercise_1_keys.md
│   │   ├── exercise_1_sakila.md
│   │   └── theory.md
│   └── exercise_2_normalization/
│       └── theory.md
├── yrkco_container/
│   ├── docker-compose.yml
│   ├── dockerfile
│   ├── sql/
│   │   ├── ddl_dml.sql
│   │   └── dml_fail.sql
│   └── workflow.md
├── .gitignore
└── README.md
```

## Directory Descriptions

### Core Learning Modules

| Directory | Description |
|-----------|-------------|
| **00_intro/** | Introduction to Data Modelling with curated resources and references from Airbyte, AWS, and GeeksforGeeks about data modeling fundamentals and database redundancy problems. |
| **02_database_types/** | Comprehensive references on structured vs unstructured data, database types, RDBMS concepts, NoSQL databases, and relational models. Includes links to resources from GeeksforGeeks, MongoDB, IBM, and Wikipedia. |
| **03_erd_conceptual_model/** | Entity-Relationship Diagram (ERD) and conceptual modeling resources. Contains references to Wikipedia articles, GeeksforGeeks tutorials, Vertabelo blog posts on Crow's foot notation, and Neso Academy videos. |
| **04_logical_physical/** | Logical and physical data model implementations. Contains sample DBML files for physical modeling (ezecream model) and SQL scripts for book models developed during team exercises. |
| **06_database_keys/** | Database keys concepts including Primary Keys, Foreign Keys, Candidate Keys, Surrogate Keys, Alternate Keys, and Composite Primary Keys. Features comparison tables and links to educational videos and articles. |
| **08_windows_functions/** | Window functions in SQL covering core concepts, practical examples comparing window functions vs aggregate functions, with sample data and SQL scripts. Includes DuckDB and GeeksforGeeks documentation references. |

### Docker & Containerization

| Directory | Description |
|-----------|-------------|
| **05_setup_docker/** | Initial Docker setup guide for PostgreSQL including instructions for creating `.env` files, `docker-compose.yml` configuration, VSCode PostgreSQL extension setup, and useful psql commands. Contains a Python app with Dockerfile and requirements. |
| **05a_docker_image/** | Docker image creation tutorial with Python application example. Includes app.py, Dockerfile, docker-compose configuration, and generated output (ages.png visualization). |
| **05b_docker_compose/** | Docker Compose multi-container tutorial. Features Python application with Dockerfile, docker-compose configuration, and output directory with generated visualizations. |
| **05c_postgresql_container/** | PostgreSQL container setup with detailed documentation on docker-compose configuration, environment variables, and lecture notes. Includes SQL scripts for DDL/DML testing. |
| **documents_container/** | MongoDB document database container setup. Contains Python connection scripts, docker-compose configuration, sample LinkedIn profiles JSON data, and Jupyter notebook for querying data. |
| **yrkco_container/** | Custom container setup with PostgreSQL. Includes docker-compose configuration, Dockerfile, SQL scripts for DDL/DML operations (including intentional failure examples), and workflow documentation. |

### Practice & Examples

| Directory | Description |
|-----------|-------------|
| **exercises/** | Collection of practical exercises organized by topic:<br>• **exercise_0_book/** - Introductory book modeling exercise<br>• **exercise_1_erd/** - ERD exercises covering books, hospitals, Sakila database, keys theory, and general ERD theory<br>• **exercise_2_normalization/** - Database normalization theory and exercises |
| **assets/exercise/** | Supporting assets and images for exercises. |
| **a_figlet/** | Fun Docker exercise using Figlet ASCII art generator. Contains Python app and Dockerfile for containerized ASCII text art generation. |

### Root Files

| File | Description |
|------|-------------|
| **README.md** | Main repository documentation describing the Data Modelling Course Repository for the Data Engineering Program. |
| **.gitignore** | Git ignore file specifying which files and directories should not be tracked by version control. |

## Summary

This repository is organized into three main sections:

1. **Theory & Concepts** (00-08): Progressive learning modules covering data modeling fundamentals, database types, ERD, logical/physical models, database keys, and SQL window functions.

2. **Docker & Infrastructure** (05_setup_docker, 05a-05c, containers): Hands-on containerization tutorials covering Docker basics, images, compose, PostgreSQL setup, and different database implementations (PostgreSQL, MongoDB).

3. **Practice** (exercises/): Structured exercises for applying learned concepts in data modeling, ERD creation, and normalization.

The repository follows a numbered naming convention for core modules (00, 02-08) indicating the progression of topics, making it easy to follow the learning path sequentially.
