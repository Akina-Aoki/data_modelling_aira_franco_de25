# PostgreSQL Container Setup Lecture Explanation
## Goal of This Lecture

- The objective of this lab is to:
- Run PostgreSQL inside a Docker container
- Persist database data using Docker volumes
- Access PostgreSQL via the terminal
- Execute SQL scripts inside the container
- Verify table creation and data insertion
- This setup gives you an isolated, reproducible database environment without installing PostgreSQL directly on your machine.

## Architecture Overview
- Docker = runs PostgreSQL as a container
- `docker-compose.yml` = instructions for how PostgreSQL should run
- Volume = keeps database data even if the container stops
- `Port 5432` = allows your machine to talk to PostgreSQL
- psql = PostgreSQL command-line interface
- SQL script = creates tables and inserts data

## Step 1: Start the PostgreSQL Container
* After creating all the scripts and configuration files, run:
```bash
docker-compose up -d
```
- Reads docker-compose.yml
- Pulls the postgres:latest image (if missing)
- Creates:
    -A Docker network
    -A Docker volume for data persistence
- This command starts the PostgreSQL container in detached mode `-d`

### Expected Output
`postgres Pulled`
`Network created`
`Volume created`
`Container postgres started`

## Step 2: Verify the Container Is Running
- Lists all running containers
- Run:
```bash
docker ps
```

### What to look for:
This confirms PostgreSQL is alive and accepting connections. <br>
- Image: `postgres:latest`
- Status: `Up (healthy)`
- Ports: `5432 -> 5432`
- Name: `postgres`


## Step 3: Enter the PostgreSQL Container
Run: (the container name) -> `postgres`
```bash
docker exec -it postgres psql -U postgres
```

or 
```bash
docker exec -it postgres bash
```

### What This Does
- Opens an interactive shell inside the container
- You are now operating in the container’s Linux environment

### Confirmation
Should see a prompt like:
```bash
root@<container_id>:/#
```

## Step 4: Explore the Container (Useful Commands)
- Confirms the file system structure
```bash
ls
```

## Step 5: PostreSQL Login
- Logs in as the postgres user
- Connects to the database `myh_db`
- Opens the PostgreSQL interactive shell
```bash
psql -U postgres -d myh_db
```

### Confirmation
- Should see a prompt like:
```bash
myh_db=#
```

## Step 6: Run SQL Script to Create Tables and Insert Data
- Executes the SQL script located in `/sql/ddl_dml_test.sql`
```bash
\i sql/ddl_dml_test.sql
```

### What This Does
- Executes the SQL file inside PostgreSQL
- Runs:
`CREATE TABLE`
`INSERT INTO`


## Reset Table (If there was an error)
- Ensures a clean slate
- Prevents duplicate or partial schema states
```bash
DROP TABLE IF EXISTS test_table;
```

## Re-run the SQL Script after DROP

```bash
\i sql/ddl_dml_test.sql
```

## Step 7: Validate Table Creation and Data Insertion
- Confirms the table exists
```bash
SELECT * FROM test_table;
```

### Expected Output
Should see:
```
 column_1 | column_2 | column_3
----------+----------+----------
        1 |        2 |        3
```

## Step 12: Exit the PostgreSQL Shell and Container
- Type `\q` to exit PostgreSQL shell
- Type `exit` to leave the container shell
- You are now back on your host machine.

## Key Takeaways
- Docker isolates infrastructure from your machine
- PostgreSQL users ≠ Linux users
- `\i` is a PostgreSQL command, not SQL
- Containers are disposable; volumes are not