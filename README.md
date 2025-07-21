<div align="center">
    <img src="assets/banner.webp"></img> </br>
    <img alt="GitHub License" src="https://img.shields.io/github/license/Big-Ouden/arch-dotfiles?style=for-the-badge">
    <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/Big-Ouden/arch-dotfiles?style=for-the-badge"></img>
    <a href="https://belier.iiens.net"><img alt="Personnal blog link" src="https://img.shields.io/badge/BLOG-HOW%20I%20MANAGE%20MY%20DOTFILES-yellow?style=for-the-badge"></img></a>
    <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/Big-Ouden/arch-dotfiles?display_timestamp=author&style=for-the-badge">
    <p>
    My personal dotfiles managed with <a href="https://www.gnu.org/software/stow/">stow</a>
    </p>
</div>

## Screenshots

![First screen](assets/7.png)
![Second screen](assets/4.png)
![Second screen](assets/2.png)




## Mes besoins

Le projet est de créer / assembler un os qui réponde exactement à mes besoins et qui soit léger en ressources en Idle et pour des opérations basiques.

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
| Display/login manager   |   sddm | x |
| Bootmenu                |   Grub | x |
| Window manager          |   Hyprland | x |
| AUR Helper              |   Paru | x |
| shell                   |   zsh | x |
| Prompt                  |   Starship | x |
| terminal                |   kitty | x |
| Top bar                 |   waybar | x |
| Notification Daemno     |   dunst | |
| Launcher                |   ~~fuzzel~~ Rofi finalement  | |
| File manager (tui)      |   yazi | x |
| File manager (gui)      |   ~~nemo~~ dolphin | |
~~| File manager plugins    |   nemo-fileroller, nemo-terminal | |~~
| Font                    |   la font de Zel, Iosevka Nerd Font | |
| Editor                  |   Neovim - vim - Helix | |
| IDE                     |   Vscode (telemetry disabled) | x |
| Dotfile manager         |   Stow | |
| Terminal multiplexer    |   Tmux (yen a vraiment d'autres ?) | |
| Zoom                    |   hypr-zoom | x |
| Simple X11 menu         |   jgmenu | |
| Network Manager         |   Network Manager, network-manager-applet (pour waybar) | x |
| Bluetooth manager       |   blueman, blueman-applet (pour waybar) | |
| Screenshoter            |   Hyprshot | x |
| Clipboard manager       |   clipse | |
| GTK3 settings editor    |   nwg-look | |
| Monitor manager         |   nwg-displays | x |
| Wallpaper manager       |   hyprpaper | x |
| Color picker            |   hyprpicker  | x |
| Lockscreen              |   hyprlock | x |
| Discord                 |   Vesktop | x |
| Discord (web)           |   Webcord | |
| Cursor                  |   Hyprcursor | |
| Theme switcher          |   [https://github.com/Petingoso/dotfiles - dotfiles/dot_local/bin/executable_theme_changer_WL] | |
| bluelight filter + shader manager   |   hyprshade    | |
| Browser                 |   Firefox, python-pywalfox, python-pywal (firefox and auto firefox theming), librewolf | x |
| Password manager        |   bitwarden | x |
| System fetch            |   Neofetch, macchina | x |
| Pdf viewer              |   Zathura | x |
| sound and brightness    |   playerctl, light ?? | |
| Video player            |   mpv | x |
| Image viewer            |   qView, imv | |
| Calculator              |   Rofi-calc | |
| Report editor           |   Latex (devcontainers), Typst (devcontainer too ??) | |
| VPN                     |   OpenVPN, wireguard | x |

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
> Faire un script qui preload le nouveau wallpaper, set le nouveau wallpaper et unload l'ancien wallpaper => FAIT


Ajouter le fait d'executer hyprpaper au démarrage de Hyprland dans `~/.config/hypr/hyprland.conf` :
```bash
$wallpaper = hyprpaper
exec-once = $wallpaper
```

Ne pas oublier de modifier la config misc de hyprland. Sinon l'autre wallpaper de Hyprland se met en dessous de hyprpaper. En plus de le voir pendant 1 seconde au démarrage de Hyprland, dans l'idée c'est bizarre de laisser ça activé. :
```bash
misc {
    force_default_wallpaper = 1
    disable_hyprland_logo = true
}
```


#### Script

`Change_wallpaper` pour changer la config wallpaper instantanément.

TODO: script qui lance fenetre rofi qui va chercher dans le repertoire courant une image dont on ecrit le nom au clavier avec fuzzy finder, puis change le background. => fait avec rofi basique (voir si possibilité d'ajouter une preview de l'image a côté et de faire de la recherche fzf)


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


> [!NOTE]
> Il faudrait modifier le code source pour que le launcher puisse être différent de rofi (~~fuzzel par ex~~ en fait non)

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




### Bash

(voir d'abord les plugins)

#### Bash profile/Bashrc

Utilisation de oh-my-bash, "an open source, community-driven framework for managing your bash configuration" ([https://github.com/ohmybash/oh-my-bash]).


Script d'installation :
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```

Ce script remplace le .bashrc par celui donné par oh-my-bash (et fait une backup de l'ancien).
> [!IMPORTANT]
> Il faut bien vérifier que dans le `.bash_profile` le `.bashrc` soit sourcé : `[[ -f ~/.bashrc ]] && . ~/.bashrc`


### Theme

Il y a beaucoup (plus d'une centaine) de thèmes disponibles avec oh-my-bash (YOUPII le rice!!).

Liste de thèmes sympas :
- rjorgenson
- mairan
- nekonight\_moon
- rana
- modern-t


#### Aliases

Il faut aller voir la doc / le bashrc pour voir comment ça fontionne. Mais si on veut custom dans ce cas il faut aller dans `.oh-my-bash/custom/{completions,aliases,plugins,themes}/` puis les load dans le bashrc :
```bash
completions={
    custom
}
...
```
Il y a quelques alias dans general.aliases.sh mais ils ne sont pas fou donc on peut en faire en plus un custom.


### Autocomplete

#### ble.sh

"Bash Line Editor (ble.sh†1) is a command line editor written in pure Bash†2 which replaces the default GNU Readline."

Installation (devel) :
```bash
paru blesh-git
```

Il faut ensuite l'ajouter à son bashrc:
```bash
# bashrc

# Add this lines at the top of .bashrc:
[[ $- == *i* ]] && source /path/to/blesh/ble.sh --noattach

# your bashrc settings come here...

# Add this line at the end of .bashrc:
[[ ! ${BLE_VERSION-} ]] || ble-attach
```


L'autocompletion et l'auto-suggestion sont plutôt bonne. Pour l'instant je reste sur ça.


> [!NOTE]
> Il y avait la possibilité de mettre ceci dans le bashrc mais c'est pas aussi sympas que blesh.

 ```bash
 bind 'set show-all-if-ambiguous on'
 bind 'TAB:menu-complete'
 ```

> [!IMPORTANT]
> Je pense qu'il va falloir passer à zsh pour le ricing prcq bash n'as pas vraiment l'air d'être fait pour ça.

Ok ça part sur zsh prcq c'est super chiant a customiser. Par contre on garde un prompt du genre :
```txt
┌─[bigouden]@[tleta][~]
└─▪

┌─[bigouden][tleta][±][{branch git}main U:1 ✗][~/arch-dotfiles]
└─▪
```


### Zsh

ça y est c'est installé. Ya vraiment rien de plus facile :
```bash
sudo pacman -S zsh
```

Voilaaa

Tout la config est dans `~/.zshenv` pour les variables d'environement(et doit rester dans le HOME), et le reste est :
```txt
.config/zsh
├── aliases
├── ohmyzsh
├── .shell.pre-oh-my-zsh
├── .zcompdump
├── .zcompdump-tleta-5.9
├── .zcompdump-tleta-5.9.zwc
├── .zhistory
├── .zshrc
└── .zshrc.pre-oh-my-zsh
```

En suite on ajoute les `source` pour sourcer d'autres fichier (ex: aliases) et on ajoute dans `.zshrc` les plugins à jouter etc.


Plugins ajouté :
- rbw (CLI bitwarden : [https://github.com/doy/rbw])
- zsh-autosuggestion (via `$DOTFILES/zsh/custom-plugins`)
- zsh-syntax-highlighting



#### Themes

Ont mets tout les themes custom (pour que ce soit plus facile à controller) dans `$DOTFILES/zsh/custom-theme`. Themes dispo :

- Catppucin ([https://github.com/JannoTjarks/catppuccin-zsh])
Installation :
```bash
git clone https://github.com/JannoTjarks/catppuccin-zsh.git
mkdir ~/.oh-my-zsh/themes/catppuccin-flavors

ln catppuccin-zsh/catppuccin.zsh-theme ~/.oh-my-zsh/themes/
ln catppuccin-zsh/catppuccin-flavors/* ~/.oh-my-zsh/themes/catppuccin-flavors
```

Utilisation :

```bash
ZSH_THEME="catppuccin"
CATPPUCCIN_FLAVOR="mocha" # Required! Options: mocha, flappe, macchiato, latte
CATPPUCCIN_SHOW_TIME=true  # Optional! If set to true, this will add the current time to the prompt.
```

> [!TODO]
> Faire sois-même les themes de prompt

### Kitty
(attention bien regarder les ligature et emoji)

Ajout d'un theme généric qui est load dans `~/.config/kitty/kitty.conf` depuis `~/.config/kitty/theme.conf`
Les autres themes sont load la dedans (catppucin etc)

J'ai trouvé une conf un peu générique sur un github : [https://github.com/liuchengxu/dotfiles/blob/master/kitty.conf]

> [!TODO]
> Faire sois-même les themes


### Starship

[https://starship.rs/]

Starship permet de facilement faire ses prompts et les customiser super facilement. On va s'en servir pour faire des prompts personnalisé pour chaque thèmes du systèmes.


On commence par installer starship :
```bash
pacman -S starship
```


Et on l'ajoute à notre `.zshrc` :
```bash
eval "$(starship init zsh)"
```


> [!NOTE]
> Et on enlève les thèmes de oh-my-zsh.


On peut changer les thèmes dans `~/.config/starship/starship.toml` :
```bash
palette = "gruvbox_dark"
```

Les thèmes disponibles sont :
- `gruvbox_dark`
- `catppucin_mocha`
- `catppucin_frappe`
- `catppucin_latte`
- `catppucin_macchiato`


Je pense que la config est pas mal, on peut passer à autre chose :yay:



### Vim


Installer vim-plug (manager de plugin) :
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
En gros il y a plein de plugins et notemment le thème gruvbox. Il y a aussi le plugin avec le theme catppuccin. Il faut choisir avec :
```vim
colorscheme gruvbox
colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha`
```

### Neovim

Holala ça y est on rentre dans le vif du sujet !!

### Gitconfig



### Dunst

### ~~Fuzzel~~ ROFI (prcq ya un selecteur de themes)
~~(regarder a intégrer fuzzel dans scratchpad + comment lui appliquer des thèmes)~~




### Yazi (file manager)
Installation :
```bash
sudo pacman -S yazi
```

### SwayOSD

Installation :
```bash
paru swayosd-git
```

Config :
```bash
~/.config/swayosd/style.css
```


### Dolphin


### Vscode


### Cursor (script reinitialisation code premium tmtc)


### Stow


### Tmux


### Jgmenu


### Hyprshot
(mettre les hypr au meme endroit)
voir hyprshotgui et hyprshotgun (cloud)

```bash
paru hyprshot-git
```

### Hyprpicker

```bash
sudo pacman -S hyprpicker
```

### Hyprlock
```bash
paru hyprlock-git
```


### Hyprshade

### Vesktop

### Webcord

### Clispe

### Zathura (ou atril)

### mpv

### Bitwarden
(voir si on peut l'intégrer avec ~~fuzzel~~ rofi)
OUiiiiii.
Utiliser rbw-rofi



### Wireguard

Télécharger un fichier de conf d'interface et le mettre dans `/etc/wireguard`. A partir de ce moment possibilité d'activer/désactiver le vpn avec wg-quick :
```bash
sudo systemctl stop wg-quick@$INTERFACE
sudo systemctl start wg-quick@$INTERFACE
```

Script pour l'intégrer à waybar :
```bash
#!/bin/bash

INTERFACE="aicha"
SERVICE="wg-quick@$INTERFACE"

# Vérifie si le service est actif
if systemctl is-active --quiet "$SERVICE"; then
    echo "Interface $INTERFACE active, arrêt en cours..."
    sudo systemctl stop "$SERVICE"
else
    echo "Interface $INTERFACE inactive, démarrage en cours..."
    sudo systemctl start "$SERVICE"
fi
```

Module waybar :
```json
#config.jsonc
"custom/vpn": {
  "format": "{}",
  "exec": "~/.config/waybar/scripts/vpn_toggle.sh status",
  "interval": 1,
  "on-click": "~/.config/waybar/scripts/vpn_toggle.sh toggle",
  "return-type": "json",
  "escape": false
}
```

```bash
/*style*/
/* ================================ */
/*             vpn                  */
/* ================================ */
#custom-vpn {
  color: #8ec07c;
}

#custom-vpn.on {
  color: #8ec07c;
}

#custom-vpn.off {
  color: #ea6962;
}
```

### Blueman


### NetworkManager

### nwg-look

### nwg-display

Installation :
```bash
sudo pacman -S nwg-displays
```

Et pour que ça fonctionne il faut enlever/ajouter dans la configuration Hyprland :
```bash
#monitor=,preferred,auto,auto
source = ~/.config/hypr/monitors.conf
```

### Waybar

Installation :
```bash
paru waybar-cava
```



### Hyprland

#### Monitor

#### Exec-once (startup)

#### Environment variables

#### Permissions

#### Look and feel (setup)

#### Inputs


#### Keybindings


#### Rules

### Theming




> [!NOTE]
> Fait marrant, le message qui s'affiche en bas par défaut sur hyprland sont ici : `/usr/include/hyprland/src/helpers/Splashes.hpp`. Et il est possible de désactiver son affichage au démarrage (exec-once) avec l'option :

| variable | description	| type | default|
|:--:|:--:|:--:|:--:|
| splash	| enable rendering of the hyprland splash over the wallpaper |bool | false |

### Zoxide
```bash
sudo pacman zoxide
zoxide init zsh --cmd cd >> .config/zsh/.zshrc
```

Remplace la commande "cd"

# Paquet supplémentaires

- less
- tree
- unzip
- fzf
- npm
- tldr
- lazygit
- fd
- zoxide

# Configurations dont je me suis inspiré

