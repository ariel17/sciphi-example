#!/bin/sh

deepeval login --confident-api-key $CONFIDENTAI_API_KEY
python ./src/app.py
