class WakeMyNas < Formula
  desc "Automatic Wake-on-LAN for macOS - wake your NAS when your Mac wakes"
  homepage "https://github.com/dgeske/wake-my-nas"
  url "https://github.com/dgeske/wake-my-nas/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "e1ecca20cbf6a09f82831edd37f10f9efcdbc7150ca79e2ff597b36ed6068cf3"
  license "Unlicense"

  depends_on "wakeonlan"

  def install
    bin.install "wake-my-nas.sh" => "wake-my-nas"
  end

  def post_install
    system bin/"wake-my-nas", "--init"
  end

  service do
    run opt_bin/"wake-my-nas"
    keep_alive false
    process_type :background
    watch_paths ["/private/var/run/systemkeychaincheck.done"]
    log_path var/"log/wake-my-nas.log"
    error_log_path var/"log/wake-my-nas-error.log"
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
    system "#{bin}/wake-my-nas", "--version"
  end
end
