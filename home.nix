{
  config,
  pkgs,
  ...
}: {
  home.username = "ricomonster";
  home.homeDirectory = "/home/ricomonster";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    LC_NUMERIC = "en_US.UTF-8";
  };

  imports = [
    ./modules/btop.nix
    ./modules/fastfetch.nix
    ./modules/ghostty.nix
    ./modules/git.nix
    ./modules/herdr.nix
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/mako.nix
    ./modules/mangohud.nix
    ./modules/mpv.nix
    ./modules/packages.nix
    ./modules/pipewire.nix
    ./modules/rofi.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/waybar.nix
    ./modules/zsh.nix
  ];

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    gtk4.theme = config.gtk.theme;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      "color-scheme" = "prefer-dark";
    };
  };

  programs.home-manager.enable = true;
}
