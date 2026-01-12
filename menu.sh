#!/bin/bash

# ==================================
#   Nobita Hosting - MAIN MENU
#   FIXED FOR curl | bash
# ==================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CD_DIR="$SCRIPT_DIR/cd"

# Colors
GREEN="\033[1;32m"
CYAN="\033[1;36m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
NC="\033[0m"

# Root check
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}❌ Run as root: sudo -i${NC}"
  exit 1
fi

# Ensure cd folder exists
if [ ! -d "$CD_DIR" ]; then
  echo -e "${RED}❌ cd/ folder not found: $CD_DIR${NC}"
  exit 1
fi

# Fix permissions
chmod +x "$CD_DIR"/*.sh 2>/dev/null

pause() {
  echo
  read -r -p "Press Enter to continue..." < /dev/tty
}

while true; do
  clear
  echo -e "${CYAN}====================================${NC}"
  echo -e "${CYAN}     🚀 NOBITA HOSTING MANAGER       ${NC}"
  echo -e "${CYAN}====================================${NC}"
  echo
  echo -e "${GREEN}1) Install Pterodactyl Panel${NC}"
  echo -e "${GREEN}2) Install Pterodactyl Wings${NC}"
  echo -e "${GREEN}3) Update Panel${NC}"
  echo -e "${GREEN}4) Blueprint Installer${NC}"
  echo -e "${GREEN}5) Cloudflare Setup${NC}"
  echo -e "${GREEN}6) Change Theme${NC}"
  echo -e "${GREEN}7) Uninstall Panel / Wings${NC}"
  echo -e "${GREEN}8) SSH Configuration${NC}"
  echo -e "${GREEN}9) System Info${NC}"
  echo -e "${RED}0) Exit${NC}"
  echo

  # 👇 THIS IS THE KEY FIX
  read -r -p "Select option: " choice < /dev/tty

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
    0)
      echo -e "${GREEN}👋 Exiting...${NC}"
      exit 0
      ;;
    *)
      echo -e "${RED}❌ Invalid option${NC}"
      ;;
  esac

  pause
done
