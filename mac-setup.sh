#!/bin/bash

sudo -v

echo "💾 Installing Homebrew if not installed..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "📦 Installing required apps and tools..."
brew install git
brew install --cask iterm2
brew install --cask raycast
brew install --cask maccy
brew install --cask alt-tab
brew install --cask rectangle
brew install --cask karabiner-elements
brew install --cask betterdisplay
brew install --cask stay
brew install --cask display-menu
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

echo "⚙️ Setting macOS defaults..."
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder ShowPathbar -bool true
chflags nohidden ~/Library

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

defaults write -g com.apple.swipescrolldirection -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.spaces spans-displays -bool true

killall Finder
killall Dock

echo "🎛️ Configuring ZSH with Dracula + plugins..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"

curl -fsSL https://raw.githubusercontent.com/dracula/zsh/master/dracula.zsh-theme -o "${ZSH_CUSTOM}/themes/dracula.zsh-theme"

curl -fsSL https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors -o ~/Downloads/Dracula.itermcolors

echo "🧠 Reminder: Import Dracula.itermcolors in iTerm2 Preferences > Profiles > Colors"

echo "✅ mac-setup complete! Reload terminal with 'source ~/.zshrc'"
