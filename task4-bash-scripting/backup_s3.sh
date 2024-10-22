#!/bin/bash
BACKUP_BUCKET="s3://backup-bucket"

for bucket in $(aws s3 ls | awk '{print $3}'); do
  echo "Backing up $bucket..."
  aws s3 sync s3://$bucket $BACKUP_BUCKET/$bucket --delete >> backup_log.txt 2>&1
  if [ $? -eq 0 ]; then
    size=$(aws s3 ls --summarize --human-readable --recursive s3://$bucket | grep "Total Size")
    echo "$bucket: $size" >> backup_log.txt
  else
    echo "Error backing up $bucket" >> backup_log.txt
  fi
done