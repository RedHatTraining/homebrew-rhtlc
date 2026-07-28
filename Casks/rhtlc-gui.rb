cask "rhtlc-gui" do
  version "5.1.2"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.2/rhtlc-gui-macos-x86_64.zip"
    sha256 "7df85b843f1ec4ff0e84e58a075c55ee59965a4a04986c05883babb5bde28c58"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.1.2/rhtlc-gui-macos-arm64.zip"
    sha256 "2a24bb0be5f3e3f873bfe202d257764a647302686bd22525989ee3b38b0b962c"
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
