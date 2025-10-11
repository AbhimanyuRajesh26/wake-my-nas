# Reddit Post - r/homelab

**Title:** [Tool] Automatically wake your NAS when you open your MacBook

**Body:**

I got tired of opening my MacBook and waiting 30 seconds for my NAS to wake up before I could access my files. So I built a simple tool that sends a Wake-on-LAN packet the moment macOS wakes from sleep.

**What it does:**
- Automatically wakes your NAS/server when your Mac wakes
- Works with any WoL-enabled device (Synology, QNAP, custom builds, etc.)
- Optional network filtering (only runs on your home network)
- 3-command setup

**Installation:**
```bash
brew tap dgeske/tap
brew install wake-my-nas
wake-my-nas --discover  # finds your device
wake-my-nas --edit      # set MAC address
wake-my-nas-install-service
```

That's it. Now your storage is ready when you need it.

**GitHub:** https://github.com/dgeske/wake-my-nas

Free, open source, public domain. Works great with Synology but supports any WoL device.

---

**Post to:** r/homelab
**Flair:** Project
**Best time:** Weekday morning (US time) for visibility
