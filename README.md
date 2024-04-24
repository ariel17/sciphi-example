# SciPhi AI example

This is an example based on [SciPhi-AI/R2R-qna-rag-prebuilt](https://github.com/SciPhi-AI/R2R-qna-rag-prebuilt).

## How to execute it

Different modes:

* Local with pgvector
* Docker with pgvector (own infrastructure)
* SciPhi

### Required environment variables for all modes

* OPENAI_API_KEY
* ANTHROPIC_API_KEY: [anthropic.com](https://www.anthropic.com)
* CONFIDENTAI_API_KEY: For [Confident AI](https://confident-ai.com/)'s `deepeval` 
  prompt evaluations/monitoring. An alternative for this is [Parea AI](https://parea.ai).

```bash
$ export OPENAI_API_KEY=xxxxxx
$ export ANTHROPIC_API_KEY=yyyyyy
$ export CONFIDENT_API_KEY=zzzzzz
```

### Local with pgvector

[pgvector](https://github.com/pgvector/pgvector/) is a vectorial database based
on PostgreSQL.

* CONFIG_PATH: JSON config file name.
* POSTGRES_USER
* POSTGRES_PASSWORD
* POSTGRES_HOST
* POSTGRES_PORT
* POSTGRES_DBNAME

Example: 

```bash
# Using Python >=3.12
$ python3 -m venv env
$ source env/bin/activate
$ pip install -r requirements.txt
$ export CONFIG_PATH="config-pgvector.json"
$ export POSTGRES_USER=vectordb
$ export POSTGRES_PASSWORD=vectordb
$ export POSTGRES_HOST=localhost
$ export POSTGRES_PORT=5432
$ export POSTGRES_DBNAME=vectordb
$ ./start.sh
```

### Docker with pgvector

Modify the [docker-compose.yml](./docker-compose.yml) settings for the `sciphi`
container. This repository contains different service combinations:

* `config-pgvector.json`: Uses the pgvector `db` container. Uses OpenAI's
  embeddings. See [Providers documentation](https://r2r-docs.sciphi.ai/providers/embeddings#available-models).
* `config-local_embeddings-pgvector.json`: Uses pgvector `db` container and 
  `sentence_transformers` with [HuggingFace models](https://huggingface.co/)
  locally for embeddings.  

```bash
$ docker compose up  # -d to detach
```

### SciPhi

Add required keys in deployments config:

![sciphi.ai deploys](./sciphi-deploys.png)

* OPENAI_API_KEY
* ANTHROPIC_API_KEY
* CONFIDENT_API_KEY
* CONFIG_PATH: `config-sciphi.json`. This configuration is specific for this
  environment.

## How to run queries

See [postman/QUERIES.md](postman/QUERIES.md).
