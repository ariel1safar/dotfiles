#!/bin/bash

echo "🛠️ Starting Dotfiles Installation..."

DOTFILES_DIR="$HOME/code/dotfiles"

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "📦 Cloning dotfiles repo..."
  git clone https://github.com/your-username/dotfiles.git "$DOTFILES_DIR"
fi

echo "🔗 Creating symlinks..."
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/.aliases" ~/.aliases

echo "⚙️ Running macOS setup..."
bash "$DOTFILES_DIR/mac-setup.sh"

echo "✅ All done! Restart terminal or run 'source ~/.zshrc'"
