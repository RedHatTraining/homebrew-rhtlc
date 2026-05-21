cask "rhtlc-gui" do
  version "5.0.8"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-gui-macos-x86_64.zip"
    sha256 "596887b481759d5bff0f37ae303442f30de01f61cece1b970b000f9d36773758"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.8/rhtlc-gui-macos-arm64.zip"
    sha256 "48effa97bb47dde2f88c48057f1bb035759df6c2fc28be57d5ba904ff6ee9589"
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
