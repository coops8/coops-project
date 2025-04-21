#!/bin/bash

echo ">>> Starting CoopsOS Phase 3 project structure + Git auto-commit..."

# Create folders
mkdir -p coopsos/scripts
mkdir -p coopsos/config
mkdir -p coopsos/system-apps/CoopsClock
mkdir -p coopsos/logs

echo "[+] Folders created."

# Create config file
cat <<EOF > coopsos/config/settings.conf
# CoopsOS Configuration File
DEFAULT_LANGUAGE=en
ENABLE_DARK_MODE=true
SECURITY_LEVEL=MAX
UPDATE_CHANNEL=DEV
EOF
echo "[+] settings.conf created."

# Create update script
cat <<'EOF' > coopsos/scripts/coops-update.sh
#!/bin/bash
echo ">>> Starting CoopsOS update process..."
echo "Checking keys, verifying system integrity..."
bash ./coopsos/scripts/validate-key.sh
echo "Downloading updates..."
# Placeholder for real update logic
echo "System updated successfully!"
EOF
chmod +x coopsos/scripts/coops-update.sh
echo "[+] coops-update.sh created."

# Create validation script
cat <<'EOF' > coopsos/scripts/validate-key.sh
#!/bin/bash
VALID_KEY="coops-rom123654"
read -p "Enter Developer Key: " entered
if [[ "$entered" == "$VALID_KEY" ]]; then
  echo "Key accepted. Access granted."
else
  echo "Invalid key. Access denied."
  exit 1
fi
EOF
chmod +x coopsos/scripts/validate-key.sh
echo "[+] validate-key.sh created."

# Create dummy system app
cat <<'EOF' > coopsos/system-apps/CoopsClock/run.sh
#!/bin/bash
echo "Launching CoopsClock..."
# Placeholder logic
date
EOF
chmod +x coopsos/system-apps/CoopsClock/run.sh
echo "[+] CoopsClock app created."

# Git auto-commit
echo ">>> Adding files to Git..."
git add .
git commit -m "Auto-generated CoopsOS Phase 3 structure"
git push origin master

echo ">>> CoopsOS Phase 3 pushed to GitHub successfully!"
