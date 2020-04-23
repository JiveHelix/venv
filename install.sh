#!/usr/bin/env bash

if [ -v ZSH_VERSION ]
then
    # Assume that this script is executed by zsh
    THIS_DIRECTORY=${0:a:h}
else
    # Assume that this script is executed by bash
    THIS_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
fi

THIS_RELATIVE="$(basename "${THIS_DIRECTORY}")"
PARENT_DIRECTORY="$(dirname "${THIS_DIRECTORY}")"

ln -s "${THIS_RELATIVE}/update_venv.sh" "${PARENT_DIRECTORY}/update_venv.sh"
