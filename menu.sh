#!/bin/bash

CD_DIR="$(pwd)/cd"

while true; do
  echo
  echo "1 panel"
  echo "2 wings"
  echo "3 update"
  echo "4 blueprint"
  echo "5 cloudflare"
  echo "6 theme"
  echo "7 uninstall"
  echo "0 exit"
  echo

  read choice

  case "$choice" in
    1) bash "$CD_DIR/panel.sh" ;;
    2) bash "$CD_DIR/wing.sh" ;;
    3) bash "$CD_DIR/up.sh" ;;
    4) bash "$CD_DIR/blueprint.sh" ;;
    5) bash "$CD_DIR/cloudflare.sh" ;;
    6) bash "$CD_DIR/th.sh" ;;
    7) bash "$CD_DIR/uninstalll.sh" ;;
    0) exit ;;
    *) echo "invalid" ;;
  esac
done
