#!/bin/bash

echo ">>> Starting CoopsOS Phase 3 project structure + Git auto-commit..."

# Git auto-pull before pushing to ensure the latest code
git pull origin master || { echo "Git pull failed. Exiting..."; exit 1; }
echo "[+] Git pull successful."

# Create folders
mkdir -p coopsos/scripts
mkdir -p coopsos/config
mkdir -p coopsos/system-apps/CoopsClock
mkdir -p coopsos/logs

echo "[+] Folders created."

# Create config file with settings
cat <<EOF > coopsos/config/settings.conf
# CoopsOS Configuration File
DEFAULT_LANGUAGE=en
ENABLE_DARK_MODE=true
SECURITY_LEVEL=MAX
UPDATE_CHANNEL=DEV
EOF
echo "[+] settings.conf created."

# Create .env file for sensitive data (tokens, keys, etc.)
cat <<EOF > .env
# CoopsOS Secrets
VALID_KEY=coops-rom123654
GITHUB_TOKEN=your-github-token-here
EOF
echo "[+] .env file created."

# Create update script
cat <<'EOF' > coopsos/scripts/coops-update.sh
#!/bin/bash
echo ">>> Starting CoopsOS update process..."
source .env  # Load environment variables from .env file

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
source .env  # Load environment variables from .env file
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

# Create version.txt for tracking CoopsOS version
cat <<EOF > version.txt
CoopsOS Version: 1.0.0
Build Date: $(date +'%Y-%m-%d %H:%M:%S')
EOF
echo "[+] version.txt created."

# Git commit and push
echo ">>> Adding files to Git..."
git add .
git commit -m "Auto-generated CoopsOS Phase 3 structure with version and secrets"
git push origin master

echo ">>> CoopsOS Phase 3 pushed to GitHub successfully!"
