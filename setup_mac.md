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

You can then syncronize with you regular settings you're used to on your local machine. As you may add some extensions, best would be to syncronize and un-syncronize so you can get your previous extensions and add new ones without messing with your local config.

## macOS Terminal Theme

Launch a terminal, click on `Terminal > Preferences` and set the "Pro" theme as default profile. In Window tab, set also your **Window Size** to Columns: 200, Rows: 50.
Modify as you like.

## Oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

If asked "Do you want to change your default shell to zsh?", press `Y`

## Dotfile

You can use this basic setup for setting your dotfiles.

Clone this repo:

Open your terminal and set a variable for your GitHub username:

### Dotfiles installer

```bash
zsh install.sh
```

### git installer

Run the `git` installer:

```bash
zsh git_setup.sh
```

:point_up: This will **prompt** you for your name (`FirstName LastName`) and your email.

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

## .gitconfig

This config file should be located in your $HOME directory.
Modify as you like, this is a nice default.

```bash
[color]
  branch = auto
  diff = auto
  interactive = auto
  status = auto
	ui = true

[color "branch"]
  current = green
  remote = yellow

[core]
	pager = diff-so-fancy | less --tabs=4 -RFX
  editor = code --wait

[alias]
  co = checkout
  st = status -sb
  br = branch
  ci = commit
  fo = fetch origin
  d = !git --no-pager diff
  dt  = difftool
  stat = !git --no-pager diff --stat

  # Set remotes/origin/HEAD -> defaultBranch (copied from https://stackoverflow.com/a/67672350/14870317)
  remoteSetHead = remote set-head origin --auto

  # Get default branch name (copied from https://stackoverflow.com/a/67672350/14870317)
  defaultBranch = !git symbolic-ref refs/remotes/origin/HEAD | cut -d'/' -f4

  # Clean merged branches (adapted from https://stackoverflow.com/a/6127884/14870317)
  sweep = !git branch --merged $(git defaultBranch) | grep -E -v " $(git defaultBranch)$" | xargs -r git branch -d && git remote prune origin

  # http://www.jukie.net/bart/blog/pimping-out-git-log
  lg = log --graph --all --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset'

  # Serve local repo. http://coderwall.com/p/eybtga
  # Then other can access via `git clone git://#{YOUR_IP_ADDRESS}/
  serve = !git daemon --reuseaddr --verbose  --base-path=. --export-all ./.git

  # Checkout to defaultBranch
  m = !git checkout $(git defaultBranch)

  # Removes a file from the index
  unstage = reset HEAD --

[help]
  autocorrect = 1

[push]
  default = simple

[branch "master"]
  mergeoptions = --no-edit

[pull]
  rebase = false

[init]
  defaultBranch = master
[user]
	email = maxencerobinet@gmail.com
	name = Maxence Robinet
[interactive]
	diffFilter = diff-so-fancy --patch
[color "diff-highlight"]
	oldNormal = red bold
	oldHighlight = red bold 52
	newNormal = green bold
	newHighlight = green bold 22
[color "diff"]
	meta = 11
	frag = magenta bold
	func = 146 bold
	commit = yellow bold
	old = red bold
	new = green bold
	whitespace = red reverse
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

## Chrome

Install the latest version of Chrome and syncronize bookmarks using your asap.work email.

## Slack

[Download the Slack app](https://itunes.apple.com/us/app/slack/id803453959?mt=12) and install it.

:warning: If you are already using Slack in your browser, please download and install **the desktop app** which is fully featured.
