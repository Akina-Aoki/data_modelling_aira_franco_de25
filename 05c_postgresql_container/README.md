# docker-compose.yml — Beginner Documentation

This document explains **what each line does** in the `docker-compose.yml` file.
It is written for beginners who are learning Docker and Docker Compose in VS Code.

---

## Purpose of this file

The `docker-compose.yml` file defines how Docker should **run and manage containers together**.
Instead of starting containers manually, Docker Compose lets you describe the setup once and reuse it consistently.

---

## File Breakdown

```yaml
# docker-compose.yml
# This file defines how Docker should run and manage containers together.
```

These are comments for humans. Docker ignores them.

---

### Services

```yaml
services:
```

- `services` is the **top-level section**
- Each service represents **one container**
- Docker Compose will manage all services together

---

### PostgreSQL Service

```yaml
  postgres:
```

- `postgres` is the **service name**
- This name is used internally by Docker for networking
- Other containers can connect to this service using the name `postgres`

---

### Image

```yaml
    image: postgres:latest
```

- Tells Docker which image to use
- `postgres` is the **official PostgreSQL image** from Docker Hub
- `latest` pulls the most recent stable version

---

### Container Name

```yaml
    container_name: postgres_container
```

- Assigns a fixed, human-readable container name
- Without this, Docker would generate a random name
- Makes debugging and container management easier

---

### Restart Policy

```yaml
    restart: always
```

- Automatically restarts the container if it crashes
- Also restarts when Docker itself restarts
- Useful for development and basic resilience

---

### Environment Variables

```yaml
    environment:
```

- Environment variables configure PostgreSQL **at startup**
- These values are injected into the container when it launches

```yaml
      POSTGRES_USER: ${POSTGRES_USER}
```

- Creates the default PostgreSQL user
- Value is read from a `.env` file or system environment variable

```yaml
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
```

- Sets the password for the PostgreSQL user
- Passwords should **never be hard-coded** in the compose file

```yaml
      POSTGRES_DB: ${POSTGRES_DB}
```

- Creates a default database when PostgreSQL starts

```yaml
      POSTGRES_PORT=5432
```

- Defines the internal PostgreSQL port
- PostgreSQL listens on port `5432` by default

---

### Volumes

```yaml
volumes:
```

- Defines persistent storage managed by Docker
- Data stored in volumes **survives container restarts and removals**

```yaml
  postgres_data:
```

- This is a **named volume**
- PostgreSQL data files are stored here
- Visible in Docker Desktop under the **Volumes** tab
- Prevents data loss when containers are recreated

---

## Key Concept Summary

- **services** → what containers run  
- **image** → what software runs inside the container  
- **environment** → how the software is configured  
- **volumes** → where data is safely stored  

This setup reflects **industry-standard local development practices** and is a strong foundation for adding more services later (backend apps, ETL pipelines, dashboards, schedulers).
