cask "rhtlc-gui" do
  version "5.1.1"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.1/rhtlc-gui-macos-x86_64.zip"
    sha256 "0741f4e30476562d59a1c312579610ad9a2e33c3e387737e59ff47f78652a00f"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.1/rhtlc-gui-macos-arm64.zip"
    sha256 "0b32a83619f1064993cf5246a5b6f6f72847d53973ec45212226110c2d2d4fea"
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
