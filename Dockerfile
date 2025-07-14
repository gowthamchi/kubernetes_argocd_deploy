FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install  -y \
    build-essentials \
    libpq-dev \
    rm -rf /var/lib/apt/lists/*

COPY requirement.txt .

RUN pip install --no-cache-dir -r requirement.txt

COPY . .

CMD ["python","manage.py","runserver","0.0.0.0:8000"]

