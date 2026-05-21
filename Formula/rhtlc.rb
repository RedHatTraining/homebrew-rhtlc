class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "5.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-macos-x86_64"
      sha256 "ac348c253f8bb0b07c1f7c3ab426b55ecdd4228f917edb52c4705dcffb93fc12"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-macos-arm64"
      sha256 "d36125c8b6b25ee92f156f1d74e610ffee668eba55a48403d775e47db75a21a0"
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
