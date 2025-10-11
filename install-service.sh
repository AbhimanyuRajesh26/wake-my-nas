#!/bin/bash
# Helper script to install the LaunchAgent

PLIST_SRC="$(brew --prefix wake-my-nas)/com.github.wake-my-nas.plist"
PLIST_DEST="$HOME/Library/LaunchAgents/com.github.wake-my-nas.plist"

if [ ! -f "$PLIST_SRC" ]; then
    echo "Error: wake-my-nas not installed via Homebrew"
    exit 1
fi

cp "$PLIST_SRC" "$PLIST_DEST"
sed -i '' "s|BREW_PREFIX|$(brew --prefix)|g" "$PLIST_DEST"
launchctl load "$PLIST_DEST"

echo "SUCCESS: Service installed and started!"
echo "Your device will now wake automatically when your Mac wakes."
