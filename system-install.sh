
# install hyprland and noctalia
dnf copr enable lionheartp/Hyprland enables the repo
dnf in noctalia-hyprland-meta

# dnf install apps I like
# [alacritty, vim-enhanced, nodejs, flatpak]
# dnf in package-name
# don't forget to add alacritty's config file `src/alacritty/alacritty.toml`, belongs in ~/.config/alacritty/alacritty.toml
npm install -g --ignore-scripts @earendil-works/pi-coding-agent

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# flatpak install -y flathub com.package.identifier
# [ com.bitwarden.desktop, org.localsend.localsend_app, org.inkscape.Inkscape]

# prompt user for which text editor to install ([v]scode, [c]osmic, [s]ublime, or [a]ll)
flatpak install -y flathub com.sublimehq.SublimeText
flatpak install -y flathub com.system76.CosmicEdit
flatpak install -y flathub com.visualstudio.code

