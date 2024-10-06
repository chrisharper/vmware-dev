## OSX
Fusion -> Bridged Networking  
Fedora -> Server netinst -> boot options  
inst.ks= https://github.com/chrisharper/vmware-dev/raw/refs/heads/master/.dotfiles/anaconda-ks.cfg

Secretive -> .zshrc

~/.ssh/config  
```
Host dev.local  
	ForwardAgent yes  
```
ssh-copy-id charper@dev.local 

## Dotfiles
https://www.atlassian.com/git/tutorials/dotfiles

### Operations
```
dotfiles add .tmux.conf
dotfiles commit -m "Add .tmux.conf"
dotfiles push
```




