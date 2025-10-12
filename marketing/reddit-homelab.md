# Reddit Post - r/homelab

**Title:** [Tool] Automatically wake your home server when you open your MacBook

**Body:**

Built a simple tool that sends a Wake-on-LAN packet when macOS wakes, so your home server/desktop is ready when you need it.

**Why this exists:**
I wanted my home server to sleep (power savings, noise) but didn't want to manually wake it every time. This automates it.

**Important note:** After feedback from r/synology, I learned this approach isn't ideal for NAS with critical data (drive wear, availability concerns). This tool is better suited for:
- Home servers (media, development, testing)
- Desktop computers you want to wake remotely
- Lab/test machines
- Any device where convenience > 24/7 availability

**What it does:**
- Automatically wakes your device when your Mac wakes
- Works with any WoL-enabled device
- Optional network filtering (only runs on your home network)
- Checks if device is already awake (no redundant packets)
- 3-command setup

**Installation:**
```bash
brew tap dgeske/tap
brew install wake-my-nas
wake-my-nas --discover  # finds your device
wake-my-nas --edit      # set MAC address
wake-my-nas-install-service
```

**GitHub:** https://github.com/dgeske/wake-my-nas

Free, open source, public domain. Perfect for home lab setups where you want power savings without the manual wake step.

**If this solves a problem for you, a GitHub star would help get it into Homebrew Core** so others can find it more easily.

Let me know if you run into any issues or have suggestions!

---

**Post to:** r/homelab
**Flair:** Project
**Best time:** Today (Sunday) - good weekend traffic
