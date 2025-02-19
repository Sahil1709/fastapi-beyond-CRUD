# FastAPI Beyond CRUD 

**FastAPI Beyond CRUD** is a project that demonstrates advanced usage of FastAPI, a modern, fast (high-performance), web framework for building APIs with Python 3.6+ based on standard Python type hints. This project goes beyond the basic CRUD (Create, Read, Update, Delete) operations and showcases how to integrate various tools and technologies such as PostgreSQL, Redis, Celery, and Docker to build a robust and scalable web application.


## Table of Contents

1. [Getting Started](#getting-started)
2. [Prerequisites](#prerequisites)
3. [Project Setup](#project-setup)
4. [Running the Application](#running-the-application)
5. [Running Tests](#running-tests)
6. [Contributing](#contributing)

## Getting Started
Follow the instructions below to set up and run your FastAPI project.

### Prerequisites
Ensure you have the following installed:

- Python >= 3.10
- PostgreSQL
- Redis

### Project Setup
1. Clone the project repository:
    ```bash
    git clone https://github.com/sahil1709/fastapi-beyond-CRUD.git
    ```
   or
   ```
   git clone git@github.com:Sahil1709/fastapi-beyond-CRUD.git
   ```
2. Navigate to the project directory:
    ```bash
    cd fastapi-beyond-CRUD/
    ```

3. Create and activate a virtual environment:
    ```bash
    python3 -m venv env
    source env/bin/activate
    ```

4. Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

5. Set up environment variables by copying the example configuration:
    ```bash
    cp .env.example .env
    ```

6. Run database migrations to initialize the database schema:
    ```bash
    alembic upgrade head
    ```
    (you caan also skip this step and run the application once with `sh entrypoint.sh`)

7. Open a new terminal and ensure your virtual environment is active. Start the Celery worker (Linux/Unix shell):
    ```bash
    sh runworker.sh
    ```

## Running the Application
Start the application:

```bash
fastapi dev src/
```
Alternatively, you can run the application using Docker:
```bash
docker compose up -d
```

Once the application is running go to http://localhost:8000/api/v1/docs to view Swagger UI docs.

## Running Tests
Run the tests using this command
```bash
pytest
```

## Continuous Integration
This project includes GitHub Actions workflows for continuous integration:

### Nightly Build
The nightly-build.yml workflow runs every night at 8 AM UTC. It performs the following tasks:

- Checks out the repository
- Sets up Python and installs dependencies
- Runs tests
- Builds and tags Docker images for the web application and Celery worker
- Pushes the Docker images to GitHub Container Registry
- Sends an email notification if the build fails

### Pull Request Validation
The validate-pr.yml workflow runs on every pull request. It performs the following tasks:

- Checks out the repository
- Verifies that commit messages follow the Conventional Commits specification
- Comments on the pull request and closes it if any commit messages do not follow the specification
- Sends an email notification to the pull request author if the commit messages do not follow the specification

## Project Structure
```
.env
.env.example
.github/
    workflows/
        nightly-build.yml
        validate-pr.yml
.gitignore
.pytest_cache/
alembic.ini
compose.yml
Dockerfile
entrypoint.sh
migrations/
README.md
requirements.txt
runworker.sh
src/
    __init__.py
    auth/
    books/
    celery_tasks.py
    config.py
    db/
    errors.py
    mail.py
    middleware.py
    reviews/
    tags/
    tests/
```

## Contributing
I welcome contributions to improve the documentation! You can contribute [here](https://github.com/sahil1709/fastapi-beyond-crud).
