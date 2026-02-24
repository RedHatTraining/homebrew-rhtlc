cask "rhtlc-gui" do
  version "4.0.0"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.0/rhtlc-gui-macos-x86_64.zip"
    sha256 "6e84f9f21fbefd484c067e227f065c9b4a53f45ce41fe657f4ecedadc173835c"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/4.0.0/rhtlc-gui-macos-arm64.zip"
    sha256 "fa519e5ac4e8b214379a3eb987a956bba781d0b8e72de4c19c41182c122cc02a"
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
