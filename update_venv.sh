#!/usr/bin/env bash

# This script should be linked in your project root.

# This method of finding the location of this script finds the location of the
# link, which is what we want.
if [ -v ZSH_VERSION ]
then
    # Assume that this script is executed by zsh
    THIS_DIRECTORY=${0:a:h}
else
    # Assume that this script is executed by bash
    THIS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
fi

set -u

VENV_DIRECTORY="${THIS_DIRECTORY}/.venv"

REQUIREMENTS="${THIS_DIRECTORY}/venv.require"
"${THIS_DIRECTORY}/venv/create_venv.sh" \
    "${VENV_DIRECTORY}" \
    "${REQUIREMENTS}"
