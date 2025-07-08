# Используем официальный Python образ
FROM python:3.12-slim

# Рабочая папка — ставим на уровень, где лежит папка app/
WORKDIR /backend

# Скопировать requirements.txt
COPY backend/requirements.txt ./

# Установить зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Скопировать весь backend
COPY backend/ ./

# Для дебага — можно показать, что внутри
# RUN ls -R /backend

# Открываем порт
EXPOSE 8080

# Стартуем uvicorn ИЗ backend с правильным модулем
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]

