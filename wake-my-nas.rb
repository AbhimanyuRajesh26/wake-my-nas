class WakeMyNas < Formula
  desc "Wake-on-LAN automation: wake your NAS/server when your Mac wakes"
  homepage "https://github.com/dgeske/wake-my-nas"
  url "https://github.com/dgeske/wake-my-nas/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "143566f79c49c0a56505eeb4744d0f93566b828a5099bba2e467cddc30bbf619"
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
      wake-my-nas installed. Config created at ~/.config/wake-my-nas/config

      1. Find your device's MAC address:
         wake-my-nas --discover

      2. Set your device's MAC (IP optional):
         wake-my-nas --edit

      3. Install the service:
         wake-my-nas-install-service

      Your device will wake automatically when your Mac wakes.

      View logs: tail -f /tmp/wake-my-nas.log
    EOS
  end

  test do
    system bin/"wake-my-nas", "--version"
  end
end
