#!/bin/zsh

# For all files needed files, move them to the home directory and erase the current files
for name in gitconfig zprofile zshrc; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    current="$PWD/$name"
    cp $current $target
    echo "-----> Moved $current to $target"
  fi
done

# Symlink SSH config file to the present `config` file for macOS and add SSH passphrase to the keychain
if [[ $(uname) =~ "Darwin" ]]; then
  target="$HOME/.ssh/config"
  current="$PWD/config"
  cp $current $target
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
  echo "-----> Added SSH passphrase to the keychain"
fi

# Refresh the current terminal with the newly installed configuration
exec zsh

echo "👌 Carry on with git setup!"
