#!/bin/bash

dir_target="/sicher/backup.00/backup-disk"

echo "==> home <=="
rsync -ruhv --no-links --delete --delete-excluded \
  /home/torben/ $dir_target/home

echo "==> etc <=="
rsync -ruhv --no-links --delete --delete-excluded \
  /etc/ $dir_target/etc

date +"%Y-%m-%d_%H:%M" > $dir_target/date.txt