# A guide to setup a mac for development at asap.work

Inspired by Le Wagon's setup.

## Install xcode

```bash
xcode-select --install
```

If you see the message "Xcode is not currently available from the Software Update server", you need to update the software update catalog:

```bash
sudo softwareupdate --clear-catalog
```

## Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

If you're asked to, run these commands to add brew to make sure brew installed programs are included in your $PATH.

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Let's install some softwares.

```bash
brew update
```

If you get a `/usr/local must be writable` error, just run this:

```bash
sudo chown -R $USER:admin /usr/local
```

```bash
brew update
```

Proceed running the following in the terminal.

```bash
brew upgrade git || brew install git
brew upgrade gh || brew install gh
brew upgrade wget || brew install wget
brew upgrade openssl || brew install openssl
```

## Visual Studio Code

In the context of brew, a cask is a program with graphic user interface (GUI).

```bash
brew install --cask visual-studio-code
```

Don't forget to add your favorite extensions and recommended extensions once you cloned the repo.

## macOS Terminal Theme

Launch a terminal, click on `Terminal > Preferences` and set the "Pro" theme as default profile. In Window tab, set also your **Window Size** to Columns: 200, Rows: 50.
Modify as you like.

## Oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

If asked "Do you want to change your default shell to zsh?", press `Y`

## Dotfile

These are basic scripts to set up your config files in your $HOME directory.
This will basically add gitconfig, zprofile and zshrc basic config and also modify SSH configuration.

1. Clone this repo and run the script

```bash
zsh install.sh
```

Then run the `git` setup installer:

```bash
zsh git_setup.sh
```

## GitHub CLI

```bash
gh auth login -s 'user:email' -w
```

gh will ask you few questions:

`What is your preferred protocol for Git operations?` With the arrows, choose `SSH` and press `Enter`. SSH is a protocol to log in using SSH keys instead of the well known username/password pair.

`Generate a new SSH key to add to your GitHub account?` Press `Enter` to ask gh to generate the SSH keys for you.

If you already have SSH keys, you will see instead `Upload your SSH public key to your GitHub account?` With the arrows, select your public key file path and press `Enter`.

`Enter a passphrase for your new SSH key (Optional)`. Type something you want and that you'll remember. It's a password to protect your private key stored on your hard drive. Then press `Enter`.

`Title for your SSH key`. You can leave it at the proposed "GitHub CLI", press `Enter`.

You will then get the following output:

```bash
! First copy your one-time code: 0EF9-D015
- Press Enter to open github.com in your browser...
```

Select and copy the code (`0EF9-D015` in the example), then press `Enter`.

Your browser will open and ask you to authorize GitHub CLI to use your GitHub account. Accept and wait a bit.

Come back to the terminal, press `Enter` again, and that's it.

To check that you are properly connected, type:

```bash
gh auth status
```

## Install node/nvm

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
```

```bash
exec zsh
```

Then run the following command:

```bash
nvm -v
```

You should see a version. If not, ask a teacher.
You'll be able, after cloning the repo to run this command and it will install the correct node version.

```bash
nvm install
```

nvm uses .nvmrc file so it know what version of node to use/install in a specific project.

## PostgreSQL

Run the following commands:

```bash
brew install postgresql@15 libpq
brew link --force libpq
```

To run a local server execute the following command. You may not need it as we're running pgsql in containers.

```bash
brew services start postgresql@15
```

## Docker

Follow the link to install [Docker](https://docs.docker.com/engine/install/)

## Deno

```bash
brew install deno
```

## Chrome

Install the latest version of Chrome and synchronize bookmarks using your asap.work email.

## Slack

[Download the Slack app](https://itunes.apple.com/us/app/slack/id803453959?mt=12) and install it.

:warning: If you are already using Slack in your browser, please download and install **the desktop app** which is fully featured.
