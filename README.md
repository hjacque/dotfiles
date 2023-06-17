# .dotfiles

#### In order

### Keyboard layout
```shell
setxkbmap us altgr-intl
```
### Swap caps lock ctrl
```shell
'XKBOPTIONS="ctrl:swapcaps"' >> /etc/default/keyboard
sudo dpkg-reconfigure keyboard-configuration
sudo reboot
```
[ressource](https://dev.to/tallesl/change-caps-lock-to-ctrl-3c4)
### Git
```shell
sudo apt -y install git-all
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
[ressource](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
### SSH
```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
[ressource](https://docs.github.com/fr/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Zsh & Oh My Zsh
```shell
sudo apt install zsh
```
[ressource](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
```shell
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
[ressource](https://ohmyz.sh/#install)

### Dotfiles
```shell
echo ".cfg" >> .gitignore
git clone --bare git@github.com:hippolyte42/.dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout // can fail: cf. back up the files if you care about them
config config --local status.showUntrackedFiles no
```
#### back up the files if you care about them
```shell
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```
[ressource](https://www.atlassian.com/git/tutorials/dotfiles)

### Task bar
```shell
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
```
