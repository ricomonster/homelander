# homelander
Personal Home Manager configuration for Arch Linux + Hyprland.

## Overview

Dotfiles managed declaratively with [Nix Home Manager](https://github.com/nix-community/home-manager).
The setup follows a clear split:

- **pacman/yay** — system-level packages (kernel, drivers, compositor, daemons)
- **home-manager** — user-level packages, dotfiles, and configuration

## System

| Component | Package |
|---|---|
| OS | Arch Linux (UEFI, ext4) |
| GPU | NVIDIA (nvidia-open driver, DRM KMS enabled) |
| Compositor | Hyprland (Wayland) |
| Display Manager | greetd + tuigreet |
| Audio | PipeWire + WirePlumber |
| Shell | Zsh |
| Terminal | Ghostty |
| Bar | Waybar |
| Launcher | Rofi (Wayland) |
| Multiplexer | Tmux + Tmuxifier |
| Editor | Neovim |
| Fonts | JetBrainsMono Nerd Font, Noto Fonts, Font Awesome |

## Structure

```
~/.config/home-manager/
├── flake.nix                  # entry point, inputs and outputs
├── home.nix                   # imports all modules
├── modules/
│   ├── packages.nix           # home.packages
│   ├── zsh.nix                # zsh, autosuggestions, aliases
│   ├── starship.nix           # starship prompt
│   ├── tmux.nix               # tmux + tokyo night theme + plugins
│   ├── git.nix                # git config, multi-account via includeIf
│   ├── ghostty.nix            # ghostty terminal config
│   ├── fastfetch.nix          # fastfetch system info
│   ├── hyprland.nix           # hyprland compositor config
│   ├── waybar.nix             # waybar config + styles
│   ├── rofi.nix               # rofi launcher + themes
│   ├── mpv.nix                # mpv config
│   └── spicetify.nix          # spicetify + spotify theming
├── scripts/
│   ├── cpu.sh                 # waybar cpu module
│   ├── memory.sh              # waybar memory module
│   ├── vpn.sh                 # waybar vpn status
│   └── vpn-toggle.sh          # waybar vpn toggle on-click
├── wallpapers/                # wallpapers managed by home-manager
├── rofi/                      # rofi theme files
│   └── themes/
├── btop/                      # btop tokyo night theme
│   └── tokyo-night.theme
└── tmuxifier-layouts/         # tmuxifier session layouts
```

## Package Management Split

### pacman (system-level)

| Package | Reason |
|---|---|
| `hyprland` | compositor, needs system access |
| `greetd` `greetd-tuigreet` | display manager, runs before login |
| `pipewire` `wireplumber` | audio stack, systemd services |
| `xdg-desktop-portal-hyprland` | system portal |
| `nvidia-open` `nvidia-utils` | GPU drivers |
| `ghostty` | terminal, Mesa/GL path issues with Nix |
| `mpv` | media player, Mesa/GL path issues with Nix |
| `hyprpaper` | wallpaper daemon, Mesa/GL path issues with Nix |
| `btop` | system monitor |
| `steam` | gaming, needs lib32 |
| `gamemode` `mangohud` | gaming utilities |
| `keyd` | keyboard remapper, kernel-level |
| `nordvpn` | VPN daemon |
| `swayosd` | volume/brightness OSD |

### home-manager (user-level)

Everything else — CLI tools, fonts, user apps, and configs.

## Requirements

- [Arch Linux](https://archlinux.org)
- [Nix](https://nixos.org/download/) (standalone, not via pacman)
- [Home Manager](https://github.com/nix-community/home-manager) (flakes)

## Installation

### 1. Install Nix

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Restart terminal, then enable flakes:

```bash
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```

### 2. Install Home Manager

```bash
nix run home-manager/master -- init --switch
```

### 3. Clone this repo

```bash
git clone https://github.com/yourusername/dotfiles ~/.config/home-manager
```

### 4. Apply

```bash
cd ~/.config/home-manager
home-manager switch --flake ~/.config/home-manager#ricomonster
```

## Usage

| Task | Command |
|---|---|
| Apply changes | `home-manager switch --flake ~/.config/home-manager#ricomonster` |
| Preview changes | `home-manager build --flake ~/.config/home-manager#ricomonster` |
| Roll back | `home-manager switch --switch-generation N` |
| List generations | `home-manager generations` |
| Search for a package | `nix search nixpkgs <name>` |
| Update flake inputs | `nix flake update` |

## Modules

### hyprland

Managed via `wayland.windowManager.hyprland` with `package = null` (uses system Hyprland from pacman).
Dual monitor setup (DP-1 portrait, DP-2 landscape), NVIDIA env vars, animations, dwindle layout,
vim-style focus navigation, workspace keybinds, screenshot via grim/slurp.

### waybar

Managed via `programs.waybar`. Dual bar setup — one per monitor via `output` field.
Custom modules: CPU usage with ASCII bar, memory usage with ASCII bar, VPN status.
Tokyo Night color scheme. Scripts managed via `xdg.configFile`.

### rofi

Config managed via `xdg.configFile`. Wayland native (`rofi-wayland`).
Combi mode with window/run/calc modi. rofi-calc for calculator.

### tmux

Managed via `programs.tmux`. Vim keybindings, mouse support, Tokyo Night theme,
vim-tmux-navigator, tmuxifier layouts. Base index starts at 1.

### zsh

Managed via `programs.zsh`. Includes zsh-autosuggestions, aliases (`ll`, `ls`, `la` via eza),
NVM (manual install), tmuxifier init, fastfetch on shell start, `.secrets` sourced if present.

### git

Managed via `programs.git`. Multiple accounts via `includeIf` — personal default,
work identity loads for repos inside `~/work/`.

### ghostty

Managed via `programs.ghostty` with `package = null` (installed via pacman).
Tokyo Night color scheme, JetBrains Mono font.

### mpv

Config managed via `xdg.configFile` (mpv installed via pacman due to Mesa path issues).
NVIDIA hardware decoding (`hwdec=auto`), gpu-next renderer, JetBrains Mono subtitles.

### spicetify

Managed via `spicetify-nix` flake. Spotify patched automatically on `home-manager switch`.
`nixpkgs.config.allowUnfree = true` required.

### fastfetch

Managed via `programs.fastfetch`. Shows host, OS, kernel, WM, packages, uptime,
terminal, shell, editor, CPU, GPU, memory, disk, and network info.

## NVIDIA Notes

- Driver: `nvidia-open` (Turing/RTX 20-series and newer)
- DRM KMS enabled via bootloader: `nvidia_drm.modeset=1`
- Early KMS modules in mkinitcpio: `nvidia nvidia_modeset nvidia_uvm nvidia_drm`
- Pacman hook to rebuild initramfs on driver updates
- Wayland env vars set in Hyprland config

## Secrets

Sensitive environment variables go in `~/.secrets`, sourced by zsh but never committed:

```bash
# ~/.secrets
export GITHUB_TOKEN="..."
export ANTHROPIC_API_KEY="..."
```

Add to gitignore:

```bash
echo ".secrets" >> ~/.config/home-manager/.gitignore
```

## Adding a new module

1. Create `modules/myapp.nix`
2. Add to `imports` list in `home.nix`
3. Run `home-manager switch --flake ~/.config/home-manager#ricomonster`
