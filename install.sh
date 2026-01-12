#!/bin/bash
set -e

REPO="https://github.com/NAEEM-1-0/A"
DIR="/opt/A"

echo "Downloading installer..."

rm -rf "$DIR"
git clone "$REPO" "$DIR"

cd "$DIR"
chmod +x menu.sh cd/*.sh

sudo ./menu.sh
