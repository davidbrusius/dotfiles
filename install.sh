#!/usr/bin/env bash

# Dotfiles vars
export DOTFILES="${HOME}/dotfiles"
export DOTFILES_INSTALLER="${DOTFILES}/installers"
export DOTFILES_TEMPLATES="${DOTFILES}/templates"

source ${DOTFILES_INSTALLER}/utils
source ${DOTFILES_INSTALLER}/custom_env_vars

print_in_purple 'Running installers'

ask_options "installers_to_run" \
  "Installers to run" \
  "all" "brew" "git" "osx" "shell"

print_in_green "Running '$installers_to_run' installer(s)"

if [[ $installers_to_run == "brew" || $installers_to_run == "all" ]]; then
  ${DOTFILES_INSTALLER}/brew
fi

if [[ $installers_to_run == "git" || $installers_to_run == "all" ]]; then
  ${DOTFILES_INSTALLER}/git
fi

if [[ $installers_to_run == "osx" || $installers_to_run == "all" ]]; then
  ${DOTFILES_INSTALLER}/osx
fi

if [[ $installers_to_run == "shell" || $installers_to_run == "all" ]]; then
  ${DOTFILES_INSTALLER}/shell
fi


print_in_green "Success!" && exit 0
