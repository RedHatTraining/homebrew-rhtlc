cask "rhtlc-gui" do
  version "3.4.1"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.1/rhtlc-gui-macos-x86_64.zip"
    sha256 "81418c334ae82cc6966e2d13e254b12f8c6f2d935218113e050a69599ce66200"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/3.4.1/rhtlc-gui-macos-arm64.zip"
    sha256 "c42e8fbd58399d2660bd5195220a5178e1b710770391076ef93fb7def81b2b8d"
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
