# wake-my-nas - Project Status

**Last Updated:** 2025-10-12

## Current State: ✅ LIVE - Pivoted to Home Server Use Cases

### What's Done
- [x] Built wake-my-nas tool (automatic Wake-on-LAN for macOS)
- [x] GitHub repo created and published
- [x] Homebrew formula created and tested
- [x] ~~PR submitted to Homebrew Core~~ Rejected (not notable enough yet)
- [x] Personal Homebrew tap created
- [x] Tool available for installation
- [x] Posted to r/synology - got valuable feedback
- [x] **PIVOT:** Updated to focus on home servers, not NAS with critical data

### Community Feedback (r/synology)
- Drive wear from spin-up/down cycles reduces lifespan
- WoL unreliable for critical data access
- Power savings not worth reliability tradeoffs for NAS
- **Result:** Pivoted to home servers, desktops, lab machines

### Better Use Cases
- Home servers (media, development, testing)
- Desktop computers for remote wake
- Lab/test machines
- Any device where convenience > 24/7 availability

### Links
- **GitHub Repo:** https://github.com/dgeske/wake-my-nas
- **Homebrew Tap:** https://github.com/dgeske/homebrew-tap
- **Installation:** `brew tap dgeske/tap && brew install wake-my-nas`
- **Local Dev:** ~/dev/wake-my-nas/
- **r/synology post:** https://www.reddit.com/r/synology/comments/1o3vcxh/

### Key Files
- `wake-my-nas.sh` - Main script (134 lines)
- `wake-my-nas.rb` - Homebrew formula
- `install-service.sh` - LaunchAgent installer
- `com.github.wake-my-nas.plist` - LaunchAgent config

### User Flow
```bash
brew tap dgeske/tap
brew install wake-my-nas
wake-my-nas --discover          # Find MAC address
wake-my-nas --edit              # Set MAC (IP optional)
wake-my-nas-install-service     # Done
```

### Next Steps
1. **Post to r/homelab** (today/Sunday) - home server focus
2. **Post to Hacker News** (Monday 8-10am EST) - with pivot context
3. **Post to r/macOS** (Monday afternoon) - generic device wake
4. **Track stars/usage** - Need ~75+ stars for Homebrew Core
5. **Resubmit to Homebrew Core** once notable

### Marketing Status
- ✅ Twitter/X posted
- ✅ r/synology posted (got feedback, pivoted)
- ⏳ r/homelab (ready to post - updated)
- ⏳ Hacker News (Monday morning - updated)
- ⏳ r/macOS (Monday afternoon - updated)

### How Users Install Now
```bash
brew tap dgeske/tap
brew install wake-my-nas
```

### Version
- **Current:** v1.0.0
- **SHA256:** 143566f79c49c0a56505eeb4744d0f93566b828a5099bba2e467cddc30bbf619

### Features
- Minimal config (MAC only required)
- Device discovery helper
- MAC/IP validation
- macOS notifications
- Network filtering (SSID/subnet)
- Smart ping check (optional)
- LaunchAgent automation

### Why This Exists
Tired of waiting 30 seconds for NAS to wake after opening MacBook. This sends WoL packet when Mac wakes, so storage is ready when needed.

---

**Status:** Waiting for Homebrew maintainers. Nothing to do until they respond.
