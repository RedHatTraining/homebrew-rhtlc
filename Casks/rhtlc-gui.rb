cask "rhtlc-gui" do
  version "5.0.7"
  
  if Hardware::CPU.intel?
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.7/rhtlc-gui-macos-x86_64.zip"
    sha256 "ef0f9c0b2563340f36b75ad9581e1ce418f6defe9e9091f337320545ef9c2a13"
  else
    url "https://github.com/RedHatTraining/homebrew-rhtlc/raw/main/releases/5.0.7/rhtlc-gui-macos-arm64.zip"
    sha256 "8ebf378c408f35e2119cbe3448752e996b2184b84ad4bfff9661ee9eb0c8ccc6"
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
