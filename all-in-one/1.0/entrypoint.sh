#!/bin/bash

set -e

function salute() {
  echo '=================================================='
  echo ' ███╗   ███╗ ██╗     ██╗ ███╗    ██╗ ██████████╗'
  echo ' ████╗ ████║ ██║     ██║ ████╗   ██║ ██╔═══════╝'
  echo ' ██╔████╔██║ ██║     ██║ ██╔██╗  ██║ ██████████╗'
  echo ' ██║╚██╔╝██║ ██║     ██║ ██║ ╚██╗██║ ╚═══════██║'
  echo ' ██║ ╚═╝ ██║ ╚████████╔╝ ██║   ╚███║ ██████████║'
  echo ' ╚═╝     ╚═╝  ╚═══════╝  ╚═╝    ╚══╝ ╚═════════╝'
  printf ' '
  color_print 'MongoDB' 'green'
  printf ' + '
  color_print 'Unicorn' 'magenta'
  printf ' + '
  color_print 'Nginx' 'green'
  printf ' + '
  color_print 'Sinatra' 'red'
  echo ''
  echo '=================================================='
}

function list_versions_info() {
  echo ''
  ruby --version
  mongo --version
  unicorn -v
  nginx -v
  gem list sinatra | grep "^sinatra\s.*"
  echo ''
}

function run_nop_daemon() {
  while true
  do
    sleep 3600
  done
}

function color_print() {
  if [[ $# -lt 1 ]]; then
    exit 1
  fi
  local text=$1
  local color=$2
  case "$color" in
    "black") printf "\e[30m$text\e[0m"
    ;;
    "red") printf "\e[31m$text\e[0m"
    ;;
    "green") printf "\e[32m$text\e[0m"
    ;;
    "yellow") printf "\e[33m$text\e[0m"
    ;;
    "blue") printf "\e[34m$text\e[0m"
    ;;
    "magenta") printf "\e[35m$text\e[0m"
    ;;
    "cyan") printf "\e[36m$text\e[0m"
    ;;
    "white") printf "\e[37m$text\e[0m"
    ;;
    *) printf "\e[0m$text"
    ;;
  esac
}

if [ "${1:0:1}" != '-' ]; then
  salute
  list_versions_info
  exec "$@"
fi

run_nop_daemon
