class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI tool for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  version "6.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.0.1/rhtlc-macos-x86_64.tar.gz"
      sha256 "09578fed67ba1792321223aab9970626d0f8bab3e587d592d45b4fadc594aada"
    else
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.0.1/rhtlc-macos-arm64.tar.gz"
      sha256 "01143d8f35d0bcd658c163ee55b8e54d221da50c364b2aca4d21021155592b4d"
    end
  end

  def install
    bundle = Hardware::CPU.intel? ? "rhtlc-macos-x86_64" : "rhtlc-macos-arm64"
    if (buildpath/bundle).directory?
      libexec.install bundle
      exe = libexec/bundle/bundle
    else
      libexec.install bundle, "_internal"
      exe = libexec/bundle
    end
    chmod 0755, exe
    tunnel = exe.dirname/"_internal/rhtlc-wstunnel"
    chmod 0755, tunnel if tunnel.exist?
    (bin/"rhtlc").write <<~EOS
      #!/bin/bash
      exec "#{exe}" "$@"
    EOS
    chmod 0755, bin/"rhtlc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rhtlc --version")
  end
end
