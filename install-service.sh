#!/bin/bash
# Helper script to install the LaunchAgent

PLIST_DEST="$HOME/Library/LaunchAgents/com.github.wake-my-nas.plist"
WAKE_MY_NAS_BIN="$(which wake-my-nas)"

if [ -z "$WAKE_MY_NAS_BIN" ]; then
    echo "Error: wake-my-nas not found. Install with: brew install dgeske/tap/wake-my-nas"
    exit 1
fi

# Create plist
cat > "$PLIST_DEST" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.github.wake-my-nas</string>
    <key>ProgramArguments</key>
    <array>
        <string>$WAKE_MY_NAS_BIN</string>
    </array>
    <key>WatchPaths</key>
    <array>
        <string>/private/var/run/systemkeychaincheck.done</string>
    </array>
    <key>StandardOutPath</key>
    <string>/tmp/wake-my-nas.log</string>
    <key>StandardErrorPath</key>
    <string>/tmp/wake-my-nas-error.log</string>
    <key>KeepAlive</key>
    <false/>
    <key>ProcessType</key>
    <string>Background</string>
    <key>ThrottleInterval</key>
    <integer>30</integer>
</dict>
</plist>
EOF

launchctl load "$PLIST_DEST"

echo "SUCCESS: Service installed and started!"
echo "Your device will now wake automatically when your Mac wakes."
