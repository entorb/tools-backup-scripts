#!/bin/bash

dir_target="/sicher/raspi3"
host="pi@raspi3"

echo "==> remote: sicher-all-zip.sh <=="
ssh $host "bash ~/bin/sicher-all-zip.sh"

echo "==> rsync of /tmp/*.tgz <=="
rsync -ruhv --no-links --delete --delete-excluded \
  $host:/tmp/*.tgz $dir_target/
date +"%Y-%m-%d_%H:%M" > $dir_target/date.txt  
