# 📡 wake-my-nas

**Automatic Wake-on-LAN for macOS**

Wake your NAS, server, desktop, or any WoL-enabled device automatically when you open your MacBook or wake your Mac—but only when you're on the right network and the device isn't already awake.

---

## 🚀 Installation

### Via Homebrew

```bash
brew install wake-my-nas
```

### Manual

```bash
git clone https://github.com/dgeske/wake-my-nas.git
cd wake-my-nas
chmod +x wake-my-nas.sh
./wake-my-nas.sh --init
```

---

## ⚙️ Setup

### 1. Configure your device

```bash
wake-my-nas --init    # Create config
wake-my-nas --edit    # Edit settings
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
cp $(brew --prefix)/opt/wake-my-nas/com.github.wake-my-nas.plist ~/Library/LaunchAgents/
sed -i '' "s|INSTALL_PATH|$(which wake-my-nas)|g" ~/Library/LaunchAgents/com.github.wake-my-nas.plist
launchctl load ~/Library/LaunchAgents/com.github.wake-my-nas.plist
```

---

## 🎯 Usage

```bash
wake-my-nas              # Send WoL packet now
wake-my-nas --edit       # Edit config
wake-my-nas --version    # Show version
wake-my-nas --help       # Show help
```

**View logs:**
```bash
tail -f ~/Library/Logs/wake-my-nas.log
```

---

## 🗑️ Uninstall

```bash
launchctl unload ~/Library/LaunchAgents/com.github.wake-my-nas.plist
rm ~/Library/LaunchAgents/com.github.wake-my-nas.plist
brew uninstall wake-my-nas
```

---

## 💡 How It Works

1. **Mac wakes** (lid open, power button, etc.)
2. **wake-my-nas checks** if you're on the expected network
3. **Pings device** to see if it's already awake
4. **Sends WoL packet** only if needed
5. **Logs everything** for debugging

---

## 📝 License

Public domain. Do whatever you want.
