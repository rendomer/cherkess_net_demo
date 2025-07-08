FROM python:3.12-slim

WORKDIR /app

# Копируем файл зависимостей из backend
COPY backend/requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь backend в контейнер
COPY backend/ ./backend/

# Переместимся в backend, чтобы uvicorn видел модуль app.main
WORKDIR /app/backend

# Открываем порт
EXPOSE 8080

# Запускаем приложение
CMD ["uvicorn", "backend.app.main:app", "--host", "0.0.0.0", "--port", "8080"]
