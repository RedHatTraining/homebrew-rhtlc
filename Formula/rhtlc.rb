class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.0.2/rhtlc-macos-arm64.tar.gz"
  version "6.0.2"
  sha256 "d93001b909ef64d37db6657052c013af8c1911ac0e411f16cd1db7486d988751"
  license "MIT"

  # Homebrew 7+ `brew tap` / `brew readall` evaluates Linux even on macOS.
  # A URL must exist outside `on_macos` or the tap is rejected.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.0.2/rhtlc-macos-x86_64.tar.gz"
      sha256 "92080e761345185a93807a5e076c7cab1827c5a0bdbcd6818c74b0f3ae4bae7f"
    end
    on_arm do
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.0.2/rhtlc-macos-arm64.tar.gz"
      sha256 "d93001b909ef64d37db6657052c013af8c1911ac0e411f16cd1db7486d988751"
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
