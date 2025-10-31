# 🧰 Linux Device → NAS Backup Tool

A lightweight, reliable, and secure backup solution designed to automate file synchronization between a **Linux device** and a **Linux-based NAS server**.  
Built for home labs, developers, and small teams who want robust, incremental, and encrypted backups without the complexity of enterprise systems.

---

## 🚀 Features

- 🔄 **Incremental Backups** using `rsync` or `rclone`
- 🔐 **Secure Transfers** via SSH with key-based authentication
- 🕒 **Automated Scheduling** via `systemd` or `cron`
- 🧩 **Configurable Exclusion Rules** for temporary or large files
- 📦 **Compression and Versioning** options
- 🧠 **Smart Sync Mode**: only transfer changed files
- 📝 **Detailed Logs** and email notifications (optional)

---

## Installation

Clone the repository and run the installer in this order : 

git clone https://github.com/Niko203-code/NAS-Linux-automated_backup, 
cd linux-nas-backup, 
./install.sh, 
