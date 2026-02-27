class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "4.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.2/rhtlc-macos-x86_64"
      sha256 "bb16c492ee6ccb5dc13a32acdebbb47932d51a2f2d7f2f1c78f3420d411afc64"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.2/rhtlc-macos-arm64"
      sha256 "1d2b2bbbb7c8a1e66b60d33ce023a161c1d8cb31f43a81fc18d7f82718d64ddd"
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
