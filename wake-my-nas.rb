class WakeMyNas < Formula
  desc "Automatic Wake-on-LAN for macOS - wake your NAS when your Mac wakes"
  homepage "https://github.com/dgeske/wake-my-nas"
  url "https://github.com/dgeske/wake-my-nas/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1e8bd4741ed06d698b5480566ecd02337345c45f3a62619f218f1f3232eb51a6"
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

      1. Find your device's MAC address:
         wake-my-nas --discover

      2. Set your device's MAC (IP optional):
         wake-my-nas --edit

      3. Install the service:
         wake-my-nas-install-service

      Done! Your device wakes when your Mac wakes.

      View logs: tail -f /tmp/wake-my-nas.log
    EOS
  end

  test do
    system bin/"wake-my-nas", "--version"
  end
end
