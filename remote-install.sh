SYSTEM=$(uname -s)

# Install XCode Command Line Tools
if [ "$SYSTEM" = "Darwin" ]; then
  if ! command -v xcode-select >/dev/null 2>&1; then
    echo "Installing XCode Command Line Tools"
    xcode-select --install
  fi
fi

# Install Homebrew
if [ "$SYSTEM" = "Darwin" ]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
fi

# Install YADM
if ! command -v yadm >/dev/null 2>&1; then
  echo "Installing yadm"
  brew install yadm
fi

# Run yadm clone
yadm clone https://github.com/harshPPatel/dotfiles.git