# cherkess_net
# Cherkess Net Backend

## 📌 Описание проекта

Бэкенд для проекта "Cherkess Net" построен на **FastAPI** с использованием **PostgreSQL** и **SQLAlchemy**. Поддерживает регистрацию/авторизацию пользователей, статистику, базу опросов, загрузку фотографий, восстановление пароля и многое другое.

---

## ⚙️ Установка и запуск

### 1️⃣ Клонировать репозиторий:

```bash
git clone <репозиторий>
cd <папка проекта>
```

### 2️⃣ Установить зависимости:

```bash
pip install -r requirements.txt
```

### 3️⃣ Настроить базу данных PostgreSQL:

* Создать базу данных `cherkess_net`
* Выполнить скрипт `scripts/init_db.sql` вручную через **pgAdmin** или **psql**:

```sql
\i scripts/init_db.sql
```

### 4️⃣ Инициализация моделей ORM:

```bash
python scripts/init_db.py
```

### 5️⃣ Запуск сервера:

```bash
uvicorn app.main:app --reload
```

Документация API → [http://localhost:8000/docs](http://localhost:8000/docs)

---

## 📂 Структура проекта

```
CherkessNet/
├── app/
│   ├── routes/          # Роуты FastAPI
│   ├── schemas/         # Pydantic схемы
│   ├── models/          # SQLAlchemy модели
│   ├── services/        # Логика приложения
│   └── database.py      # Настройка подключения к БД
│
├── scripts/
│   ├── init_db.py       # Инициализация моделей ORM
│   └── init_db.sql      # SQL скрипт создания структуры БД
└── requirements.txt
```

---

## 🚀 Автоматическая инициализация базы

Можно подключить автоматическую инициализацию **ORM** при запуске FastAPI:

В файле \`\` уже добавлено:

```python
@app.on_event("startup")
async def on_startup():
    await init_models()
```

⚠️ **Важно:** `init_models()` **не создаёт расширения PostgreSQL**. Поэтому `scripts/init_db.sql` нужно выполнить вручную **один раз**.

---

## 📦 Миграции через Alembic

### Установка Alembic:

```bash
pip install alembic
```

### Инициализация Alembic:

```bash
alembic init alembic
```

Далее помогу тебе полностью настроить `alembic.ini`, `env.py`, генерацию миграций и их применение. Пиши, как будешь готов.

---

## 📅 Контакты и поддержка

* **Проект:** Cherkess Net
* **Автор:** Beslan Kmuzov

---

📍 **Следующий шаг** — настройка Alembic ⚙️
