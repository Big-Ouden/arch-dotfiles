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

| Nom | Solution(s) | Done |
|:--:|:--:|:--:|
| Kernel                  |   Default Arch Kernel + installer Linux-zen après (pour les paquets virtual box par ex) | x |
| Display server          |   wayland | x |
| Display/login manager   |   sddm | ~ |
| Bootmenu                |   Grub | ~ |
| Window manager          |   Hyprland | x |
| AUR Helper              |   Paru | x |
| shell                   |   bash (oui, plus de zsh !) | |
| Prompt                  |   Starship | |
| terminal                |   kitty | |
| Top bar                 |   waybar | |
| Notification Daemno     |   dunst | |
| Launcher                |   fuzzel  | |
| File manager (tui)      |   yazi | |
| File manager (gui)      |   nemo | |
| File manager plugins    |   nemo-fileroller, nemo-terminal | |
| Font                    |   la font de Zel, Iosevka Nerd Font | |
| Editor                  |   Neovim - vim - Helix | |
| IDE                     |   Vscode (telemetry disabled) | |
| Dotfile manager         |   Stow | |
| Terminal multiplexer    |   Tmux (yen a vraiment d'autres ?) | |
| Zoom                    |   hypr-zoom | x |
| Simple X11 menu         |   jgmenu | |
| Network Manager         |   Network Manager, network-manager-applet (pour waybar) | |
| Bluetooth manager       |   blueman, blueman-applet (pour waybar) | |
| Screenshoter            |   Hyprshot | |
| Clipboard manager       |   clipse | |
| GTK3 settings editor    |   nwg-look | |
| Monitor manager         |   nwg-displays | |
| Wallpaper manager       |   hyprpaper | ~ |
| Color picker            |   hyprpicker  | |
| Lockscreen              |   hyprlock | |
| Discord                 |   Vesktop | |
| Discord (web)           |   Webcord | |
| Cursor                  |   Hyprcursor | |
| Theme switcher          |   [https://github.com/Petingoso/dotfiles - dotfiles/dot_local/bin/executable_theme_changer_WL] | |
| bluelight filter + shader manager   |   hyprshade    | |
| Browser                 |   Firefox, python-pywalfox, python-pywal (firefox and auto firefox theming) | |
| Password manager        |   bitwarden | |
| System fetch            |   Neofetch, macchina | |
| Pdf viewer              |   Zathura | |
| sound and brightness    |   playerctl, light ?? | |
| Video player            |   mpv | |
| Image viewer            |   qView | |
| Calculator              |   Rofi-calc | |
| Report editor           |   Latex (devcontainers), Typst (devcontainer too ??) | |
| VPN                     |   OpenVPN, wireguard | |

Application à installer:
syncthing
Obsidian






# Mise en place et installation


Arch installé en suivant le wiki (plus simple finalement) et avec l'utilitaire "archinstall". Les manip post-install sont aussi faites.


## Customisation

### Grub

Mise en place d'un nouveau theme pour le grub (juste pour que ce soit plus joli). Il y a juste à télécharger n'importe quel thème et à le mettre dans : `/usr/share/grub/themes/`. 
Puis modifier `/etc/default/grub` : 
```bash
GRUB_THEME="/usr/share/grub/themes/nom-du-theme/theme.txt"
```


> [!NOTE] 
> À terme dans le script qui permettra de changer facilement de theme, il faut changer la config grub. 


> [!IMPORTANT]
> Il ne faut pas oublier d'actualiser la configuration de grub en faisant : 
> `sudo grub-mkconfig -o /boot/grub/grub.cfg ` 


### Sddm

Sddm (pour Simple Desktop Display Manager) est un display manager. C'est ce qui permet de se login avant d'arriver dans sa session. C'est un "Graphical login program and session manager". 

Lui aussi c'est possible de le customiser et on va utiliser "sdd-astronaut-theme". C'est une serie de theme (dynamiques et static) asez sympa. 
Github : https://github.com/Keyitdev/sddm-astronaut-theme#

> [!NOTE]
> Il faudra analyser le code d'installation et les thèmes en eux même afin de facilement moidifier le wallpaper et proposer des themes en accords avec ceux du systèmes. Dans le script qui permettra de changer le thème du système, il faudra garder une cohérence en somme.


Pour le coup l'installation de ce thème est plus simple étant donné qu'il vient avec un script TT. Voici les grandes ligne pour ajouter un thème et l'activer : 
- installer des paquets necessaires : sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
-  ajouter le repo du theme dans `/usr/share/sddm/themes`
-  ajouter les fonts nécessaires dans `/usr/share/fonts`
-  éditer/créer `/etc/sddm.conf` : 
```bash
[Theme]
    Current=sddm-astronaut-theme

[General]
    InputMethod=qtvirtualkeyboard
```


Pour sddm-astronaut-theme il faut modifier `/usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop` pour changer le thème : 
```
ConfigFile=Themes/le-theme-a-choisir.conf
```



Même si le script fournit permet de faire tout ça.



### Wallpaper


J'ai choisis d'utiliser hyprpaper, et la plupart de mes paquets seront des "hypr\*" parcequ'il sont souvent simple, léger, fait pour hyprland, recommandé par Hyprland.


Github : https://github.com/hyprwm/hyprpaper 


#### Installation 


Hyprpaper : 


```bash
pacman -S hyprpaper
```

Dépendances (s'installent déjà avec pacman) : 
```bash
sudo pacman -S ninja gcc wayland-protocols libjpeg-turbo libwebp libjxl pango cairo pkgconf cmake libglvnd wayland hyprutils hyprwayland-scanner hyprlang
```

Créer le fichier `~/.config/hypr/hyprpaper.conf` et le remplir : 
```bash
preload = /path/to/image.png
#if more than one preload is desired then continue to preload other backgrounds
preload = /path/to/next_image.png
# .. more preloads

#set the default wallpaper(s) seen on initial workspace(s) --depending on the number of monitors used
wallpaper = monitor1,/path/to/image.png
#if more than one monitor in use, can load a 2nd image
wallpaper = monitor2,/path/to/next_image.png
# .. more monitors

#enable splash text rendering over the wallpaper
splash = true

#fully disable ipc
# ipc = off
```

(Voir la doc) 


> [!NOTE]
> Faire un script qui preload le nouveau wallpaper, set le nouveau wallpaper et unload l'ancien wallpaper


Ajouter le fait d'executer hyprpaper au démarrage de Hyprland dans `~/.config/hypr/hyprland.conf` : 
```bash
$wallpaper = hyprpaper
exec-once = $wallpaper
```

Ne pas oublier de modifier la config misc de hyprland. Sinon l'autre wallpaper de Hyprland se met en dessous de hyprpaper. En plus de le voir pendant 1 seconde au démarrage de Hyprland, dans l'idée c'est bizarre de laisser ça activer. : 
```bash
misc {
    force_default_wallpaper = 1
    disable_hyprland_logo = true
}
```


### PARU

"Paru is your standard pacman wrapping AUR helper with a lot of features and minimal interaction."

Il suffit de suivre le repo git qui explique comment installer : 
```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```


Examples: 
- `paru <target>` -- Interactively search and install <target>.
- `paru` -- Alias for paru -Syu.
- `paru -S <target>` -- Install a specific package.
- `paru -Sua` -- Upgrade AUR packages.
- `paru -Qua` -- Print available AUR updates.
- `paru -G <target>` -- Download the PKGBUILD and related files of <target>.
- `paru -Gp <target>` -- Print the PKGBUILD of <target>.
- `paru -Gc <target>` -- Print the AUR comments of <target>.
- `paru --gendb` -- Generate the devel database for tracking *-git packages. This is only needed when you initially start using paru.
- `paru -Bi . ` -- Build and install a PKGBUILD in the current directory.


### Scratchpad

Le principe du scratchpad est d'envoyer une fenetre dans un bureau qui est ailleur et qui n'est pas parmis ceux que l'on utilise d'habitude (1-9). Par exemple on peut envoyer une fenetre de terminal dans le scratchpad le temps d'écrire du code et la faire revenir pour compiler ce programme dans le terminal que nous avions viré. 

Personnellement, j'utilise le scratchpad pour virer des fenêtre qui me serviront plus tard ou où des programmes tournent et que je veux virer de mon espace visuel.

J'ai un peu du mal à utiliser le scratchpad natif d'Hyprland du coup j'ai utilisé une contribution de la communauté : https://github.com/hyprwm/contrib.

Dépendances : 
- jq
- rofi

```bash
sudo pacman -S jq rofi
``` 


Il suffit de cloner le repo et faire un `sudo make install`. Je n'ai pas encore vérifié le code à l'intérieur.


> [!NOTe]
> Il faudrait modifier le code source pour que le launcher puisse être différent de rofi (fuzzel par ex)

J'ai ensuite choisi les keybind suivant dans la config hyprland: 
```bash
bind = $mainMod, code:20, exec, scratchpad
bind = $mainMod SHIFT, code:20,exec,  scratchpad -g
```

Keybinds: 
-  `SUPER+)` : envoyer le fenetre courante dans le scratchpad
- `SUPER+SHIFT+)` : afficher un menu rofi pour choisir la fenêtre à faire revenir



### Hyprzoom


Ok c'est pas le truc le plus utile mais en fait si! Ça me manquais trop sur les autres distro (merci a Zel de m'avoir rappelé le nom du paquet).


Premièrement il faut l'installer depuis AUR (voir la section sur PARU)
```bash
paru hypr-zoom
```

Puis ajouter ces keybinds à hyprland : 
```bash
# Zoom In/Out anywhere with hypr-zoom
bind = $mainMod, code:21, exec, hypr-zoom -easing=InOutExpo -duration=100 -steps=50 -target=2 
bind = $mainMod SHIFT, mouse:272, exec, hypr-zoom -easing=InOutExpo -duration=100 -steps=50 -target=2 
```

et de commenter ceux-là (oui c'est gratuit) : 
```bash
# Scroll through existing workspaces with mainMod + scroll
#bind = $mainMod, mouse_down, workspace, e+1
#bind = $mainMod, mouse_up, workspace, e-1
```


Keybinds : 
- `SUPER+=` : active/désactive le zoom
- `SUPER+SHIFT+right_click` : active/désactive le zoom 





