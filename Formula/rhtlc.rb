class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "5.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.9/rhtlc-macos-x86_64"
      sha256 "71b089b24611327cab21299303ffb4052180d90cbdd82e9c449d59df60133bc6"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.9/rhtlc-macos-arm64"
      sha256 "982ea9f8ad453d2078845e37678533c16c776a3f3f772475cd19d98f5c161993"
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
