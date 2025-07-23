#!/bin/bash

CONNECTION_ID="aicha"

case "$1" in
  toggle)
    if nmcli -t -f NAME,TYPE con show --active | grep -q "^$CONNECTION_ID:.*"; then
      nmcli con down id "$CONNECTION_ID"
    else
      nmcli con up id "$CONNECTION_ID"
    fi
    ;;
  status)
    if nmcli -t -f NAME,TYPE con show --active | grep -q "^$CONNECTION_ID:.*"; then
      echo '{"text":"● VPN", "class":"on"}'
    else
      echo '{"text":"● VPN", "class":"off"}'
    fi
    ;;
esac

