class WakeMyNas < Formula
  desc "Automatic Wake-on-LAN for macOS - wake your NAS when your Mac wakes"
  homepage "https://github.com/dgeske/wake-my-nas"
  url "https://github.com/dgeske/wake-my-nas/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1173436a31db38bf1877ce0e3d75834977033dd15b9032aecc070102a50e83a5"
  license "Unlicense"

  depends_on "wakeonlan"

  def install
    bin.install "wake-my-nas.sh" => "wake-my-nas"
    (prefix/"homebrew.wake-my-nas.plist").write service_plist
  end

  def post_install
    system bin/"wake-my-nas", "--init"
  end

  def service_plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/wake-my-nas</string>
        </array>
        <key>WatchPaths</key>
        <array>
          <string>/private/var/run/systemkeychaincheck.done</string>
        </array>
        <key>StandardOutPath</key>
        <string>#{var}/log/wake-my-nas.log</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/wake-my-nas-error.log</string>
        <key>KeepAlive</key>
        <false/>
        <key>ProcessType</key>
        <string>Background</string>
        <key>ThrottleInterval</key>
        <integer>30</integer>
      </dict>
      </plist>
    EOS
  end

  def caveats
    <<~EOS
      📡 wake-my-nas installed!

      1. Configure your device:
         wake-my-nas --edit

      2. Start automatic wake:
         brew services start wake-my-nas

      That's it! Your device will wake when your Mac wakes.

      View logs: tail -f #{var}/log/wake-my-nas.log
    EOS
  end

  test do
    system bin/"wake-my-nas", "--version"
  end
end
