cask "rhtlc-gui" do
  version "5.0.9"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.9/rhtlc-gui-macos-x86_64.zip"
    sha256 "93909f880ecff2583802e07cc72b21075a977981446766fd82400d4e1334e7f8"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.9/rhtlc-gui-macos-arm64.zip"
    sha256 "7bc41aa6529711a9bb605bb848a8512c89cdd0cfd71803f2f59674ed720938f6"
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
