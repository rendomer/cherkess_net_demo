# Используем официальный Python образ
FROM python:3.12-slim

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем файл зависимостей из backend
COPY backend/requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем backend и app в контейнер
COPY backend/ ./backend/
COPY app/ ./app/

# Открываем порт 8080
EXPOSE 8080

# Запускаем FastAPI из app.main
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
