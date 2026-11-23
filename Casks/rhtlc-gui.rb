cask "rhtlc-gui" do
  version "6.2.1"

  on_arm do
    sha256 "b6c0f667be98ed584044654621258b8cfcf2ef97a6ee774d2a263f7ed009fb79"

    url "https://github.com/RedHatTraining/homebrew-rhtlc/releases/download/v6.2.1/rhtlc-gui-macos-arm64.zip"
  end
  on_intel do
    sha256 "f55720a446d131b086c7db660fab9724e84094f3b711f657630208cf61fbae18"

    url "https://github.com/RedHatTraining/homebrew-rhtlc/releases/download/v6.2.1/rhtlc-gui-macos-x86_64.zip"
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
