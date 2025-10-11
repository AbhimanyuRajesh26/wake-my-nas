# wake-my-nas

**Automatic Wake-on-LAN for macOS**

Automatically wake your NAS, server, or any WoL-enabled device when your Mac wakes from sleep. No more waiting for your network storage to spin up—it's ready when you need it.

## Why

I got tired of opening my MacBook and waiting 30 seconds for my Synology NAS to wake up before I could access my files. This tool solves that by sending a Wake-on-LAN packet the moment macOS wakes, so your storage is ready by the time you need it. Simple automation that saves time every single day.

---

## Quick Start

```bash
brew tap dgeske/tap
brew install wake-my-nas
wake-my-nas --discover                # Find your device's MAC address
wake-my-nas --edit                    # Set MAC (IP optional)
wake-my-nas-install-service           # Done
```

Your device now wakes automatically when your Mac wakes.

---

## Configuration

**Find your device on the network:**
```bash
wake-my-nas --discover
```

When you run `wake-my-nas --edit`, set these values:

```bash
TARGET_MAC="00:11:22:33:44:55"    # Required: Your device's MAC address
TARGET_IP="192.168.1.100"         # Optional: Skip if device already awake
EXPECTED_SSID="YourHomeNetwork"   # Optional: Only run on this Wi-Fi
EXPECTED_SUBNET="192.168.1"       # Optional: Only run on this subnet
```

**Enable Wake-on-LAN on your device:**
- Synology NAS: Control Panel → Hardware & Power → Enable Wake on LAN
- Other devices: Check BIOS/network settings
- Must be connected via Ethernet (Wi-Fi doesn't support WoL)

---

## View Logs

```bash
tail -f /tmp/wake-my-nas.log
```

---

## Uninstall

```bash
launchctl unload ~/Library/LaunchAgents/com.github.wake-my-nas.plist
rm ~/Library/LaunchAgents/com.github.wake-my-nas.plist
brew uninstall wake-my-nas
```

---

## How It Works

1. Mac wakes (lid open, power button, etc.)
2. Checks if you're on the right network
3. Pings device to see if already awake
4. Sends WoL packet only if needed

---

## Keywords

Wake-on-LAN, WoL, NAS automation, Synology wake, network storage, automatic wake, Mac sleep wake, LaunchAgent, magic packet, server wake, home server, network attached storage, macOS automation

---

## License

Public domain. Do whatever you want.
