class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "3.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.1/rhtlc-macos-x86_64"
      sha256 "e879b1cc6d4dbe4a6baabe5f4e92dae0587343c067c0ae407a0f3ab8609f06ed"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.1/rhtlc-macos-arm64"
      sha256 "a427c6b068dec881bda758a8c64b3bdd49be1de3a19e48664ac799ffd0087859"
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
