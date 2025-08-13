#!/bin/bash

# Get today's date
date=$(date +%F)

# Define backup folder and archive path
backup_dir="/home/vishnu/Backup_$date"
archive_file="/home/vishnu/Backup_$date.tar.gz"

echo "🔄 Starting backup..."

# Create backup directory
sudo mkdir -p "$backup_dir"

# Copy important config files
sudo cp /etc/hosts "$backup_dir/"
sudo cp /etc/fstab "$backup_dir/"
sudo cp /etc/hostname "$backup_dir/"
sudo cp /etc/ssh/sshd_config "$backup_dir/"

# Compress the backup folder
sudo tar -czvf "$archive_file" -C /home/vishnu "Backup_$date"

echo "✅ Backup complete: $archive_file"
