FROM python:3.12-slim

# Папка будет /backend/app
WORKDIR /backend/app

# requirements
COPY backend/requirements.txt /backend/

RUN pip install --no-cache-dir -r /backend/requirements.txt

# Скопировать весь backend (с app внутри)
COPY backend/ /backend/

EXPOSE 8080

# Теперь запуск из папки app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--p]()
