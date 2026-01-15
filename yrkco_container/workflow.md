# Workflow of Docker for lab

## 1. Develop scripts to create a `Docker Image`
- Scripts: `Dockerfile`, `docker-compose.yml`
- These scripts can be used to create a Docker Image via the Docker program
- `Docker Image` can be shared to spin up a container in other laptops or servers in cloud.
- Create the `.env`, `dockerfile`, `docker-compose.yml`

##  Spin up a mini computer
- A `Docker Image` can spin up a mini computer
- `Docker Container` which is the one that is actually running and computing

# Yrkco Lab

## Step 1: Theoretical Part
- Understand how the business is operating
- Create the Data Models:
    - Create the Conceptual Data Model
    - Create the Logical Data Model 
        - requires 3NF & composite entities
    - Create the Physical Model

## Step 2: Implementation (from blueprint to concrete database)
- Choose the server (computer)
    - * For this lab, instead of installing PostgreSQL in the computer, spin up a docker container in the computer
    - Use the docker commands and PSQL
- Install the DB Program PostgreSQL
- Create the DBs (yrko_db)
- Create schema (school_info)
- tables (student, course, program) * the tables I have created
    - include keys, column constraints, etc.

## Step 3: Validation Part
- Insert values to test validity and show to the business to see that the database works as expected
- Validate a subset of tables
- SHow that in a certain table
    - INSERT OPERATION to check if it works that the data fulfills all column constraints
    - INSERT OPERATION fails if the data do not fulfill all column constraints

for the validation of implementation (task 1), try INSERT OPERATION on 3 tables, each INSERT should have at least 3 rows. You should show successful and failing INSERTS
for the same part, try two JOIN OPERATION to show that tables can be joined to show meaningful data.

## Terminal Workflow
- `docker ps` check running containers
- `docker compose down -v` Stop running all containers including the volume
    - if it says `no configuration file provided: not found`, just cd in the correct folder path
    - make sure other containers are stopped or deleted in docker desktop
- `docker compose up -d` to start spinning up a container

### Start interacting with the computer / docker container
- can run bash language in the docker container
- `docker exec -it postgres bash` Open the container called `postgres` and interactively in bash language
    - `root@881f9423c280:/# ` It will produce `root` as root foler and the container id `881f9423c280`
- `ls` list the several folders from the root folder.
- try checking the list of sql folder `cd sql` and check the `ls`. `cd ..` to go back
- try checking the ls of var folder `cd var` and check the `ls`

### Connect to a database using a username
- Bash cannot be used here. Use psql commands.
- `\q` to quit and back to the container
- `psql -U postgres -d yrkco_db` to open the database + name of the database

### SQL files
- SQL files should be already done at this stage. Have created the tables and populated with data

### Start interacting with the sql tables in the database
- `\dt` to list out the tables

- `\i sql/ddl.sql` to open that table
    - `\i` means to start querying in a specifil table
    - `sql/ddl.sql` path

- 