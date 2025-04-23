#!/bin/sh

Backup_Name="pfSense_Backup_$(date +'%Y%m%d%H%M%S').xml"
URL="https://10.10.10.1/diag_backup.php"
Backup_Path="/home/mguajardo606"

USER="admin"
PASS="Omegahd08@!"

mkdir -p $Backup_Path

curl -k -u $USER:$PASS $URL -o $Backup_Path/$Backup_Name
echo "Backup completed successfully: $Backup_Path/$Backup_Name"
