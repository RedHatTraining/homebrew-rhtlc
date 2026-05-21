cask "rhtlc-gui" do
  version "5.0.8"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-gui-macos-x86_64.zip"
    sha256 "3c09f71008b473544094c63bdbdd23bf9c3f2c9be56603e9a1999ac7d019bead"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-gui-macos-arm64.zip"
    sha256 "4513d86226c4d952a1bc9cbb1ada4d677553a80ff1473ae5951b011326ff7db5"
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
