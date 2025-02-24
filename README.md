# .dotfiles

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

### UniMatrix
```shell
sudo curl -L https://raw.githubusercontent.com/will8211/unimatrix/master/unimatrix.py -o /usr/local/bin/unimatrix
sudo chmod a+rx /usr/local/bin/unimatrix
unimatrix --asynchronous --flashers --character-list=m --color=red
```
[ressource](https://github.com/will8211/unimatrix)

### Polybar
```shell
sudo apt install polybar
```
[ressource](https://github.com/polybar/polybar)

### Rofi
```shell
sudo apt install rofi
```
[ressource](https://github.com/davatorium/rofi)

### i3
```shell
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3 // logout & log back in once install completed
```
[ressource](https://i3wm.org/docs/repositories.html)

### Picom
```shell
sudo apt install picom
```
[ressource](https://github.com/yshui/picom)

### Neofetch
```shell
sudo apt install neofetch
```
[ressource](https://github.com/dylanaraps/neofetch)

### nmap
```shell
sudo apt install nmap
```

### htop
```shell
sudo apt install htop
```
[ressource](https://github.com/htop-dev/htop)

### Gnome terminal profile
```shell
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < .material-theme-profile.dconf // restore the profile

dconf dump /org/gnome/terminal/legacy/profiles:/ // list profiles, take [profileid]
dconf dump /org/gnome/terminal/legacy/profiles:/:profileid/ > .material-theme-profile.dconf // export profile
sudo apt install compton compton-conf
```
[ressource](https://gist.github.com/fdaciuk/9ec4d8afc32063a6f74a21f8308e3807)

### feh
```shell
sudo apt install feh
```

### Neovim
```shell
sudo apt install ninja-build gettext cmake unzip curl // install build prerequisites
git clone https://github.com/neovim/neovim
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb // default install location is /usr/local
```
[ressource](https://github.com/neovim/neovim/wiki/Building-Neovim)

### lf
building from source requires Go
```shell
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest
```
[ressource](https://github.com/gokcehan/lf)

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
