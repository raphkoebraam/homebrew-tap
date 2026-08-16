class Mirage < Formula
  desc "Manage Apple simulators by name, not UDID"
  homepage "https://github.com/raphkoebraam/Mirage"
  url "https://github.com/raphkoebraam/Mirage/releases/download/v0.9.0/mirage-0.9.0-macos.tar.gz"
  sha256 "99f3a05f7db3a61dc3fefe155709572d6c2764c592f07d99d73f0c319f169692"
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
