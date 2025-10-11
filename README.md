# 🤝 wakemate

**Automatic Wake-on-LAN for macOS**

Wake your NAS, server, desktop, or any WoL-enabled device automatically when you open your MacBook or wake your Mac—but only when you're on the right network and the device isn't already awake.

---

## 🚀 Installation

### Via Homebrew

```bash
brew install wakemate
```

### Manual

```bash
git clone https://github.com/YOUR_GITHUB_USERNAME/wakemate.git
cd wakemate
chmod +x wakemate.sh
./wakemate.sh --init
```

---

## ⚙️ Setup

### 1. Configure your device

```bash
wakemate --init    # Create config
wakemate --edit    # Edit settings
```

Set these values:

```bash
TARGET_MAC="00:11:22:33:44:55"    # Device MAC address
TARGET_IP="192.168.1.100"         # Device IP address
EXPECTED_SSID="YourHomeNetwork"   # Wi-Fi SSID (optional)
EXPECTED_SUBNET="192.168.1"       # Subnet prefix (optional)
```

**Find MAC address:**
```bash
arp -a | grep YOUR_DEVICE_IP
```

### 2. Enable Wake-on-LAN on your device

- **Synology NAS**: Control Panel → Hardware & Power → Enable Wake on LAN
- **Other devices**: Check BIOS/network settings
- **Requirement**: Device must be connected via Ethernet (Wi-Fi doesn't support WoL)

### 3. Install LaunchAgent (auto-wake on Mac wake)

```bash
cp $(brew --prefix)/opt/wakemate/com.github.wakemate.plist ~/Library/LaunchAgents/
sed -i '' "s|INSTALL_PATH|$(which wakemate)|g" ~/Library/LaunchAgents/com.github.wakemate.plist
launchctl load ~/Library/LaunchAgents/com.github.wakemate.plist
```

---

## 🎯 Usage

```bash
wakemate              # Send WoL packet now
wakemate --edit       # Edit config
wakemate --version    # Show version
wakemate --help       # Show help
```

**View logs:**
```bash
tail -f ~/Library/Logs/wakemate.log
```

---

## 🗑️ Uninstall

```bash
launchctl unload ~/Library/LaunchAgents/com.github.wakemate.plist
rm ~/Library/LaunchAgents/com.github.wakemate.plist
brew uninstall wakemate
```

---

## 💡 How It Works

1. **Mac wakes** (lid open, power button, etc.)
2. **wakemate checks** if you're on the expected network
3. **Pings device** to see if it's already awake
4. **Sends WoL packet** only if needed
5. **Logs everything** for debugging

---

## 📝 License

Public domain. Do whatever you want.
