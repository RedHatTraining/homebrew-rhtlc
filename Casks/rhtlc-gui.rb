cask "rhtlc-gui" do
  version "5.1.0"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.0/rhtlc-gui-macos-x86_64.zip"
    sha256 "2e7c05479fa88485074b77d5c540c5be1271d00e0b55e229015157a7c5e48cc7"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.0/rhtlc-gui-macos-arm64.zip"
    sha256 "b449f371f4fcebe99b6b805aa6f2cf0f1f4b9fea0874fe645aba6eb68fc1297a"
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
