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
    ./modules/hyprland.nix
    ./modules/hyprpaper.nix
    ./modules/mpv.nix
    ./modules/packages.nix
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

  programs.home-manager.enable = true;
}
