#!/bin/bash

INTERFACE="aicha"
SERVICE="wg-quick@$INTERFACE"

case "$1" in
  toggle)
    if systemctl is-active --quiet "$SERVICE"; then
      sudo /bin/systemctl stop "$SERVICE"
    else
      sudo /bin/systemctl start "$SERVICE"
    fi
    ;;
  status)
    if systemctl is-active --quiet "$SERVICE"; then
      echo '{"text":"● VPN", "class":"on"}'
    else
      echo '{"text":"● VPN", "class":"off"}'
    fi
    ;;
esac

