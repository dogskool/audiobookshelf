#!/bin/sh
# Auto-restart wrapper for the dev server
# Restarts the server if it crashes, with a brief delay to avoid tight restart loops

cd /workspaces/audiobookshelf

while true; do
  echo "[start-server] Starting audiobookshelf dev server..."
  npm run dev
  EXIT_CODE=$?
  echo "[start-server] Server exited with code $EXIT_CODE. Restarting in 3 seconds..."
  sleep 3
done
