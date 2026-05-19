class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "5.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.7/rhtlc-macos-x86_64"
      sha256 "3b0749474c8ee07edbcd2f1d21fa73393f557f792d2c91323e15d1fae4161a75"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.7/rhtlc-macos-arm64"
      sha256 "aa2d3129111070295623143a453ef80364be6352a07a8b1b1fc1fe956e8dacab"
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
