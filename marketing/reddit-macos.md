# Reddit Post - r/macOS

**Title:** [Tool] Auto-wake your home server when your Mac wakes

**Body:**

Small quality-of-life improvement: automatically wake your home server or desktop when you open your MacBook.

**Why I built this:**
I have a home server that sleeps to save power, but I was tired of manually waking it every time I opened my laptop. Built a simple tool that sends a Wake-on-LAN packet the moment macOS wakes.

**Note:** Originally built this for my NAS, but community feedback taught me that's not ideal for devices storing critical data (drive wear, availability). This is better for home servers, desktops, or lab machines where convenience matters more than 24/7 uptime.

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
- Built-in device discovery

**GitHub:** https://github.com/dgeske/wake-my-nas

Free, open source, minimal setup. Great for home lab setups.

**If this is useful to you, a GitHub star would be appreciated!** Working to get it into Homebrew Core so it's easier for others to find.

Let me know if you have questions or run into issues!

---

**Post to:** r/macOS
**Flair:** App/Tool
**Best time:** Monday afternoon
