# Reddit Post - r/macOS

**Title:** [Tool] Auto-wake network storage when your Mac wakes

**Body:**

Small quality-of-life improvement: automatically wake your NAS/server when you open your MacBook.

I have a Synology that sleeps to save power, but I was tired of the 30-second wait every time I opened my laptop. Built a simple tool that sends a Wake-on-LAN packet the moment macOS wakes.

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
- Works with any WoL-enabled device

**GitHub:** https://github.com/dgeske/wake-my-nas

Free, open source, minimal setup. Saves time every single day.

---

**Post to:** r/macOS
**Flair:** App/Tool
**Best time:** Weekday afternoon
