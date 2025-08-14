# Django Authentication Project

This project is a Django-based web application designed for user authentication. It utilizes PostgreSQL as the database and is containerized using Docker.

## Project Structure

```
DjangoAuth
├── accounts
│   ├── __init__.py
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   │   └── __init__.py
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── django_auth
│   ├── __init__.py
│   ├── asgi.py
│   ├── settings
│   │   ├── __init__.py
│   │   ├── base.py
│   │   └── dev.py
│   ├── urls.py
│   └── wsgi.py
├── manage.py
├── Dockerfile
├── docker-compose.yml
├── .env
├── .gitignore
└── README.md
```

## Getting Started

### Prerequisites

- Docker
- Docker Compose

### Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd DjangoAuth
   ```

2. Create a `.env` file in the root directory and add your environment variables:
   ```
   SECRET_KEY=your_secret_key
   DEBUG=True
   DB_NAME=your_db_name
   DB_USER=your_db_user
   DB_PASSWORD=your_db_password
   DB_HOST=db
   DB_PORT=5432
   ```

3. Build and run the Docker containers:
   ```
   docker-compose up --build
   ```

### Usage

- Access the application at `http://localhost:8000`.
- The Django admin interface can be accessed at `http://localhost:8000/admin`.

### Running Tests

To run tests, use the following command:
```
docker-compose exec web python manage.py test
```

### Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

### License

This project is licensed under the MIT License. See the LICENSE file for details.