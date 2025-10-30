set -e
NAS_IP="__CHANGE_ME__"
NAS_USER="backupuser"
NAS_PATH="/volume1/backups"
LOCAL_PATH="$HOME/Documents/"

echo "Starting backup process to NAS at $NAS_IP..."

rsync -av --delete  "$LOCAL_PATH" "${NAS_USER}@${NAS_IP}:${NAS_PATH}" #please if you read this --delete means if file is deleted on device it will delete on nas too not what you think :)

echo "Backup was completed!"
