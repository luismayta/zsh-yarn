#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install zsh-yarn for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
export yarn_package_name="yarn"

YARN_PLUGIN_DIR="$(dirname "${0}")"
YARN_SOURCE_PATH="${YARN_PLUGIN_DIR}"/src

export YARN_PATH="${HOME}"/.yarn

export YARN_MESSAGE_BREW_NOT_FOUND="Please Install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export YARN_MESSAGE_NVM_NOT_FOUND="Please Install nvm or use antibody bundle luismayta/zsh-nvm branch:develop"

# shellcheck source=/dev/null
source "${YARN_SOURCE_PATH}"/base.zsh

# shellcheck source=/dev/null
source "${YARN_SOURCE_PATH}"/yarn.zsh

function yarn::run {
    local command
    command="$(yarn::search::scripts)"
    if [ -z "${command}" ]; then
        return
    fi
    env yarn "${command}" && zle accept-line
}

zle -N yarn::run
bindkey '^Xr' yarn::run
