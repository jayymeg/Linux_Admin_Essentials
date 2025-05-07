#!/bin/bash
SOURCE_DIR=$1
BACKUP_DIR=$2
TIMESTAMP=$(date +"%Y%m%d%H%M%S")  # Fixed date format
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"  # Fixed variable name
if [ -d "$SOURCE_DIR" ]; then
    tar -czf "$BACKUP_FILE" "$SOURCE_DIR"  # Corrected tar command (-czf)
    echo "Backup completed: $BACKUP_FILE"
else
    echo "Source directory '$SOURCE_DIR' does not exist."  # Fixed typo
fi
