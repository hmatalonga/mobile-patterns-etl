#!/usr/bin/env bash

NOTEBOOKS_DIR=${1:-$PWD}
DEPS=$(cat requirements.txt | tr '\r\n' ' ')
BASH_SCRIPT="/opt/conda/bin/conda install $DEPS -y --quiet && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root"

docker run --rm -it -v "$NOTEBOOKS_DIR":/opt/notebooks -p 8888:8888 continuumio/miniconda3 sh -c "$BASH_SCRIPT"
