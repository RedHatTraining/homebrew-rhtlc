class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/dle-wstunnel-ole"
  version "3.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/dle-wstunnel-ole/releases/download/v3.4.1/rhtlc-macos-x86_64"
      sha256 "fd2179d2e65d41ed2c22f95bbdaef1887208c7f5c321b3f620b1f4a20a87467e"
    else
      url "https://github.com/RedHatTraining/dle-wstunnel-ole/releases/download/v3.4.1/rhtlc-macos-arm64"
      sha256 "390e836c084868e023dc074dbbde02d105c611a30724a29c1b3041d8466f77e8"
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
