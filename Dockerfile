FROM python:3.12-slim as builder
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y git gcc clang clang-tools cmake

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY src /app/src
COPY *.json start.sh .

ENV OPENAI_API_KEY openaiapikey
ENV CONFIDENTAI_API_KEY confidentaiapikey
ENV ANTHROPIC_API_KEY anthropicapikey
ENV POSTGRES_DBNAME dbname
ENV POSTGRES_USER username
ENV POSTGRES_PASSWORD password
ENV POSTGRES_HOST localhost
ENV POSTGRES_PORT 5432
ENV CONFIG_PATH config.json

CMD ["./start.sh"]
