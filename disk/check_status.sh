#!/bin/bash

# Gets disk statuses and emails them to the admin
# Runs via cron as root every Monday @ 3:15 AM

# Set environment
. /donnager/sys/scripts/util/set_env.sh

l_log_path="$DIR_LOGS/disk/$(gstime).txt"
l_email=$(cat $DIR_SECRETS/disk/email)

# Start email
echo "Subject: SIRIUS Disk Status" > $l_log_path
echo "Content-Type: text/html" >> $l_log_path
echo "<html>" >> $l_log_path
echo "<style type=\"text/css\">pre { font-family:monospace }</style>" >> $l_log_path
echo "<body>" >> $l_log_path
echo "<pre>" >> $l_log_path

# ZFS Pool Status
echo "=== ZFS Pool Status ===" >> $l_log_path
echo "" >> $l_log_path
/usr/sbin/zpool status >> $l_log_path

# SMART Status
echo "" >> $l_log_path
echo "=== SMART Status ===" >> $l_log_path
echo "" >> $l_log_path

echo "/dev/nvme0n1:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/nvme0n1" >> $l_log_path

echo "/dev/sda:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sda" >> $l_log_path

echo "/dev/sdb:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sdb" >> $l_log_path

echo "/dev/sdc:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sdc" >> $l_log_path

echo "/dev/sdd:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sdd" >> $l_log_path

echo "/dev/sde:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sde" >> $l_log_path

echo "/dev/sdf:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sdf" >> $l_log_path

echo "/dev/sdg:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sdg" >> $l_log_path

echo "/dev/sdh:" >> $l_log_path
/usr/sbin/smartctl -H "/dev/sdh" >> $l_log_path

# Close email
echo "</pre></body></html>" >> $l_log_path

# Send email
/usr/bin/msmtp "$l_email" < $l_log_path

# Clear local variables
unset l_log_path
unset l_email
