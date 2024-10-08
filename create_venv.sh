#!/usr/bin/env zsh

set -euo pipefail

if [ -v ZSH_VERSION ]
then
    # Assume that this script is executed by zsh
    THIS_DIRECTORY=${0:a:h}
else
    # Assume that this script is executed by bash
    THIS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
fi

if ! [ -v PYTHON ]
then
    PYTHON=python3
fi

if ! [ -v PIP ]
then
    PIP=pip3
fi

if [[ $# -ne 2 ]]
then
    echo "Usage: $(basename $0) <venv-directory> <requirements-file>"
    exit -1
fi

VENV_DIRECTORY="$1"
REQUIREMENTS="$2"

# Create the venv directory if it doesn't exist
[[ ! -d "${VENV_DIRECTORY}" ]] && mkdir -p "${VENV_DIRECTORY}"

echo "Using ${PYTHON} and ${PIP}"

eval "${PYTHON} -m venv "${VENV_DIRECTORY}""

source "${VENV_DIRECTORY}/bin/activate"

eval "${PIP} install --upgrade pip"

# Install the requirements for wxPython
eval "${PIP} install -r "${REQUIREMENTS}""
