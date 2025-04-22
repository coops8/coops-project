#!/bin/bash

echo "=== CoopsOS Boot Suite Setup ==="

# Set base directory
BASE_DIR=~/coops-project
SYS_MEDIA="$BASE_DIR/system/media"
SYS_AUDIO="$SYS_MEDIA/audio/ui"
UI_DIR="$BASE_DIR/system/etc/coops_ui"

# Create necessary folders
mkdir -p "$SYS_MEDIA" "$SYS_AUDIO" "$UI_DIR"

# Move assets into place
echo "[+] Installing boot animation..."
cp "$BASE_DIR/bootanimation.zip" "$SYS_MEDIA/"

echo "[+] Installing boot sound..."
cp "$BASE_DIR/boot_sound.mp3" "$SYS_AUDIO/"

echo "[+] Setting up hologram BIOS and bootloader screens..."
cp "$BASE_DIR/bios_screen.txt" "$UI_DIR/"
cp "$BASE_DIR/bootloader_ui.txt" "$UI_DIR/"

echo ""
echo "=== Boot Suite Installed ==="
echo "- bootanimation.zip: $SYS_MEDIA"
echo "- boot_sound.mp3: $SYS_AUDIO"
echo "- BIOS + Bootloader UI: $UI_DIR"
echo ""
echo "Launch sequence for CoopsOS boot aesthetics is a go."
