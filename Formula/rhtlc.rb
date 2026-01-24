class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "3.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.3/rhtlc-macos-x86_64"
      sha256 "add407c1856c9b0deddd96c7638e713f816cab4fdf519f3b2d0a273a0bd73eb9"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.3/rhtlc-macos-arm64"
      sha256 "43d62104f4c142cb1982880eb3570e495661519aefc6c73bb036e20651b38b49"
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
