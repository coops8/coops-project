#!/bin/bash

echo ">>> CoopsOS Setup Phase 2: Boot Animation, Sound, and Voice Control"

# Ensure coopsos folder exists
mkdir -p coopsos/{bootloader,recovery,scripts,system,assets,voice}
cd coopsos

# === boot_play.sh ===
cat <<'EOF' > scripts/boot_play.sh
#!/system/bin/sh
# CoopsOS Boot Audio & Animation Script
BOOT_SOUND="/system/media/audio/boot_sound.mp3"
BOOT_ANIM="/system/media/bootanimation.zip"

echo "Playing CoopsOS Boot Sound..."
if command -v play &> /dev/null; then
    play $BOOT_SOUND &
elif command -v mpv &> /dev/null; then
    mpv $BOOT_SOUND --no-video &
fi

echo "Displaying Boot Animation..."
if [ -f "$BOOT_ANIM" ]; then
    cp $BOOT_ANIM /data/local/bootanimation.zip
    chmod 644 /data/local/bootanimation.zip
    chown system:system /data/local/bootanimation.zip
fi
EOF

# === coops_voice.sh ===
cat <<'EOF' > voice/coops_voice.sh
#!/system/bin/sh
# CoopsOS Voice Command Processor (Prototype)
echo "CoopsGPT Voice Command Mode Activated"

read -p "Say a command: " command
case $command in
    "enable USB debugging")
        echo "Enabling USB Debugging..."
        settings put global adb_enabled 1
        ;;
    "disable notifications")
        echo "Disabling all notifications temporarily..."
        settings put global heads_up_notifications_enabled 0
        ;;
    "reset APIs")
        echo "Resetting system APIs..."
        pm clear com.android.shell
        ;;
    *)
        echo "Unrecognized command: $command"
        ;;
esac
EOF

# === Assets Setup ===
touch assets/boot_sound.mp3
touch assets/bootanimation.zip

# === Permissions ===
chmod +x scripts/boot_play.sh
chmod +x voice/coops_voice.sh

# === Git Prep ===
cd ..
git add coopsos
echo ">>> Boot flair & voice command system installed into CoopsOS!"
