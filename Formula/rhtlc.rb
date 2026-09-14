class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.0.1/rhtlc-macos-arm64.tar.gz"
  version "6.0.1"
  sha256 "01143d8f35d0bcd658c163ee55b8e54d221da50c364b2aca4d21021155592b4d"
  license "MIT"

  # Homebrew 7+ `brew tap` / `brew readall` evaluates Linux even on macOS.
  # A URL must exist outside `on_macos` or the tap is rejected ("formula
  # requires at least a URL"). Linux installs use COPR (`dnf`), not this formula.

  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.0.1/rhtlc-macos-x86_64.tar.gz"
      sha256 "09578fed67ba1792321223aab9970626d0f8bab3e587d592d45b4fadc594aada"
    end
    on_arm do
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

  def caveats
    <<~EOS
      If `brew link` fails because bin/rhtlc already exists (common when
      upgrading from 5.x one-file to 6.x onedir), overwrite the leftover:
        brew link --overwrite rhtlc
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rhtlc --version")
  end
end
