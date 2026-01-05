# Figlet Star Wars – Docker + Python Demo

A small Dockerized Python application that renders random phrases using the **Star Wars figlet font**.  
Built to demonstrate basic Docker image creation, Python execution inside containers, and reproducible builds.

[Figlet Yotube Tutorial](https://www.youtube.com/watch?v=Ud7Npgi6x8E)

## Key Concepts to Remember

- Docker images are immutable
- Source code changes do not affect existing images
- Rebuild → run is the standard workflow
- Containers are disposable; images are reusable
- Python can safely orchestrate system CLIs inside containers

- Containerized batch jobs
- Reproducible execution environments
- Clear separation between code and infrastructure
- Deterministic, repeatable runs
---

## Tech Stack

- app.py (Python script)
- Dockerfile
- Ubuntu base image (Ubuntu is a popular Linux distribution)
- figlet (CLI tool)
     https://raw.githubusercontent.com/xero/figlet-fonts/main/starwars.flf

---

- `Dockerfile` defines how the image is built
- `app.py` contains the Python logic executed at container startup

---

## Application Logic (app.py)

At runtime, the application:
1. Defines a list of phrases
2. Randomly selects one phrase
3. Calls the `figlet` CLI using Python’s `subprocess`
4. Prints the result to STDOUT

No files are written. The container exits immediately after execution.

---

## Dockerfile Breakdown

The Dockerfile performs the following steps:

1. Uses Ubuntu as the base image
2. Installs system dependencies:
   - `python3`
   - `figlet`
   - `wget`
3. Downloads the Star Wars figlet font (`starwars.flf`)
4. Sets a working directory (`/app`)
5. Copies `app.py` into the image
6. Runs `python3 app.py` when the container starts

---

## Build the Docker Image

From the directory containing the Dockerfile:

```bash
docker build -t figlet-starwars .
```

## Run the Docker Container
```bash
docker run --rm figlet-starwars
```

## Rebuilding the Image
After when updating phrases or logic in ``pp.py:`
Rebuild the image with:
```bash
docker build -t figlet-starwars .
```

Run the updated container:
```bash
docker run --rm figlet-starwars
```

If changes do not appear, try removing the existing image first:
```bash
docker rmi figlet-starwars
```

Then force a clean build:
```bash
docker build --no-cache -t figlet-starwars .
```




