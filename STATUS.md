# wake-my-nas - Project Status

**Last Updated:** 2025-10-11

## Current State: ✅ LIVE - Available via Personal Tap

### What's Done
- [x] Built wake-my-nas tool (automatic Wake-on-LAN for macOS)
- [x] GitHub repo created and published
- [x] Homebrew formula created and tested
- [x] ~~PR submitted to Homebrew Core~~ Rejected (not notable enough yet)
- [x] Personal Homebrew tap created
- [x] Tool available for installation

### Links
- **GitHub Repo:** https://github.com/dgeske/wake-my-nas
- **Homebrew Tap:** https://github.com/dgeske/homebrew-tap
- **Installation:** `brew tap dgeske/tap && brew install wake-my-nas`
- **Local Dev:** ~/dev/wake-my-nas/

### Homebrew Core Feedback
- Rejected for "notability" - need more users first
- Tool is fine, just not popular enough yet
- Can resubmit once it gains traction

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
1. **Share the tool** - Get users to build notability
   - Reddit: r/homelab, r/synology, r/macOS
   - Hacker News
   - Twitter/X
   - Blog post
2. **Track stars/usage** - Need ~75+ stars for Homebrew Core
3. **Resubmit to Homebrew Core** once notable

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
