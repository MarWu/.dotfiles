# Setup dotfiles repo
> git init --bare $HOME/.dotfiles
> alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no

# Link to guide
[[https://www.atlassian.com/git/tutorials/dotfiles]]
