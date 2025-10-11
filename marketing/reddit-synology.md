# Reddit Post - r/synology

**Title:** Made a tool to auto-wake my Synology when I open my MacBook

**Body:**

My Synology goes to sleep to save power, but I was tired of waiting for it to wake up every time I opened my MacBook. 

Built a simple macOS tool that sends a WoL packet automatically when your Mac wakes, so your NAS is ready by the time you need it.

**Setup:**
```bash
brew tap dgeske/tap
brew install wake-my-nas
wake-my-nas --discover
wake-my-nas --edit
wake-my-nas-install-service
```

Done. Your Synology wakes automatically now.

**Features:**
- Only runs on your home network (optional)
- Checks if NAS is already awake (avoids redundant packets)
- Built-in device discovery
- Works with any Synology model that supports WoL

**GitHub:** https://github.com/dgeske/wake-my-nas

Free and open source. Saves me 30 seconds every single time I open my laptop.

---

**Post to:** r/synology
**Flair:** Tutorial/Guide or Discussion
**Best time:** Weekend morning for engagement
