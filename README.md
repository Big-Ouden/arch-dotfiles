# arch-dotfiles


Le projet est peut être un peu fou mais l'objectif est de créer / assembler un os qui réponde exactement à mes besoins et qui soit léger en ressources en Idle et pour des opérations basiques. 

# Mes besoins

**Ressources**
Il faut que la consommation de batterie soit optimisé => il faut une utilisation des ressources (RAM,CPU,GPU..👀) qui soient minimes. 
Il faut donc choisir une distro optimisé dans ce sens. Debian semble être un bon premier choix.  
Voir si Arch ne serait pas mieux mais ATTENTION : Il faut de la stabilité (pas de problèmes à la con de librairies dynamiques .so par exemple) 

**UI** 

Il faut pouvoir customizer l'apparence de la distro (top bar, terminal, shell, explorateur de fichier) et que le maximum de thèmes principaux soient supportés sur **tous** les logiciels :  
- dark theme (basique) 
- light theme (basique) 
- catpuccin 
- gruvbox 
- tokyo-night 

**UX** 

Il faut que l'utilisateur ne s'embête pas sur des choses basiques (montage périphériques de stockage, connexion wifi/ethernet, changement de wallpaper, ajout de nouvel écran - et ce peu importe la taille de l'écran-). 
Il faut donc des applications GUI pour les utilisations basiques (ecran, connexion, ajout vpn ...) 

Il faut un tiling windows manager (prcq le tiling c'est la meilleur chose qui existe) mais attention :  
- il faut pas de problèmes d'affichages pour les appli gui (fenetre trop grande, gestionnaire de connexion qui se met en tout petit en mode tiling) => les application gui se mettent en floating par défaut (et/ou en avant plan )   


# Choix

## Distro

Arch (btw) - sans surcouches à la con

## Gestionnaire de paquets

Pacman (official)  
AUR (community driven)
Paru (AUR Helper) 
Utilisation de devcontainers et Distrobox (ou équivalents) pour layered des applications (comme des Appli GUI à la con, mais pas vscode car je veux utiliser des devcontainers sans faire du layered dans du layered)

## Application

| Nom | Solution(s) |
|:--:|:--:|
| Kernel                  |   Default Arch Kernel + installer Linux-zen après (pour les paquets virtual box par ex) |
| Display/login manager   |   sddm |
| Display server          |   wayland |
| Window manager          |   Hyprland |
| shell                   |   bash (oui, plus de zsh !) |
| Prompt                  |   Starship |
| terminal                |   kitty |
| Top bar                 |   waybar |
| Notification Daemno     |   dunst |
| Launcher                |   fuzzel  |
| File manager (tui)      |   yazi |
| File manager (gui)      |   nemo |
| File manager plugins    |   nemo-fileroller, nemo-terminal |
| Font                    |   la font de Zel, Iosevka Nerd Font |
| Editor                  |   Neovim - vim - Helix |
| IDE                     |   Vscode (telemetry disabled) |
| Dotfile manager         |   Stow |
| Terminal multiplexer    |   Tmux (yen a vraiment d'autres ?) |
| Zoom                    |   hypr-zoom |
| Simple X11 menu         |   jgmenu |
| Network Manager         |   Network Manager, network-manager-applet (pour waybar) |
| Bluetooth manager       |   blueman, blueman-applet (pour waybar) |
| Screenshoter            |   Hyprshot |
| Clipboard manager       |   clipse |
| GTK3 settings editor    |   nwg-look |
| Monitor manager         |   nwg-displays |
| Wallpaper manager       |   hyprpaper |
| Color picker            |   hyprpicker  |
| Lockscreen              |   hyprlock |
| Discord                 |   Vesktop |
| Discord (web)           |   Webcord |
| Cursor                  |   Hyprcursor |
| Theme switcher          |   https://github.com/Petingoso/dotfiles - dotfiles/dot_local/bin/executable_theme_changer_WL |
| bluelight filter + shader manager   |   hyprshade    |
| Browser                 |   Firefox, python-pywalfox, python-pywal (firefox and auto firefox theming) |
| Password manager        |   bitwarden |
| System fetch            |   Neofetch, macchina |
| Pdf viewer              |   Zathura |
| sound and brightness    |   playerctl, light ?? |
| Video player            |   mpv |
| Image viewer            |   qView |
| Calculator              |   Rofi-calc |
| Report editor           |   Latex (devcontainers), Typst (devcontainer too ??) |
| VPN                     |   OpenVPN, wireguard |

Application à installer:
syncthing
Obsidian








