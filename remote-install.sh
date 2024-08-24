SYSTEM=$(uname -s)

# Install XCode Command Line Tools
# TODO: Add if statement
echo "Installing XCode Command Line Tools"
xcode-select --install

# Install Homebrew
if [ "$SYSTEM" = "Darwin" ]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Adding brew to session
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# Install YADM
if ! command -v yadm >/dev/null 2>&1; then
  echo "Installing yadm"
  brew install yadm
fi

# Run yadm clone
yadm clone https://github.com/harshPPatel/dotfiles.git
