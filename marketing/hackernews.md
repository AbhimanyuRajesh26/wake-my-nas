# Hacker News Submission

**Title:** Wake-my-nas: Auto-wake your NAS when your Mac wakes

**URL:** https://github.com/dgeske/wake-my-nas

**Text:** (leave empty, let the README speak - but be ready to post first comment)

---

**First comment to post immediately after submission:**
```
Author here. Built this because I wanted my NAS to sleep (power savings, 
drive longevity) but didn't want to wait 30 seconds every time I opened 
my MacBook.

It's a simple LaunchAgent that sends a WoL packet when macOS wakes. 
3-command setup, works with any WoL device.

Submitted to Homebrew Core but got rejected for "notability" - need more 
users first. If you find it useful, a star would help get it into the 
main repository.

Happy to answer questions!
```

---

**Alternative title options:**
- "Automatically wake your NAS when opening your MacBook"
- "Simple Wake-on-LAN automation for macOS"
- "Auto-wake network storage on Mac wake"

**Best time to post:** 
- Weekday 8-10am EST (when HN is most active)
- Avoid Friday afternoons

**Tips:**
- Keep title factual, not promotional
- Post first comment with context immediately
- Respond to technical questions quickly
- Accept feedback gracefully
- Don't ask for upvotes in title

**Expected questions and answers:**

Q: "Why not just keep it on?"
A: Power savings, noise, drive longevity. But I don't want to wait.

Q: "Does this work with X?"
A: Yes, any WoL-enabled device. Tested with Synology but it's generic.

Q: "Why not use cron?"
A: Cron doesn't trigger on wake events. LaunchAgent WatchPaths does.

Q: "What about Linux/Windows?"
A: macOS only for now. LaunchAgent is macOS-specific, but the concept works elsewhere.

Q: "Security concerns?"
A: WoL packets are unencrypted by design. Only runs on trusted networks (optional SSID check).

**If it gets traction:**
- Respond within first hour
- Be helpful, not defensive
- Share technical details
- Thank people for feedback
