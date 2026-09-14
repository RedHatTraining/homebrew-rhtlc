cask "rhtlc-gui" do
  version "6.0.1"

  on_arm do
    sha256 "8cc87ff3fc112d1da34f82dabf8e2c7d57f61e0c06803fbcbb96c71515f140db"

    url "https://github.com/RedHatTraining/homebrew-rhtlc/releases/download/v6.0.1/rhtlc-gui-macos-arm64.zip"
  end
  on_intel do
    sha256 "0690cff470f3c9d97e8d2beb3586b85a56f399d9d2f8baf59a89dfe24ce4241f"

    url "https://github.com/RedHatTraining/homebrew-rhtlc/releases/download/v6.0.1/rhtlc-gui-macos-x86_64.zip"
  end

  name "RHTLC GUI"
  desc "Red Hat Training Lab Connector - Graphical interface for training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"

  depends_on :macos

  app "RHTLC-GUI.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/RHTLC-GUI.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/RHTLC",
    "~/Library/Preferences/com.redhat.rhtlc-gui.plist",
    "~/Library/Saved Application State/com.redhat.rhtlc-gui.savedState",
  ]
end
