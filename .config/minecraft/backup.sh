#!/bin/bash

# Define the directories
MINECRAFT_DIR="$HOME/Library/Application Support/minecraft/saves"
BACKUP_DIR="$HOME/Documents/04 - Archive/Minecraft/Back Ups"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Loop through each world directory and create (or override) a compressed backup
for WORLD in "$MINECRAFT_DIR"/*; do
    if [ -d "$WORLD" ]; then
        WORLD_NAME=$(basename "$WORLD")
        BACKUP_FILE="$BACKUP_DIR/${WORLD_NAME}_backup.tar.gz"
        tar -czf "$BACKUP_FILE" -C "$MINECRAFT_DIR" "$WORLD_NAME"
        echo "Backup of $WORLD_NAME completed: $BACKUP_FILE"
    fi
done

echo "All Minecraft worlds have been backed up and existing backups have been updated."
