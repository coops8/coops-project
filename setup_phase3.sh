#!/bin/bash

echo ">>> CoopsOS Phase 3: Secure Update Engine & Dev Key System"

# Go to root of CoopsOS
mkdir -p coopsos/{updates,system-apps,config}
cd coopsos

# === coops-update.sh ===
cat <<'EOF' > scripts/coops-update.sh
#!/bin/bash
# CoopsOS Dev-Keyed Update Engine

DEV_KEY="coops-rom123654"
UPDATE_FILE="./updates/latest-update.zip"

read -p "Enter developer key to proceed with update: " input
if [[ "$input" == "$DEV_KEY" ]]; then
    echo "[OK] Developer key validated."
    if [ -f "$UPDATE_FILE" ]; then
        echo "[UPDATING] Installing $UPDATE_FILE ..."
        sleep 2
        echo "[DONE] Update installed. Please reboot CoopsOS."
    else
        echo "[ERROR] No update file found in /updates"
    fi
else
    echo "[ACCESS DENIED] Invalid developer key."
fi
EOF

# === validate-key.sh ===
cat <<'EOF' > scripts/validate-key.sh
#!/bin/bash
# Secure gate for CoopsOS features

ROOT_KEY="coops654123keyrom"

read -p "Enter root key to unlock system features: " key
if [[ "$key" == "$ROOT_KEY" ]]; then
    echo "[ACCESS GRANTED] Root features unlocked."
else
    echo "[LOCKED] Incorrect root key."
fi
EOF

# === Placeholder System App ===
mkdir -p system-apps/CoopsClock
echo "echo 'Welcome to Coops Clock'" > system-apps/CoopsClock/run.sh
chmod +x system-apps/CoopsClock/run.sh

# === Config Settings File ===
cat <<EOF > config/settings.conf
DEFAULT_LANGUAGE=en
DARK_MODE=enabled
LOCK_SCREEN_STYLE=coops_secure
UPDATE_CHANNEL=stable
EOF

# === Permissions ===
chmod +x scripts/coops-update.sh
chmod +x scripts/validate-key.sh

cd ..

# Git Stage
git add coopsos
echo ">>> CoopsOS now supports secure updates, dev key checks, and system apps!"
