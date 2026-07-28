class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "5.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.2/rhtlc-macos-x86_64"
      sha256 "e5c73d2bd1e32f26160a9d44ab94538f92e86a17c709488e68f08e5e06a7cb6e"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.2/rhtlc-macos-arm64"
      sha256 "694ec95ea7298e72c7ba1b5ac684eac1c14bf63604e0e36ce4e53a932c321f2a"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "rhtlc-macos-x86_64" => "rhtlc"
    else
      bin.install "rhtlc-macos-arm64" => "rhtlc"
    end
    chmod 0755, bin/"rhtlc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rhtlc --version")
  end
end
