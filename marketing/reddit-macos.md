# Reddit Post - r/macOS

**Title:** [Tool] Auto-wake network storage when your Mac wakes

**Body:**

Small quality-of-life improvement: automatically wake your NAS/server when you open your MacBook.

**Why I built this:**
I have a Synology that sleeps to save power, but I was tired of the 30-second wait every time I opened my laptop. I wanted my network storage ready instantly without keeping it running 24/7.

Built a simple tool that sends a Wake-on-LAN packet the moment macOS wakes. Now my storage is ready by the time I need it.

**Install:**
```bash
brew tap dgeske/tap
brew install wake-my-nas
wake-my-nas --discover
wake-my-nas --edit
wake-my-nas-install-service
```

**What it does:**
- Runs automatically on Mac wake (LaunchAgent)
- Only on your home network (optional)
- Checks if device is already awake
- Works with any WoL-enabled device (NAS, server, desktop)
- Built-in device discovery

**GitHub:** https://github.com/dgeske/wake-my-nas

Free, open source, minimal setup. Saves time every single day.

**If this is useful to you, a GitHub star would be appreciated!** Working to get it into Homebrew Core so it's easier for others to find. Need to demonstrate enough people find it valuable.

Let me know if you have questions or run into issues!

---

**Post to:** r/macOS
**Flair:** App/Tool
**Best time:** Weekday afternoon
