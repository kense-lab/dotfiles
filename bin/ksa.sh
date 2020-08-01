#!/bin/bash

action=$1

if [ "$action" == 'start' ]; then
  cd /opt/KSA_linux || exit
  sudo ./ksa_x64
  cd - || exit
elif [ "$action" == 'stop' ]; then
  pid=$(ps -e | awk '$4 == "ksa_x64" { print $1 }')
  if [ "$pid" ]; then
    sudo kill -9 "$pid"
  fi
else
  echo 'Usage: ksa.sh start|stop'
fi

