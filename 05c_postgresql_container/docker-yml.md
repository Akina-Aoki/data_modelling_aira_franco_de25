# What This `docker-compose.yml` Does (Beginner Explanation)

This `docker-compose.yml` file is used to run a PostgreSQL database using Docker.

In simple terms:
- Docker runs PostgreSQL for you
- Docker Compose describes *how* it should run
- You do not need to install PostgreSQL directly on your computer

---

## High-Level Overview

- Docker Compose manages containers using a single file
- This file starts **one container**
- That container runs **PostgreSQL**
- The database keeps its data even if Docker stops
- Your computer can connect to the database using a port

---

## Full File Explained Step by Step

---

## `services`

```yaml
services:
```

- This is the top-level section
- Every container you want to run is defined here
- Think of it as a list of applications Docker should start

---

## `postgres` (Service Name)

```yaml
postgres:
```

- This is the name of the service
- It represents one PostgreSQL container
- Other services could refer to it by this name

---

## `image`

```yaml
image: postgres:latest
```

- Tells Docker which image to use
- `postgres` is the official PostgreSQL image
- `latest` means the newest stable version

---

## `container_name`

```yaml
container_name: postgres_container
```

- Sets a fixed name for the container
- Makes it easier to find and debug
- Without this, Docker generates a random name

---

## `restart`

```yaml
restart: always
```

- Automatically restarts the container if it crashes
- Useful for development and reliability
- Prevents the database from staying down

---

## `environment`

```yaml
environment:
  POSTGRES_USER: ${POSTGRES_USER}
  POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
  POSTGRES_DB: ${POSTGRES_DB}
```

- These are configuration values for PostgreSQL
- They are read when the container starts
- Values come from your `.env` file

Explanation of each variable:
- `POSTGRES_USER` → database username
- `POSTGRES_PASSWORD` → database password
- `POSTGRES_DB` → database created at startup

---

## `ports`

```yaml
ports:
  - "${POSTGRES_PORT}:5432"
```

- Connects your computer to the container
- Left side (`POSTGRES_PORT`) is your computer
- Right side (`5432`) is PostgreSQL inside Docker
- Allows tools like psql, DBeaver, or apps to connect

---

## `volumes`

```yaml
volumes:
  - postgres_data:/var/lib/postgresql/data
  - ./sql:/sql
```

This section handles **data persistence**.

### Named Volume

```yaml
postgres_data:/var/lib/postgresql/data
```

- Stores PostgreSQL data safely
- Data survives container restarts
- Visible in Docker Desktop under **Volumes**

### Bind Mount

```yaml
./sql:/sql
```

- Links a local folder to the container
- Files in `./sql` are accessible inside Docker
- Useful for SQL scripts or initialization files

---

## `healthcheck`

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER:-postgres}"]
  interval: 5s
  retries: 5
  timeout: 3s
```

- Checks if PostgreSQL is ready to accept connections
- Runs automatically after startup
- Prevents other services from connecting too early

Explanation:
- `pg_isready` → PostgreSQL readiness check
- `interval` → how often to check
- `retries` → how many attempts before failing
- `timeout` → max time per check

---

## `volumes` (Top-Level)

```yaml
volumes:
  postgres_data:
```

- Declares a named Docker volume
- Docker manages this storage
- Data persists even if containers are deleted

---

## ✅ Summary

What this file achieves:
- Runs PostgreSQL in Docker
- Uses environment variables for configuration
- Exposes the database to your computer
- Persists data safely
- Automatically restarts on failure
- Confirms the database is ready before use

This setup is:
- Beginner-friendly
- Reproducible
- Safe for local development
- Industry-standard


`docker compose up`

`docker ps`

`docker exec -it <container name> bash`

`myh_db=# DESC;`

`myh_db=# \i`