cask "rhtlc-gui" do
  version "3.4.1"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.1/rhtlc-gui-macos-x86_64.zip"
    sha256 "3e08db63484d631262c2ad99145e387c52df4c453ff08fee58b6626e731eb629"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.1/rhtlc-gui-macos-arm64.zip"
    sha256 "e58b735118f0a4ab8728d73cf870ca6e59c27030da0faa94e62e7bfc8571fdb3"
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
