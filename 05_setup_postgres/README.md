# Setting up Postgres
[Instructions Repository](https://github.com/Akina-Aoki/data_modeling_course/tree/main/05_setup_postgres)

- `touch .env` to create a .env file in the root directory of this repo.
- in `.env` tab, paste:
`POSTGRES_HOST="localhost"
POSTGRES_USER="postgres"
POSTGRES_PASSWORD="Iwanttobeadataengineer2027!" # my chosen password
POSTGRES_DB="data_modeling_course_db"
POSTGRES_PORT=5432
`
Then save.

- Install Docker for desktop if not installed already.

- Create a yaml file `docker-compose.yml` in the root directory of this repo.
`services:
  postgres:
    image: postgres:17.4
    container_name: postgres_data_modeling
    restart: always
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    ports:
      - "${POSTGRES_PORT}:5432"
    volumes:
      - data_modeling_course:/var/lib/postgresql/data # named_volume
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${POSTGRES_USER:-postgres}"]
      interval: 5s
      retries: 5
      timeout: 3s
volumes:
  data_modeling_course:
`

- Do some sanity check:
`docker --version
docker compose version
`
- Run in terminal main root: `docker compose up -d` to start Postgres container.

# vscode postgres extension
- Install Postgres extension in VSCode (by Chris Kolkman).
- [Download this extension](https://marketplace.visualstudio.com/items?itemName=ckolkman.vscode-postgres) from the marketplace. This allows for local development directly in vscode.
- Now you need to select the postgres server.

Instructions to setup

Click on elephant in a cylinder symbol on the left
Click plus button
On hostname type in localhost
Postgres user is the same in your .env
Password same as in your .env
Port number same as in your .env
Choose standard connection
Choose your database - in our case data_modeling_course_db
Click enter to choose displayname

## Useful psql commands

Used in psql CLI.

| command | meaning                       |
| ------- | ----------------------------- |
| \d      | describe table                |
| \dn     | lists schemas in the database |
| \l      | lists databases               |
| \c      | connect to a database         |
| \dt     | list all relations or tables  |