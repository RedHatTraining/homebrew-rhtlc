class Rhtlc < Formula
  desc "Red Hat Training Lab Connector - CLI for connecting to training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"
  url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.2.1/rhtlc-macos-arm64.tar.gz"
  version "6.2.1"
  sha256 "ae72295114c2465e0e386234fb78dc2244c71811d6a1cdb754f3bc7545905ffa"
  license "MIT"

  # Homebrew 7+ `brew tap` / `brew readall` evaluates Linux even on macOS.
  # A URL must exist outside `on_macos` or the tap is rejected.
  depends_on :macos

  on_macos do
    on_intel do
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.2.1/rhtlc-macos-x86_64.tar.gz"
      sha256 "4994251a46ef2bf9ef1d4d9c07960d2019f469714cf06af0914fdf245ba4ebc2"
    end
    on_arm do
      url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/6.2.1/rhtlc-macos-arm64.tar.gz"
      sha256 "ae72295114c2465e0e386234fb78dc2244c71811d6a1cdb754f3bc7545905ffa"
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
