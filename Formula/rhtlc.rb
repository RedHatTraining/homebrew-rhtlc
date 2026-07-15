class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "5.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.0/rhtlc-macos-x86_64"
      sha256 "967d16fe286aa73aa0465f8fe8534b088e6052a3a04d6a80498c29ddfb239972"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.0/rhtlc-macos-arm64"
      sha256 "be88a202f165136682ac484da2f34fd46ef454243de3fffe10a5a1695950d8c1"
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
