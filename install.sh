#!/bin/bash
set -e

echo "----- Linux NAS Backup Installer -----"

# Prompt user for NAS information
read -rp "Enter the NAS IP address: " NAS_IP
read -rp "Enter the NAS username: " NAS_USER
read -rp "Enter the NAS backup path (default: /volume1/backups): " NAS_PATH
NAS_PATH=${NAS_PATH:-/volume1/backups}

echo ""
echo "What do you want to back up?"
echo "Example: /home/youruser/Documents"
echo "Or type '/' to back up the whole system (⚠️ this includes everything and may take hours)"
read -rp "Enter local path to back up: " LOCAL_PATH

# Validate path
if [ ! -d "$LOCAL_PATH" ]; then
  echo "❌ Error: The path '$LOCAL_PATH' does not exist."
  exit 1
fi

# Escape slashes in paths for safe sed replacement
ESCAPED_LOCAL_PATH=$(printf '%s\n' "$LOCAL_PATH" | sed 's/[\/&]/\\&/g')
ESCAPED_NAS_PATH=$(printf '%s\n' "$NAS_PATH" | sed 's/[\/&]/\\&/g')

# Update variables inside git-backup.sh
sed -i "s|NAS_IP=\"__CHANGE_ME__\"|NAS_IP=\"$NAS_IP\"|" git-backup.sh
sed -i "s|NAS_USER=\"backupuser\"|NAS_USER=\"$NAS_USER\"|" git-backup.sh
sed -i "s|NAS_PATH=\"/volume1/backups\"|NAS_PATH=\"$ESCAPED_NAS_PATH\"|" git-backup.sh
sed -i "s|LOCAL_PATH=\"$HOME/Documents/\"|LOCAL_PATH=\"$ESCAPED_LOCAL_PATH\"|" git-backup.sh

# Set permissions
chmod +x git-backup.sh install.sh

echo ""
echo "✅ Configuration complete!"
echo "Once ready, run:"
echo "   ./git-backup.sh"
echo ""
echo "Your backup will start using these settings:"
echo "   NAS IP:      $NAS_IP"
echo "   NAS User:    $NAS_USER"
echo "   NAS Path:    $NAS_PATH"
echo "   Local Path:  $LOCAL_PATH"

