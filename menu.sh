#!/bin/bash

# ===============================
#  Nobita Hosting Control Panel
# ===============================

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
CD_DIR="$BASE_DIR/cd"

# Colors
GREEN="\e[32m"
CYAN="\e[36m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

# Root check
if [[ "$EUID" -ne 0 ]]; then
  echo -e "${RED}❌ Please run as root (sudo -i)${RESET}"
  exit 1
fi

pause() {
  echo
  read -p "Press Enter to continue..."
}

while true; do
  clear
  echo -e "${CYAN}=====================================${RESET}"
  echo -e "${CYAN}      🚀 NOBITA HOSTING MANAGER       ${RESET}"
  echo -e "${CYAN}=====================================${RESET}"
  echo
  echo -e "${GREEN}1) Install Pterodactyl Panel${RESET}"
  echo -e "${GREEN}2) Install Pterodactyl Wings${RESET}"
  echo -e "${GREEN}3) Update Panel${RESET}"
  echo -e "${GREEN}4) Blueprint Installer${RESET}"
  echo -e "${GREEN}5) Cloudflare Setup${RESET}"
  echo -e "${GREEN}6) Change Theme${RESET}"
  echo -e "${GREEN}7) Uninstall (Panel / Wings)${RESET}"
  echo -e "${GREEN}8) SSH Configuration${RESET}"
  echo -e "${GREEN}9) System Info${RESET}"
  echo -e "${RED}0) Exit${RESET}"
  echo
  read -p "Select option: " choice

  case "$choice" in
    1)
      bash "$CD_DIR/panel.sh"
      pause
      ;;
    2)
      bash "$CD_DIR/wing.sh"
      pause
      ;;
    3)
      bash "$CD_DIR/up.sh"
      pause
      ;;
    4)
      bash "$CD_DIR/blueprint.sh"
      pause
      ;;
    5)
      bash "$CD_DIR/cloudflare.sh"
      pause
      ;;
    6)
      bash "$CD_DIR/th.sh"
      pause
      ;;
    7)
      bash "$CD_DIR/uninstalll.sh"
      pause
      ;;
    8)
      bash "$CD_DIR/root2.sh"
      pause
      ;;
    9)
      bash "$CD_DIR/root"
      pause
      ;;
    0)
      echo -e "${GREEN}👋 Exiting Nobita Hosting Manager${RESET}"
      exit 0
      ;;
    *)
      echo -e "${RED}❌ Invalid option${RESET}"
      pause
      ;;
  esac
done
