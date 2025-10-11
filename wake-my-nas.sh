#!/bin/bash

# ============================================================================
# wake-my-nas - Automatic Wake-on-LAN for macOS
# ============================================================================
# Automatically sends WoL magic packets when your Mac wakes up.
# Works with any WoL-enabled device: NAS, servers, desktops, etc.
# ============================================================================

VERSION="1.0.0"
CONFIG_FILE="$HOME/.config/wake-my-nas/config"

# -------------------- CONFIGURATION --------------------

load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    else
        TARGET_MAC="00:11:22:33:44:55"
        TARGET_IP="192.168.1.100"
        EXPECTED_SSID="YourHomeNetwork"
        EXPECTED_SUBNET="192.168.1"
    fi
    LOG_FILE="$HOME/Library/Logs/wake-my-nas.log"
}

create_default_config() {
    mkdir -p "$(dirname "$CONFIG_FILE")"
    cat > "$CONFIG_FILE" << 'EOF'
# wake-my-nas configuration
TARGET_MAC="00:11:22:33:44:55"
TARGET_IP=""  # Optional: set to skip redundant packets if device is already awake
EXPECTED_SSID=""  # Optional: only run on this Wi-Fi network
EXPECTED_SUBNET=""  # Optional: only run on this subnet
EOF
    echo "Created config file: $CONFIG_FILE"
    echo "Edit it with your device settings."
}

# -------------------- FUNCTIONS --------------------

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

notify() {
    osascript -e "display notification \"$1\" with title \"wake-my-nas\"" 2>/dev/null || true
}

validate_mac() {
    if [[ ! "$TARGET_MAC" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
        log "❌ Invalid MAC address format: $TARGET_MAC"
        notify "Invalid MAC address. Run: wake-my-nas --edit"
        exit 1
    fi
}

validate_ip() {
    if [[ ! "$TARGET_IP" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        log "❌ Invalid IP address format: $TARGET_IP"
        notify "Invalid IP address. Run: wake-my-nas --edit"
        exit 1
    fi
}

check_wakeonlan() {
    if ! command -v wakeonlan &> /dev/null; then
        log "⚠️  wakeonlan not found. Install with: brew install wakeonlan"
        notify "wakeonlan not installed. Run: brew install wakeonlan"
        exit 1
    fi
}

check_config() {
    if [ "$TARGET_MAC" = "00:11:22:33:44:55" ]; then
        log "⚠️  Default config detected. Please configure your device."
        notify "Please configure your device: wake-my-nas --edit"
        exit 1
    fi
    validate_mac
    if [ -n "$TARGET_IP" ]; then
        validate_ip
    fi
}

get_current_ssid() {
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print $2}'
}

check_network() {
    if [ -n "$EXPECTED_SSID" ]; then
        CURRENT_SSID=$(get_current_ssid)
        if [ "$CURRENT_SSID" != "$EXPECTED_SSID" ]; then
            log "❌ Not on expected network. Current: $CURRENT_SSID, Expected: $EXPECTED_SSID"
            exit 0
        fi
        log "✓ Connected to $CURRENT_SSID"
    fi

    if [ -n "$EXPECTED_SUBNET" ]; then
        CURRENT_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
        if [[ ! "$CURRENT_IP" =~ ^$EXPECTED_SUBNET\. ]]; then
            log "❌ Not on expected subnet. Current IP: $CURRENT_IP"
            exit 0
        fi
        log "✓ On expected subnet: $CURRENT_IP"
    fi
}

check_device_awake() {
    if [ -z "$TARGET_IP" ]; then
        log "ℹ️  No IP configured, skipping ping check"
        return
    fi
    if ping -c 1 -W 2 "$TARGET_IP" &> /dev/null; then
        log "✓ Device already awake at $TARGET_IP"
        exit 0
    fi
}

send_wol() {
    log "📡 Sending Wake-on-LAN packet to $TARGET_MAC..."
    wakeonlan "$TARGET_MAC" >> "$LOG_FILE" 2>&1
    log "✓ Magic packet sent"
}

# -------------------- MAIN --------------------

# Handle CLI arguments
case "${1:-}" in
    --version|-v)
        echo "wake-my-nas v$VERSION"
        exit 0
        ;;
    --edit|-e)
        if [ ! -f "$CONFIG_FILE" ]; then
            create_default_config
        fi
        ${EDITOR:-nano} "$CONFIG_FILE"
        exit 0
        ;;
    --init)
        create_default_config
        exit 0
        ;;
    --help|-h)
        echo "wake-my-nas v$VERSION - Automatic Wake-on-LAN for macOS"
        echo ""
        echo "Usage: wake-my-nas [OPTIONS]"
        echo ""
        echo "Options:"
        echo "  --init          Create default config file"
        echo "  --edit, -e      Edit config file"
        echo "  --discover      Scan network for devices (helps find MAC addresses)"
        echo "  --version, -v   Show version"
        echo "  --help, -h      Show this help"
        echo ""
        echo "Config: $CONFIG_FILE"
        echo "Logs:   $HOME/Library/Logs/wake-my-nas.log"
        exit 0
        ;;
    --discover)
        echo "Scanning local network for devices..."
        echo "This may take a moment..."
        echo ""
        arp -a | grep -v "incomplete" | sort
        echo ""
        echo "Copy the MAC address (format: aa:bb:cc:dd:ee:ff) to your config:"
        echo "  wake-my-nas --edit"
        exit 0
        ;;
esac

load_config
log "========== wake-my-nas v$VERSION started =========="

check_wakeonlan
check_config
check_network
check_device_awake
send_wol
notify "Device wake signal sent successfully"

log "========== wake-my-nas complete =========="
