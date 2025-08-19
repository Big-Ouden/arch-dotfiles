<div align="center">
    <img src="assets/banner.webp"></img> </br>
    <img alt="GitHub License" src="https://shieldsio.bigouden.org/github/license/Big-Ouden/arch-dotfiles?style=for-the-badge">
    <img alt="GitHub repo size" src="https://shieldsio.bigouden.org/github/repo-size/Big-Ouden/arch-dotfiles?style=for-the-badge"></img>
    <a href="https://belier.iiens.net"><img alt="Personal blog link" src="https://shieldsio.bigouden.org/badge/BLOG-HOW%20I%20MANAGE%20MY%20DOTFILES-yellow?style=for-the-badge"></img></a>
    <img alt="GitHub last commit" src="https://shieldsio.bigouden.org/github/last-commit/Big-Ouden/arch-dotfiles?display_timestamp=author&style=for-the-badge">
    <p>
    My personal dotfiles managed with <a href="https://www.gnu.org/software/stow/">stow</a>
    </p>
</div>

---

<details>
<summary><strong>Detailed Table of Contents</strong></summary>

- [Screenshots](#screenshots)
- [Goals](#goals)
  - [Resources](#resources)
  - [User Interface (UI)](#user-interface-ui)
  - [User Experience (UX)](#user-experience-ux)
- [Technical Choices](#technical-choices)
- [Installed Applications](#installed-applications)
- [Setup and Installation](#setup-and-installation)
- [Customization](#customization)
  - [GRUB (bootloader)](#grub-bootloader)
  - [SDDM (login manager)](#sddm-login-manager)
  - [Hyprpaper (wallpaper manager)](#hyprpaper-wallpaper-manager)
  - [Paru (AUR helper)](#paru-aur-helper)
  - [Scratchpad (temporary windows)](#scratchpad-temporary-windows)
  - [Hyprzoom](#hyprzoom)
  - [Zsh / Bash / Starship / Kitty](#zsh--bash--starship--kitty)
  - [Vim (Secondary configuration)](#vim-secondary-configuration)
  - [Neovim](#neovim)
    - [Plugin manager](#plugin-manager)
    - [Installed plugins](#installed-plugins)
    - [LSP and autocompletion](#lsp-and-autocompletion)
    - [Essential keybinds](#essential-keybinds)
    - [Themes](#themes)
    - [Configuration structure](#configuration-structure)
  - [Wireguard (VPN)](#wireguard-vpn)
  - [nwg-look / nwg-displays](#nwg-look--nwg-displays)
  - [Zoxide (cd alternative)](#zoxide-cd-alternative)
  - [Kitty (Terminal)](#kitty-terminal)
  - [Waybar – Used modules](#waybar--used-modules)
  - [Hypr* Tools](#hypr-tools)
  - [vpn_toggle.sh with NetworkManager](#vpn_togglesh-with-networkmanager)
  - [Dunst](#dunst)
  - [Rofi](#rofi)
  - [Hyprshot](#hyprshot)
  - [Tmux](#tmux)
  - [Stow](#stow)
  - [Jgmenu](#jgmenu)
  - [SwayOSD](#swayosd)
  - [Other tools](#other-tools)
- [Custom Scripts](#custom-scripts)
  - [Introduction](#introduction)
  - [Available scripts and usage](#available-scripts-and-usage)
  - [Usage examples](#usage-examples)
- [Useful Links](#useful-links)

</details>

---

## Screenshots

![screenshot](assets/7.png)
![screenshot](assets/4.png)
![screenshot](assets/2.png)

---

## Goals

Create a lightweight, customized OS optimized for daily use and development, with strong attention to visual consistency and smooth user experience.

### Resources

* Optimized battery, RAM, CPU, GPU usage
* Minimal resource consumption
* Arch chosen for its flexibility despite slightly higher complexity

### User Interface (UI)

Consistent themes across the system and apps:

* Dark / light
* Catppuccin
* Gruvbox
* Tokyo Night

Full support in shell, terminal, file manager, etc.

### User Experience (UX)

* Graphical management for network, VPN, displays, wallpapers
* Tiling WM with automatic floating fallback for GUI apps
* Floating windows by default to prevent rendering bugs

---

## Technical Choices

* **Distro**: Arch Linux
* **Window Manager**: Hyprland (Wayland)
* **Login Manager**: SDDM (custom astronaut theme)
* **Bootloader**: GRUB + custom theme
* **Shell**: Zsh with Oh-My-Zsh and Starship
* **Package Management**: pacman, paru (AUR helper)
* **Development isolation**: devcontainers, distrobox
* **Dotfile management**: Stow

---

## Installed Applications

| Category           | Application                                             |
| ------------------ | ------------------------------------------------------- |
| Kernel             | Linux / Linux-Zen (VirtualBox)                          |
| Terminal           | Kitty, Starship, Tmux                                   |
| Shell              | Zsh, zsh-autosuggestions, zsh-syntax-highlighting, ble.sh |
| File manager (TUI) | Yazi                                                    |
| File manager (GUI) | Dolphin                                                 |
| Editor             | Neovim, Vim, Helix                                      |
| IDE                | Vscode (telemetry disabled)                             |
| Menu               | Rofi (replacing Fuzzel), Jgmenu                         |
| Notifications      | Dunst                                                   |
| Bar                | Waybar + custom modules (VPN, updates, RAM)             |
| Screenshots        | Hyprshot, hyprshotgun, hyprshotgui                      |
| Wallpaper          | Hyprpaper, `change_wallpaper`, `wallpaper_menu`         |
| Color picker       | Hyprpicker                                              |
| Cursor             | Hyprcursor, reset script included                       |
| VPN                | Wireguard, OpenVPN + Waybar integration                 |
| Network            | NetworkManager, network-manager-applet, Blueman         |
| Display            | nwg-displays                                            |
| GTK theme          | nwg-look                                                |
| Audio              | MPV, Playerctl, lofi (script)                           |
| Clipboard          | Clispe                                                  |
| Theme              | Catppuccin, Gruvbox, TokyoNight                         |
| Browser            | Firefox + PywalFox, LibreWolf, WebCord                  |
| PDF                | Zathura                                                 |
| Password manager   | Bitwarden (via `rbw-rofi`)                              |
| System info        | Neofetch, macchina                                      |
| Zoom WM            | Hypr-zoom                                               |
| Shader             | Hyprshade                                               |
| Calculator         | rofi-calc                                               |
| Report editor      | Latex (devcontainer), Typst (TODO)                      |
| Markdown preview   | Neovim plugin                                           |
| Others             | Vesktop, Syncthing, Obsidian, Zed                       |

---


## Tool Configuration

### Setup and Installation

Arch Linux installed following the official wiki using the `archinstall` utility. Post-install steps (partitioning, user creation, network, filesystem, etc.) were executed immediately afterwards.

### Customization

#### GRUB (Bootloader)

A graphical theme is installed for GRUB. The theme is placed in `/usr/share/grub/themes/` and referenced in `/etc/default/grub`:

```bash
GRUB_THEME="/usr/share/grub/themes/theme-name/theme.txt"
```

> 💡 A future script will allow dynamic theme switching.

> ⚠️ Remember to regenerate GRUB after changes:
>
> ```bash
> sudo grub-mkconfig -o /boot/grub/grub.cfg
> ```

#### SDDM (Login Manager)

Used for graphical login, customized with the `sddm-astronaut-theme` (dynamic and static).

* Required packages: `sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg`
* Copy theme files to `/usr/share/sddm/themes`
* Add required fonts in `/usr/share/fonts`

Configure `/etc/sddm.conf`:

```ini
[Theme]
Current=sddm-astronaut-theme

[General]
InputMethod=qtvirtualkeyboard
```

Change background via `metadata.desktop`:

```ini
ConfigFile=Themes/theme-to-use.conf
```


#### Paru (AUR Helper)

Installation:

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

Examples:

* `paru` — full system update
* `paru -Sua` — update only AUR packages

#### Scratchpad (Temporary Windows)

Using `scratchpad` from [Hyprland contrib](https://github.com/hyprwm/contrib)

* Dependencies: `jq`, `rofi`
* Keybindings in `hyprland.conf`:

```ini
bind = $mainMod, code:20, exec, scratchpad
bind = $mainMod SHIFT, code:20, exec, scratchpad -g
```



#### Vim (Secondary Configuration)

Plugin manager: vim-plug

Usage:

```vim
call plug#begin('~/.vim/plugged')
```

Themes:

* gruvbox
* catppuccin

```vim
colorscheme gruvbox
" or
colorscheme catppuccin
```

Config files:

* `.vimrc`
* `plugins.vim`, `plugin-config.vim`
* `autoload/plug.vim` (auto-installed)

Vim serves as a fallback or lightweight editor with a simpler config than Neovim.

#### Neovim

Configured as a full-featured, modular, and aesthetic IDE using `lazy.nvim` for dynamic plugin management. Entire config written in Lua, following a clear modular architecture. All files located in `~/.config/nvim/`.

##### Plugin Manager

* `lazy.nvim`: modern async plugin manager with lazy-loading support.
* Plugins declared in `lua/plugins/`, each in its own file.

##### Installed Plugins

| Enabled | Plugin                   | Main Functionality                                |
| :-----: | ------------------------ | ------------------------------------------------- |
|    x    | `autocompletion.lua`     | Context-aware completion via nvim-cmp and sources |
|    x    | `gitsigns.lua`           | Git signs in the gutter                           |
|    x    | `java.lua`               | Java-specific LSP config                          |
|    x    | `mini.lua`               | Minimal Lua UI modules                            |
|    x    | `persistence.lua`        | Session save/restore                              |
|    x    | `todo-comments.lua`      | Highlight/manage TODO, FIXME, NOTE                |
|    x    | `wakatime.lua`           | Development time tracking                         |
|    x    | `autoformat.lua`         | Auto-format on save per language                  |
|    x    | `harpoon.lua`            | Quick file/buffer navigation                      |
|         | `latex.lua`              | LaTeX support (disabled)                          |
|         | `mkdir.lua`              | Auto-create directories on save (disabled)        |
|    x    | `pineapple.lua`          | Pineapple theme integration                       |
|    x    | `toggleterm.lua`         | Floating terminal integration                     |
|         | `barbar.lua`             | Buffer tabs (disabled)                            |
|    x    | `hlsearch.lua`           | Enhanced search highlighting                      |
|    x    | `lazygit.lua`            | LazyGit terminal integration                      |
|         | `neaterm.lua`            | Alternative floating terminal (disabled)          |
|         | `pineapple-theme.lua`    | Pineapple theme complement (disabled)             |
|    x    | `treesitter.lua`         | Advanced syntax highlighting                      |
|         | `colorscheme.lua`        | Centralized color management                      |
|    x    | `indent-blankline.lua`   | Visual indentation guides                         |
|    x    | `lsp.lua`                | LSP server configuration                          |
|    x    | `neo-tree.lua`           | Modern file explorer                              |
|    x    | `presence.lua`           | Discord Rich Presence integration                 |
|    x    | `typst-preview.lua`      | Live Typst file preview                           |
|    x    | `dashboard.lua`          | Startup dashboard                                 |
|    x    | `indent-o-matic.lua`     | Automatic indentation detection                   |
|    x    | `lualine.lua`            | Custom status line                                |
|    x    | `noice.lua`              | Enhanced UI for messages, commands, LSP           |
|         | `scrollbar.lua`          | Visible scrollbar (disabled)                      |
|    x    | `url-open.lua`           | Open URLs directly from Neovim                    |
|    x    | `fuzzy-finder.lua`       | Telescope fuzzy finder setup                      |
|    x    | `init.lua`               | Central plugin loader                             |
|    x    | `markdown-preview.lua`   | Live Markdown preview                             |
|    x    | `nvim-dev-container.lua` | DevContainer (Docker) support                     |
|         | `smear-cursor.lua`       | Cursor animation (disabled)                       |
|    x    | `url-view.lua`           | Lists buffer URLs and opens them in browser       |
|    x    | `which-key.lua`          | Displays available keybindings                    |

##### LSP and Autocompletion

LSP managed with `mason` and configured via `lspconfig`. Autocompletion handled by `nvim-cmp` with sources:

* LSP (`cmp-nvim-lsp`)
* Snippets (`luasnip`)
* Buffers, paths, command line

##### Essential Keybindings

| Shortcut     | Function                            |
| ------------ | ----------------------------------- |
| `<leader>ff` | File search with Telescope          |
| `<leader>lg` | Global text search (ripgrep)        |
| `<leader>fb` | List open buffers                   |
| `<leader>fr` | Recent files                        |
| `<leader>rn` | Rename symbol (LSP)                 |
| `<leader>ca` | Code action (LSP)                   |
| `<leader>e`  | Open diagnostics window             |
| `gd` / `gr`  | Go to definition / references (LSP) |
| `<leader>tt` | Open integrated terminal            |
| `<leader>q`  | Close current buffer                |
| `<leader>qq` | Quit Neovim                         |

##### Themes

Themes used:

* `catppuccin` (mocha, frappe, latte, macchiato variants)
* `gruvbox`

Active theme defined in `colorscheme.lua` or `theme.lua` and synchronized with terminal (Kitty), shell (Zsh + Starship), and Waybar for a unified look.

##### Configuration Structure

| File or Folder           | Role                             |
| ------------------------ | -------------------------------- |
| `init.lua`               | Main entry point                 |
| `lua/options.lua`        | Base options configuration       |
| `lua/mappings.lua`       | Global keybindings definition    |
| `lua/autocommands.lua`   | Custom autocommands              |
| `lua/plugins/`           | Individual plugin configurations |
| `after/plugin/theme.lua` | Apply active theme               |
| `lazy-lock.json`         | Plugin lock file                 |

#### WireGuard (VPN)

* Config located at `/etc/wireguard/wg0.conf`
* Toggle script using `nmcli` integrated with Waybar: `vpn_toggle.sh`
  (see [vpn\_toggle.sh with NetworkManager](#vpn_toggle.sh-with-networkmanager))

Waybar JSON module:

```json
"custom/vpn": {
  "format": "{}",
  "exec": "~/.config/waybar/scripts/vpn_toggle.sh status",
  "on-click": "~/.config/waybar/scripts/vpn_toggle.sh toggle"
}
```

CSS styling:

```css
#custom-vpn.on { color: #8ec07c; }
#custom-vpn.off { color: #ea6962; }
```

#### nwg-look / nwg-displays

* `nwg-displays`: multi-monitor management (with `monitors.conf` in Hypr)
* `nwg-look`: GTK theme customization

#### Zoxide (Alternative to `cd`)

```bash
sudo pacman -S zoxide
zoxide init zsh --cmd cd >> ~/.config/zsh/.zshrc
```

#### Kitty (Terminal)

Kitty is configured to support ligatures, emojis, and dynamic theme loading. Config files reside in `~/.config/kitty/`:

* `kitty.conf` includes `theme.conf`
* `theme.conf` loads the current theme (Catppuccin, Gruvbox, etc.)

**Example:**

```conf
include theme.conf
font_family FiraCode Nerd Font
```

#### Waybar – Modules Used

Waybar is configured with a mix of standard and custom modules:

| Module           | Type     | Description                                                                        |
| ---------------- | -------- | ---------------------------------------------------------------------------------- |
| `custom/vpn`     | Custom   | Shows VPN status (green=active, red=inactive) and toggles VPN via `vpn_toggle.sh`. |
| `custom/updates` | Custom   | Checks system updates (pacman + AUR) using `pacman-updates`.                       |
| `custom/ram`     | Custom   | Displays RAM usage via `memory_usage`.                                             |
| `battery`        | Standard | Battery level with dynamic icon.                                                   |
| `clock`          | Standard | Date and time with custom format.                                                  |
| `pulseaudio`     | Standard | Audio volume and mute toggle.                                                      |
| `network`        | Standard | Network connection status and type (WiFi/Ethernet).                                |
| `tray`           | Standard | System tray icons.                                                                 |

Each module styled in `style_fill.css` and `style_round.css`, with appearance toggle via `switch_waybar`.

#### Hypr\* Tools

Specific tools designed for Hyprland:

* **Hyprpaper**: lightweight Wayland-native wallpaper manager
* **Hyprzoom**: smooth zoom effect (bind SUPER+=)
* **Hyprshot / hyprshotgun / hyprshotgui**: screenshot utilities
* **Hyprcursor**: cursor customization
* **Hyprshade**: apply shader/filter overlay
* **Hyprlock**: aesthetic lightweight screen locker


##### Hyprpaper (Wallpaper Manager)

Installation:

```bash
sudo pacman -S hyprpaper
```

Config `~/.config/hypr/hyprpaper.conf`:

```ini
preload = ~/wallpapers/image1.png
wallpaper = eDP-1,~/wallpapers/image1.png
splash = true
```

Launch on startup in `hyprland.conf`:

```ini
exec-once = hyprpaper
```

Disable Hyprland’s default wallpaper:

```ini
misc {
  force_default_wallpaper = 1
  disable_hyprland_logo = true
}
```

Associated scripts: `change_wallpaper`, `wallpaper_menu` (rofi-based)

##### Hyprzoom

Smooth screen zoom:

```bash
paru hypr-zoom
```

Keybindings:

```ini
bind = $mainMod, code:21, exec, hypr-zoom -easing=InOutExpo -duration=100 -steps=50 -target=2
bind = $mainMod SHIFT, mouse:272, exec, hypr-zoom -easing=InOutExpo -duration=100 -steps=50 -target=2
```


##### Hyprshade

Installation:
```bash
paru -S hyprshade
```

Config file `~/.config/hyprshade/config.toml` :
```toml
[[shades]]
name = "vibrance"
default = true


[[shades]]
name = "blue-light-filter"
start_time = 19:00:00
end_time = 06:00:00
```

Each time config is edited, do not forget to install systemd service :

```bash
hyprshade install
systemctl --user enable --now hyprshade.timer
```



##### Zsh / Bash / Starship / Kitty

> Detailed documentation included in `.zshrc`, `.bashrc`, `starship.toml`, `kitty.conf`.

* Bash → `oh-my-bash`, `ble.sh`, custom aliases in `.oh-my-bash/custom`
* Zsh → `oh-my-zsh`, plugins (rbw, zsh-autosuggestions, syntax-highlighting), `catppuccin` theme
* Starship → Multi-theme prompt (Gruvbox, Catppuccin)
* Kitty → Ligatures, emojis, dynamic theme loading from `theme.conf`





#### vpn\_toggle.sh with NetworkManager

The `vpn_toggle.sh` script was modified to use `nmcli` instead of `wg-quick`, making VPN toggling compatible with VPN connections managed by NetworkManager (`nm-connection-editor`).

**Excerpt:**

```bash
if nmcli con show --active | grep -q "$VPN_NAME"; then
    nmcli con down id "$VPN_NAME"
else
    nmcli con up id "$VPN_NAME"
fi
```

This enables easy VPN toggling directly from Waybar while benefiting from desktop environment integration.

#### Dunst

Dunst is the notification daemon used here. Lightweight and Wayland-compatible, configured in `~/.config/dunst/dunstrc`.

* Color, size, position, and transparency customization
* Visual notifications integrated with overall aesthetic (Catppuccin / Gruvbox)
* Can be coupled with keybindings or Waybar

#### Rofi

Replaces Fuzzel as an application launcher and system menu (power menu, wallpaper, keybinds).

* Themed to match the overall look
* Scripts like `wallpaper_menu`, `power_menu`, `scratchpad -g` all use Rofi

#### Hyprshot

Modern screenshot tool for Wayland.

* `hyprshot`: CLI
* `hyprshotgui`: GUI
* `hyprshotgun`: shotgun-style CLI

Available from AUR:

```bash
paru hyprshot-git
```

#### Tmux

Terminal multiplexer with lightweight config. Supports:

* Detachable sessions
* Horizontal/vertical splits
* Persistent project management

#### Stow

GNU Stow is used for modular dotfiles management.

* All config files stored in `config/`
* `stow.sh` script automates (un)linking per app
* `.stow-local-ignore` to exclude folders (e.g., `.git`, `LICENSE`, `assets`)

#### Jgmenu

Minimalist alternative to Rofi. Rarely used here but installed for experimentation or fallback.

#### SwayOSD

Visual element management (volume, brightness, etc.) under Wayland.

Installed from AUR:

```bash
paru swayosd-git
```

#### Other Tools

* **Clispe**: CLI clipboard manager
* **Zathura**: minimalist PDF reader
* **MPV**: media player used by `lofi` script
* **Bitwarden (rbw-rofi)**: Bitwarden CLI + Rofi integration
* **Dolphin**: graphical file manager
* **LazyGit**: fast terminal Git interface

---

### Custom Scripts

#### Introduction

Custom scripts are located in `~/.config/custom_scripts` and each has a generated man page (man1) updated with `update_man`.

#### Available Scripts and Usage

| Script                           | Description                                                     |
| -------------------------------- | --------------------------------------------------------------- |
| `ascii`                          | Displays an ASCII table                                         |
| `change_wallpaper`               | Immediately changes the wallpaper                               |
| `wallpaper_menu`                 | Rofi menu to select a wallpaper                                 |
| `power_menu`                     | Rofi menu for shutdown/reboot/logout                            |
| `init_rapport.sh`                | Git cloning utility with sparse-checkout                        |
| `lofi`                           | Plays `lofi.wav` background music with MPV                      |
| `runbg`                          | Runs a command in background and logs output                    |
| `toggle_float`                   | Toggles between floating and tiled window in Hyprland           |
| `toggle_opacity`                 | Toggles active/faded window opacity                             |
| `toggle_waybar`                  | Starts/stops Waybar dynamically                                 |
| `update_man`                     | Updates man pages of custom scripts                             |
| `memory_usage`, `pacman-updates` | Scripts integrated into Waybar for RAM usage and system updates |
| `vpn_toggle.sh`                  | Manages VPN status via `nmcli` (see above)                      |
| `start_hyprpaper`                | Starts Hyprpaper conditionally based on config                  |

#### Usage Examples

* `change_wallpaper image.png` → instantly applies the image
* `wallpaper_menu` → fuzzy select via Rofi (preview optional)
* `lofi` → toggle ambient music on/off
* `power_menu` → system menu with shortcuts (shutdown, logout, reboot)

> ℹ️ These scripts are designed to be simple, modular, and extensible.

**Excerpt from vpn\_toggle.sh:**

```bash
if nmcli con show --active | grep -q "$VPN_NAME"; then
    nmcli con down id "$VPN_NAME"
else
    nmcli con up id "$VPN_NAME"
fi
```

Allows easy VPN toggling from Waybar with desktop integration.

---

<details>
<summary><strong>Useful Links</strong></summary>

### Configurations & Themes Management

* [GNU Stow](https://www.gnu.org/software/stow/) – Modular dotfiles management
* [Starship](https://starship.rs/) – Minimal and fast shell prompt
* [Catppuccin](https://github.com/catppuccin) – Pastel themes for terminals, editors, and apps
* [Gruvbox](https://github.com/morhetz/gruvbox) – Classic dark theme

### Graphical Environment & Utilities

* [Hyprland](https://github.com/hyprwm/Hyprland) – Wayland compositing window manager
* [Hyprpaper](https://github.com/hyprwm/hyprpaper) – Wayland wallpaper manager
* [Hyprzoom](https://github.com/hyprwm/contrib) – Smooth zoom for Hyprland
* [Hyprlock](https://github.com/hyprwm/hyprlock) – Lock screen for Hyprland
* [Waybar](https://github.com/Alexays/Waybar) – Customizable Wayland status bar
* \[SwayOSD]\([https://github.com/](https://github.com/)

---

> Contact: BigOuden - [bigouden.org](https://bigouden.org) - contact@bigouden.org

---

**License:** GNU GPLv3

