# Hacker News Submission

**Title:** Wake-my-nas: Auto-wake your home server when your Mac wakes

**URL:** https://github.com/dgeske/wake-my-nas

**Text:** (leave empty, let the README speak - but be ready to post first comment)

---

**First comment to post immediately after submission:**
```
Author here. Built this to automatically wake my home server when I open my MacBook.

Originally designed it for my NAS, but r/synology taught me that's not ideal for 
devices storing critical data (drive wear, availability concerns). Pivoted to focus 
on home servers, desktops, and lab machines where the tradeoffs make more sense.

It's a simple LaunchAgent that sends a WoL packet when macOS wakes. 3-command setup, 
works with any WoL device.

Submitted to Homebrew Core but got rejected for "notability" - need more users first. 
If you find it useful, a star would help get it into the main repository.

Happy to answer questions!
```

---

**Alternative title options:**
- "Automatically wake your home server when opening your MacBook"
- "Simple Wake-on-LAN automation for macOS"
- "Auto-wake network devices on Mac wake"

**Best time to post:** 
- Monday 8-10am EST (when HN is most active)
- Avoid Friday afternoons

**Expected questions and answers:**

Q: "Why not just keep it on?"
A: For home servers/desktops, power savings and noise reduction matter. For NAS with critical data, you're right - keep it on.

Q: "Does this work with X?"
A: Yes, any WoL-enabled device. Tested with various setups.

Q: "Why not use cron?"
A: Cron doesn't trigger on wake events. LaunchAgent WatchPaths does.

Q: "What about drive wear?"
A: Good point - that's why I pivoted away from NAS use cases. For home servers/desktops, the tradeoffs are different.

Q: "What about Linux/Windows?"
A: macOS only for now. LaunchAgent is macOS-specific, but the concept works elsewhere.
