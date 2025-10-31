set -e

echo "-----Linux NAS Backup Installer-----"

read -rp "Enter the NAS IP adress: " NAS_IP
read -rp "Enter the NAS username: " NAS_USER

echo ""
echo "What do you want to backup?"
echo "Example: /home/youruser/Documents"
echo "Or type in / to ackup whole system (be careful this includes everything on the system may take hours on first backup)"
read -rp "Enter local path to backup: " LOCAL_PATH

sed -i "s|NAS_IP=\"__CHANGE_ME__\"|NAS_IP=\"$NAS_IP\"|" git-backup
sed -i "s|NAS_USER=\"backupuser\"|NAS_USER=\"$NAS_USER\"|" git-backup
sed -i "s|LOCAL_PATH=\"$HOME/Documents\"|LOCAL_PATH=\"$LOCAL_PATH\"|" git-backup.sh
sed -i "s|NAS_PATH=\"/volume1/backups\"|NAS_PATH=\"$NAS_PATH\"|" git-backup.sh

chmod +x git-backup.sh
chmod +x install.sh
echo ""
echo "Now please create a folder named backups on your NAS"
echo "After creating folder backups and your ready please enter command  ./git-backup.sh to start the backup"

#commit
