class Wakemate < Formula
  desc "Automatic Wake-on-LAN for macOS - wake devices when your Mac wakes"
  homepage "https://github.com/dgeske/wakemate"
  url "https://github.com/dgeske/wakemate/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "Unlicense"

  depends_on "wakeonlan"

  def install
    bin.install "wakemate.sh" => "wakemate"
    prefix.install "com.github.wakemate.plist"
  end

  def caveats
    <<~EOS
      🤝 wakemate installed!

      1. Configure your device:
         wakemate --init
         wakemate --edit

      2. Install LaunchAgent (auto-wake on Mac wake):
         cp #{prefix}/com.github.wakemate.plist ~/Library/LaunchAgents/
         sed -i '' "s|INSTALL_PATH|#{bin}/wakemate|g" ~/Library/LaunchAgents/com.github.wakemate.plist
         launchctl load ~/Library/LaunchAgents/com.github.wakemate.plist

      3. Test manually:
         wakemate

      4. View logs:
         tail -f ~/Library/Logs/wakemate.log

      To uninstall LaunchAgent:
         launchctl unload ~/Library/LaunchAgents/com.github.wakemate.plist
         rm ~/Library/LaunchAgents/com.github.wakemate.plist
    EOS
  end

  test do
    system "#{bin}/wakemate", "--version"
  end
end
