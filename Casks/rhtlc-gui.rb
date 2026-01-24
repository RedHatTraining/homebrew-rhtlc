cask "rhtlc-gui" do
  version "3.4.3"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.3/rhtlc-gui-macos-x86_64.zip"
    sha256 "381ac37bcb4f671f8db01ecfe2833c95671fbce4920ac99b72fbc2b1151d7d2b"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.3/rhtlc-gui-macos-arm64.zip"
    sha256 "763236b49191575476259fd3c322ead4cd61bce3271783ffc54b502f82dd5e84"
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
