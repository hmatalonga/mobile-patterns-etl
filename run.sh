#!/usr/bin/env bash

NOTEBOOKS_DIR=${1:-$PWD}
DEPS=$(cat requirements.txt | tr '\r\n' ' ')
BASH_SCRIPT="/opt/conda/bin/conda install $DEPS -y --quiet && /opt/conda/bin/jupyter lab --ip='0.0.0.0' --port=8888 --notebook-dir=/opt/notebooks --no-browser --allow-root --NotebookApp.token='' --NotebookApp.password=''"

docker run --rm -d -v "$NOTEBOOKS_DIR":/opt/notebooks -p 8888:8888 continuumio/anaconda3 sh -c "$BASH_SCRIPT"
