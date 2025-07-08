# Используем официальный Python образ
FROM python:3.12-slim

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем requirements
COPY backend/requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем ВСЁ из backend и app
COPY backend/ ./backend/

# Открываем порт 8080
EXPOSE 8080

# Запускаем FastAPI правильно — из backend.app.main
CMD ["uvicorn", "backend.app.main:app", "--host", "0.0.0.0", "--port", "8080"]
