## Mi actual desktop
<div>
  <img src="https://github.com/camilof99/dotfiles-awesome/blob/master/desktop.png" width="100%">
  <img src="https://github.com/camilof99/dotfiles-awesome/blob/master/desktop1.png" width="100%">
</div>

## My rice :3

* **Window Manager** • <a href="https://github.com/awesomeWM/awesome">AwesomeWM</a>
* **Shell** • Zsh 
* **Terminal** • <a href="https://github.com/kovidgoyal/kitty">Kitty</a> 
* **Bar** • Wibar
* **Compositor** • <a href="https://github.com/ibhagwan/picom-ibhagwan-git">Picom</a> 
* **Launcher** • Rofi
* **Generator Colors** • <a href="https://github.com/dylanaraps/pywal">Pywal</a> 

## Dependencies

**Install:**
* AwesomeWM
  ```
  paru -S awesome-git
  ```
* Picom
  ```
  paru -S picom-ibhagwan-git
  ```
* Kitty
  ```
  paru -S kitty
  ```
* ZSH and dependencies
  ```
  paru -S zsh
  paru -S zsh-syntax-highlighting
  paru -S zsh-autosuggestions
  ```
  ```
  pacman -S starship
  ```
  ```
  cd /usr/share
  sudo su
  mkdir zsh-sudo
  chown 'youUser' zsh-sudo/
  cd zsh-sudo
  wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
  ```
* Rofi (Credits to <a href="https://github.com/adi1090x/rofi">adi1090x</a>  for the theme)
  ```
  sudo pacman -S rofi
  ```
* Neofetch
  ```
  paru -S neofetch
  ```
* Nitrogen
  ```
  paru -S nitrogen
  ```
* MPD and Ncmpcpp
  ```
  paru -S ncmpcpp mpv mpd mpc 
  systemctl --user enable mpd.service
  systemctl --user start mpd.service
  ```
* Neofetch~/.fonts or ~/.local/share/fonts
  * Download zip Hack Nerd Font <a href="https://www.nerdfonts.com/font-downloads">here</a>
  ```
  cp Hack.zip ~/.fonts or ~/.local/share/fonts~/.fonts or ~/.local/share/fonts
  cd ~/.fonts or ~/.local/share/fonts
  unzip Hack.zip
  rm Hack.zip
  fc-cache -fv
  ```
 
**Later:**
 ```
  git clone https://github.com/camilof99/dotfiles-awesome
 ```
 ```
  cd dotfiles-awesome
  cp .zshrc /home/'youUser'
  cp -r config/* ~/.config/
 ```
 ```
  cd .config/awesome
  git clone https://github.com/streetturtle/awesome-wm-widgets
  git clone https://github.com/streetturtle/awesome-buttons
 ```
 ```
  reboot
 ```
**Note:**

* To change the wallpaper and generate the colors automatically, I use Nitrogen and Pywal.
  * Choose your wallpaper with Nitrogen
  * Later:
```
  cd .config/awesome/scripts
  
  ./generate-colors.sh
  
  Later keyboard ctrl + r
```

* To see the keyboard shortcuts press super + s // Feel free to change them

***I hope you enjoy :)***

***If there are errors, report them <a href="https://t.me/Ca_milo99">here</a>.***


## Credits

* To the reddit community of <a href="https://www.reddit.com/r/unixporn/">r/unixporn.</a>
* To the Arch Linux group (Telegram).
