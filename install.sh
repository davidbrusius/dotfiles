#!/usr/bin/env bash

# Dotfiles vars
export DOTFILES="${HOME}/.dotfiles"
export DOTFILES_INSTALLER="${DOTFILES}/installers"
export DOTFILES_TEMPLATES="${DOTFILES}/templates"

source ${DOTFILES_INSTALLER}/utils
source ${DOTFILES_INSTALLER}/custom_env_vars

print_in_purple 'Running installers'

${DOTFILES_INSTALLER}/brew
${DOTFILES_INSTALLER}/git
${DOTFILES_INSTALLER}/osx
${DOTFILES_INSTALLER}/shell

print_in_green '\nSuccess!\n' && exit 0
