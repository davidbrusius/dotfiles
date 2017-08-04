#!/usr/bin/env bash

# Dotfiles vars
export DOTFILES="${HOME}/.dotfiles"
export DOTFILES_INSTALLER="${DOTFILES}/installers"
export DOTFILES_TEMPLATES="${DOTFILES}/templates"

source ${DOTFILES_INSTALLER}/utils

print_in_purple 'Running installers'

${DOTFILES_INSTALLER}/git

print_in_green '\nSuccess!\n' && exit 0
