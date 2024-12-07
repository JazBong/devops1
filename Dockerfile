FROM python:slim

RUN apt-get update && apt-get install -y \
    libpq-dev \
    build-essential \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools

WORKDIR /opt/django-locallibrary

COPY requirements.txt .

RUN pip install --no-cache-dir --force -r requirements.txt

COPY . .

RUN python manage.py makemigrations

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
