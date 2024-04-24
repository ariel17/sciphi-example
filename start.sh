#!/bin/sh

deepeval login --confident-api-key $CONFIDENTAI_API_KEY
python uvicorn src.app-external:app
