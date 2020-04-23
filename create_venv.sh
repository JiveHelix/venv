#!/usr/bin/env bash

set -euo pipefail

if [ -v ZSH_VERSION ]
then
    # Assume that this script is executed by zsh
    THIS_DIRECTORY=${0:a:h}
else
    # Assume that this script is executed by bash
    THIS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
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

python3 -m venv "${VENV_DIRECTORY}"

source "${VENV_DIRECTORY}/bin/activate"

pip3 install --upgrade pip

# Install the requirements for wxPython
pip3 install -r "${REQUIREMENTS}"
