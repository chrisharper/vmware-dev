## Source
https://www.atlassian.com/git/tutorials/dotfiles

## Setup
```
git clone --bare git@github.com/chrisharper/dotfiles $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout 
dotfiles config --local status.showUntrackedFiles no
```

### Operations
```
dotfiles add .tmux.conf
dotfiles commit -m "Add .tmux.conf"
dotfiles push
```
