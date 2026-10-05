cask "rhtlc-gui" do
  version "6.0.2"

  on_arm do
    sha256 "e3b1fa07026007b717f1fc0a04e21635f0d3acbaf25cab5c5341c6e0b6131a19"

    url "https://github.com/RedHatTraining/homebrew-rhtlc/releases/download/v6.0.2/rhtlc-gui-macos-arm64.zip"
  end
  on_intel do
    sha256 "c9399bb910ba95f1894b3fdfddbdc07c24db2f20e2412011f9ceb0d68671b922"

    url "https://github.com/RedHatTraining/homebrew-rhtlc/releases/download/v6.0.2/rhtlc-gui-macos-x86_64.zip"
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
