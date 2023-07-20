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

### i3
```shell
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3 // logout & log back in once install completed
```
[ressource](https://i3wm.org/docs/repositories.html)

### Neovim
```shell
sudo apt install ninja-build gettext cmake unzip curl // install build prerequisites
git clone https://github.com/neovim/neovim
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb // default install location is /usr/local
```
[ressource](https://github.com/neovim/neovim/wiki/Building-Neovim)

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
