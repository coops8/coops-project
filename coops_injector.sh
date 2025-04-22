#!/bin/bash

echo ">>> CoopsOS BootSuite Injector & ROM Builder <<<"

BASE_DIR=~/coops-project
ROM_DIR=~/coops-rom/system

# Create target directories
mkdir -p "$ROM_DIR/media/audio/ui"
mkdir -p "$ROM_DIR/etc/coops_ui"
mkdir -p ~/coops-project/build_output

echo "[+] Copying boot files into system..."

cp "$BASE_DIR/bootanimation.zip" "$ROM_DIR/media/"
cp "$BASE_DIR/boot_sound.mp3" "$ROM_DIR/media/audio/ui/"
cp "$BASE_DIR/bios_screen.txt" "$ROM_DIR/etc/coops_ui/"
cp "$BASE_DIR/bootloader_ui.txt" "$ROM_DIR/etc/coops_ui/"

echo "[✓] Assets injected into CoopsOS system tree."
