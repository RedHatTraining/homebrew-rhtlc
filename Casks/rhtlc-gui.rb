cask "rhtlc-gui" do
  version "4.0.2"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.2/rhtlc-gui-macos-x86_64.zip"
    sha256 "cc6c9490971bac4343d22e6d36a6c17ad1e7c4aab6c5ac231655f0cbb1ee1963"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.2/rhtlc-gui-macos-arm64.zip"
    sha256 "19d26253bdad86654eeca63d36c2119a796511e8cdc8aa418f0c4ade15557eb4"
  end

  name "RHTLC GUI"
  desc "Red Hat Training Lab Connector - Graphical interface for training environments"
  homepage "https://github.com/RedHatTraining/homebrew-rhtlc"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/RHTLC-GUI.app"],
                   sudo: false
  end

  app "RHTLC-GUI.app"

  zap trash: [
    "~/Library/Preferences/com.redhat.rhtlc-gui.plist",
    "~/Library/Application Support/RHTLC",
    "~/Library/Saved Application State/com.redhat.rhtlc-gui.savedState",
  ]
end
