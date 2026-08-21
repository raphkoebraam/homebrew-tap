class Mirage < Formula
  desc "Manage Apple simulators by name, not UDID"
  homepage "https://github.com/raphkoebraam/Mirage"
  url "https://github.com/raphkoebraam/Mirage/releases/download/v0.10.0/mirage-0.10.0-macos.tar.gz"
  sha256 "712b828dbd5380039602838286068ebaf1e3d7c9cfe10156b315240b4d55673d"
  license "MIT"

  # The binary is built against the macOS 15 SDK and uses Synchronization.Mutex.
  depends_on macos: :sequoia

  def install
    bin.install "mirage"
    generate_completions_from_executable(bin/"mirage", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mirage --version")
    assert_match "compdef mirage", shell_output("#{bin}/mirage completions zsh")
  end
end
