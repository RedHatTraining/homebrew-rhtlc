class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "5.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-macos-x86_64"
      sha256 "03be376241e02b963925cf8c67f57f1df33ebabe052ac4e94d478efd61569acb"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-macos-arm64"
      sha256 "270a0d0745c6a247c93483a8d9b1e86c44546da4bde6b559b9fb166eb9b93de9"
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
