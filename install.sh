
      #########.
     ########",#:
   #########',##".
  ##'##'## .##',##.
   ## ## ## # ##",#.
    ## ## ## ## ##'
     ## ## ## :##
      ## ## ##."

# Based on the work of kube (github.com/kube/42homebrew)

# Delete and reinstall Homebrew from Github repo
rm -rf $HOME/homebrew
git clone --depth=1 https://github.com/Homebrew/brew $HOME/homebrew

# Create $HOME/homebrew/Caches and $HOME/homebrew/Temp
mkdir -p $HOME/homebrew/Caches
mkdir -p $HOME/homebrew/Temp

# Create .brewconfig script in home directory 
cat > $HOME/.brewconfig.zsh <<EOL
# HOMEBREW CONFIG

# Add brew to path
export PATH=\$HOME/homebrew/bin:\$PATH

# Set Homebrew temporary folders
export HOMEBREW_CACHE=\$HOME/homebrew/Caches
export HOMEBREW_TEMP=\$HOME/homebrew/Temp
EOL

# Add .brewconfig sourcing in your .zshrc if not already present
if ! grep -q "# Load Homebrew config script" $HOME/.zshrc
then
cat >> $HOME/.zshrc <<EOL

# Load Homebrew config script
source \$HOME/.brewconfig.zsh
EOL
fi

source $HOME/.brewconfig.zsh
rehash
brew update

echo "\nPlease open a new shell to finish installation"