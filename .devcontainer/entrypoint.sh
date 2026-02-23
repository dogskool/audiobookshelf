#!/bin/sh
set -e
cd /workspaces/audiobookshelf
mkdir -p metadata/logs
LOG_FILE="metadata/logs/server-console.log"
if [ ! -d node_modules ] || [ ! -d client/node_modules ]; then
  echo "[entrypoint] Running post-create setup..." >> "$LOG_FILE" 2>&1
  sh .devcontainer/post-create.sh >> "$LOG_FILE" 2>&1
fi
echo "[$(date)] Starting audiobookshelf dev server..." >> "$LOG_FILE"
exec npm run dev >> "$LOG_FILE" 2>&1
