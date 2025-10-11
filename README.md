# 📡 wake-my-nas

**Automatic Wake-on-LAN for macOS**

Wake your NAS, server, or any device when you open your MacBook.

---

## 🚀 Quick Start

```bash
brew install wake-my-nas
wake-my-nas --discover                # Find your device's MAC address
wake-my-nas --edit                    # Set MAC (IP optional)
wake-my-nas-install-service           # Done!
```

Your device now wakes automatically when your Mac wakes.

---

## ⚙️ Configuration

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

## 📊 View Logs

```bash
tail -f $(brew --prefix)/var/log/wake-my-nas.log
```

---

## 🗑️ Uninstall

```bash
brew services stop wake-my-nas
brew uninstall wake-my-nas
```

---

## 💡 How It Works

1. Mac wakes (lid open, power button, etc.)
2. Checks if you're on the right network
3. Pings device to see if already awake
4. Sends WoL packet only if needed

---

## 📝 License

Public domain. Do whatever you want.
