class WakeMyNas < Formula
  desc "Automatic Wake-on-LAN for macOS - wake your NAS when your Mac wakes"
  homepage "https://github.com/dgeske/wake-my-nas"
  url "https://github.com/dgeske/wake-my-nas/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7e0b7345ab22b244c23e13e0ee9d2ddf3df6321dd2a164d1aad88210e286d101"
  license "Unlicense"

  depends_on "wakeonlan"

  def install
    bin.install "wake-my-nas.sh" => "wake-my-nas"
    prefix.install "com.github.wake-my-nas.plist"
  end

  def caveats
    <<~EOS
      📡 wake-my-nas installed!

      1. Configure your device:
         wake-my-nas --init
         wake-my-nas --edit

      2. Install LaunchAgent (auto-wake on Mac wake):
         cp #{prefix}/com.github.wake-my-nas.plist ~/Library/LaunchAgents/
         sed -i '' "s|INSTALL_PATH|#{bin}/wake-my-nas|g" ~/Library/LaunchAgents/com.github.wake-my-nas.plist
         launchctl load ~/Library/LaunchAgents/com.github.wake-my-nas.plist

      3. Test manually:
         wake-my-nas

      4. View logs:
         tail -f ~/Library/Logs/wake-my-nas.log

      To uninstall LaunchAgent:
         launchctl unload ~/Library/LaunchAgents/com.github.wake-my-nas.plist
         rm ~/Library/LaunchAgents/com.github.wake-my-nas.plist
    EOS
  end

  test do
    system "#{bin}/wake-my-nas", "--version"
  end
end
