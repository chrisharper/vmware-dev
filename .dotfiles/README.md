## Source
https://www.atlassian.com/git/tutorials/dotfiles

## Setup
```
git clone --bare git@github.com/chrisharper/dotfiles $HOME/.dotfiles
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout 
```

### Operations
```
dotfiles add .tmux.conf
dotfiles commit -m "Add .tmux.conf"
dotfiles push
```
