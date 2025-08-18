# Django Authentication Project

A production-ready Django authentication project using **PostgreSQL**, **Redis**, and **Celery**, fully containerized with Docker and Docker Compose.  
This setup is designed so you can start the project immediately without manual tweaks.

---

## 🚀 Features
- **Django** (Modular settings: base, dev, prod)
- **PostgreSQL** for database
- **Redis** for caching and Celery backend
- **Celery** for background tasks
- **Docker & Docker Compose** for local and production environments
- **Environment-based configuration** using `.env`

---

## 📂 Project Structure
```
DjangoAuth
├── accounts
│   ├── admin.py
│   ├── apps.py
│   ├── migrations
│   ├── models.py
│   ├── tests.py
│   ├── urls.py
│   └── views.py
├── django_auth
│   ├── asgi.py
│   ├── celery.py
│   ├── settings
│   │   ├── base.py
│   │   ├── dev.py
│   │   └── __init__.py
│   ├── urls.py
│   └── wsgi.py
├── docker
│   ├── create_superuser.sh
│   └── entrypoint.sh
├── docker-compose.yml
├── Dockerfile
├── env.example
├── manage.py
├── README.md
└── requirements.txt
```

---

## 🛠 Prerequisites
- **Docker** (latest)
- **Docker Compose** (latest)

Check installation:
```bash
docker --version
docker compose version
```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone Repository
```bash
git clone https://github.com/GautamSavasaviya/DjangoProjectBaseTemplate
cd DjangoAuth
```

### 2️⃣ Configure Environment
Copy the example env file:
```bash
cp env.example .env
```
Edit `.env`:
```env
SECRET_KEY=your_secret_key
DEBUG=True
DB_NAME=django_auth_db
DB_USER=django_user
DB_PASSWORD=strongpassword
DB_HOST=db
DB_PORT=5432

DJANGO_ENV=dev
DJANGO_SETTINGS_MODULE=django_auth.settings.dev
```

---

### 3️⃣ Build & Run Containers
```bash
docker compose up --build
```

---

### 4️⃣ Create Superuser
After the containers are running:
```bash
docker compose exec django python manage.py createsuperuser
```

---

### 5️⃣ Access the App
- Django App: [http://localhost:8000](http://localhost:8000)
- Django Admin: [http://localhost:8000/admin](http://localhost:8000/admin)

---

## 🧪 Running Tests
```bash
docker compose exec django python manage.py test
```

---

## 📦 Useful Commands
Rebuild containers:
```bash
docker compose up --build
```

Run migrations:
```bash
docker compose exec django python manage.py migrate
```

Stop containers:
```bash
docker compose down
```

Remove containers & volumes:
```bash
docker compose down -v
```

---

## 🗄 Persistent Data
- PostgreSQL data is stored in a Docker volume (`postgres_data`) for persistence.

---

## 🚀 Deploying to Production
For production:
```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
```
Make sure:
- `DEBUG=False` in `.env`
- Use secure passwords and secrets

---

## 🤝 Contributing
1. Fork the repo
2. Create a feature branch
3. Submit a pull request

---

## 📜 License
This project is licensed under the **MIT License**.

---
✅ **With this setup, you can directly use the project without editing configs. Just clone, set `.env`, and run.**
