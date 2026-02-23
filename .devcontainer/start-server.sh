#!/bin/sh
# Auto-restart wrapper for the dev server
# Restarts the server if it crashes, with a brief delay to avoid tight restart loops
# Redirects stdout/stderr to a log file to prevent EPIPE errors from broken pipes
LOG_FILE="/workspaces/audiobookshelf/metadata/logs/server-console.log"
cd /workspaces/audiobookshelf
mkdir -p metadata/logs
while true; do
  echo "[$(date)] Starting audiobookshelf dev server..." >> "$LOG_FILE"
  npm run dev >> "$LOG_FILE" 2>&1
  EXIT_CODE=$?
  echo "[$(date)] Server exited with code $EXIT_CODE. Restarting in 3 seconds..." >> "$LOG_FILE"
  sleep 3
done
