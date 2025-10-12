# wake-my-nas

**Automatic Wake-on-LAN for macOS**

Automatically wake your server, desktop, or any WoL-enabled device when your Mac wakes from sleep.

## ⚠️ Important Note About NAS Usage

**Thanks to feedback from the community:** Using WoL with a NAS that stores critical data may not be ideal. Here's why:

- **Availability**: If you need remote access, a sleeping NAS won't be reachable
- **Drive health**: Frequent spin-up/down cycles can reduce drive lifespan
- **Reliability**: WoL can fail due to network issues or power settings
- **Backups**: Scheduled backup jobs may fail if NAS is asleep
- **RAID**: Array maintenance and rebuilds need consistent uptime

**Better use cases for this tool:**
- Home servers (media, development, testing)
- Desktop computers you want to wake remotely
- Lab/test machines that don't store critical data
- Any device where convenience > 24/7 availability

**For NAS with important data:** Consider keeping it awake 24/7. The power cost is worth the reliability.

---

## Why This Exists

I built this to automatically wake devices when opening my MacBook, eliminating the manual step of using WoL apps. While I originally designed it for my NAS, community feedback helped me realize it's better suited for non-critical devices where convenience matters more than constant availability.

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

**Security Note:** macOS will show wake-my-nas as "item from unidentified developer" in Login Items (System Settings). This is normal for open-source scripts that aren't code-signed. The script is open source - you can review the code at any time.

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

Wake-on-LAN, WoL, server automation, automatic wake, Mac sleep wake, LaunchAgent, magic packet, home server, macOS automation, desktop wake, remote wake

---

## Acknowledgments

Thanks to the r/synology community for valuable feedback about NAS reliability and helping refine the use cases for this tool.

---

## License

Public domain. Do whatever you want.
