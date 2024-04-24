#!/bin/sh

deepeval login --confident-api-key $CONFIDENTAI_API_KEY
uvicorn --host 0.0.0.0 --port 8000 src.app-external:app
