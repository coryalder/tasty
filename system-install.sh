
# install hyprland and noctalia
dnf copr enable lionheartp/Hyprland enables the repo
dnf in noctalia-hyprland-meta

# install apps I like
dnf in alacritty # don't forget to add its config file `src/alacritty/alacritty.toml`, belongs in ~/.config/alacritty/alacritty.toml
dnf in vim-enhanced

dnf in nodejs
npm install -g --ignore-scripts @earendil-works/pi-coding-agent

# flatpak
dnf install flatpak # probably not needed
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install flatpak apps I like
flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub org.localsend.localsend_app

# prompt user for which text editor to install ([v]scode, [c]osmic, [s]ublime, or [a]ll)
flatpak install -y flathub com.sublimehq.SublimeText
flatpak install -y flathub com.system76.CosmicEdit
flatpak install -y flathub com.visualstudio.code

flatpak install -y flathub org.inkscape.Inkscape

# install h.264 extensions