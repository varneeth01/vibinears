FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
  && rm -rf /var/lib/apt/lists/*

# Copy full API service before installing package
COPY services/api ./services/api

WORKDIR /app/services/api

RUN pip install --upgrade pip \
  && pip install -e .

WORKDIR /app

RUN useradd --create-home --shell /bin/bash appuser
USER appuser

EXPOSE 8000

CMD ["uvicorn", "services.api.app.main:app", "--host", "0.0.0.0", "--port", "8000"]
