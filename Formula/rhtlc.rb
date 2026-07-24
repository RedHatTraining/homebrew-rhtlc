class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "5.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.1/rhtlc-macos-x86_64"
      sha256 "378f1fb0570f572270dac7118e09d9c507046bbf62a24c98cfe7a5c0c53d9fa5"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.1/rhtlc-macos-arm64"
      sha256 "f3d626701623bc6510043eea9e8b823d9f2143642667a7062ce6d112270fdff2"
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
