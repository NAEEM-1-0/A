#!/bin/bash

# Force input from terminal (fixes auto-run)
exec </dev/tty

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
CD_DIR="$BASE_DIR/cd"

# Root check
[ "$EUID" -ne 0 ] && echo "Run as root" && exit 1

while true; do
  echo
  echo "1) panel"
  echo "2) wings"
  echo "3) update"
  echo "4) blueprint"
  echo "5) cloudflare"
  echo "6) theme"
  echo "7) uninstall"
  echo "8) ssh"
  echo "9) system info"
  echo "0) exit"
  echo

  read -r choice

  case "$choice" in
    1) bash "$CD_DIR/panel.sh" ;;
    2) bash "$CD_DIR/wing.sh" ;;
    3) bash "$CD_DIR/up.sh" ;;
    4) bash "$CD_DIR/blueprint.sh" ;;
    5) bash "$CD_DIR/cloudflare.sh" ;;
    6) bash "$CD_DIR/th.sh" ;;
    7) bash "$CD_DIR/uninstalll.sh" ;;
    8) bash "$CD_DIR/root2.sh" ;;
    9) bash "$CD_DIR/root" ;;
    0) exit ;;
    *) echo "invalid option" ;;
  esac
done
