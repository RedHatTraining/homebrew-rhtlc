class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "4.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.0/rhtlc-macos-x86_64"
      sha256 "01866c362b0371088e97ea88d32cb689d24c5d6d95a844f86d717f5cbfeeec8a"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.0/rhtlc-macos-arm64"
      sha256 "525a25f3c51cc64ac3536df9881727578548a69c69e2232e7c4e50f8ac222551"
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
