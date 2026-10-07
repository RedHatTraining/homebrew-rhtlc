## MacOS Installation Instructions
The recommended and supported method for installing RHTLC on MacOS is by using Homebrew. Homebrew installs both GUI and CLI interfaces, with automatic updates and no quarantine issues.

Install:
```
# Add the RHTLC tap
brew tap RedHatTraining/rhtlc

# Install CLI (available immediately as 'rhtlc' in any terminal)
brew install rhtlc

# Install GUI application (installs to the /Applications directory)
brew install --cask rhtlc-gui
```
Verify:
```
rhtlc --version
open -a "RHTLC-GUI"
```
Update:
```
brew update
brew upgrade rhtlc
brew upgrade --cask rhtlc-gui
```
Uninstall:
```
brew uninstall rhtlc
brew uninstall --cask rhtlc-gui
```
### macOS Notes

Apple Silicon versus Intel: Check with `uname -m`: arm64 = Apple Silicon, x86_64 = Intel.
Quarantine: macOS blocks unsigned apps. Always run the `xattr -cr` command on downloaded `.app` files.
Gatekeeper: If macOS reports that "app is damaged", then right-click and select `Open` → `Open` (might be needed twice).
URL Protocol: After the `.app` bundle is installed, the `rhtlc://` links work automatically in browsers.

NOTE: For Homebrew installation instructions, refer to https://brew.sh/.

