class WakeMyNas < Formula
  desc "Automatic Wake-on-LAN for macOS - wake your NAS when your Mac wakes"
  homepage "https://github.com/dgeske/wake-my-nas"
  url "https://github.com/dgeske/wake-my-nas/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "58278898f7c09e9b70c17c4c20af12019baf8050b7767ec0dcfb6bf3cd9ad228"
  license "Unlicense"

  depends_on "wakeonlan"

  def install
    bin.install "wake-my-nas.sh" => "wake-my-nas"
    bin.install "install-service.sh" => "wake-my-nas-install-service"
    prefix.install "com.github.wake-my-nas.plist"
  end

  def post_install
    system bin/"wake-my-nas", "--init"
  end

  def caveats
    <<~EOS
      📡 wake-my-nas installed! Config created at ~/.config/wake-my-nas/config

      1. Set your device's MAC and IP:
         wake-my-nas --edit

      2. Install the service:
         wake-my-nas-install-service

      Done! Your device wakes when your Mac wakes.

      View logs: tail -f /tmp/wake-my-nas.log
    EOS
  end

  test do
    system bin/"wake-my-nas", "--version"
  end
end
