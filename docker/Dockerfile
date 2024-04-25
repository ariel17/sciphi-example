FROM python:3.12-slim AS builder
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y git gcc clang clang-tools cmake ccache g++ procps

WORKDIR /app
RUN python -m venv /app/env
ENV PATH="/app/env/bin:$PATH"
COPY ./docker/requirements.txt /app/requirements.txt
RUN CMAKE_ARGS="-DLLAMA_CUDAS=on" pip install -r requirements.txt


FROM python:3.12-slim AS runtime

WORKDIR /app
COPY --from=builder /app/env /app/env
ENV PATH="/app/env/bin:$PATH"
COPY src /app/src
COPY ./docker/config*.json start.sh ./

ENV OPENAI_API_KEY openaiapikey
ENV CONFIDENTAI_API_KEY confidentaiapikey
ENV ANTHROPIC_API_KEY anthropicapikey
ENV SERPER_API_KEY serperapikey
ENV POSTGRES_DBNAME dbname
ENV POSTGRES_USER username
ENV POSTGRES_PASSWORD password
ENV POSTGRES_HOST localhost
ENV POSTGRES_PORT 5432
ENV CONFIG_PATH config.json

CMD ["./start.sh"]
