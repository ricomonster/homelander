{ config, pkgs, apple-fonts, ... }: {
  home.username = "ricomonster";
  home.homeDirectory = "/home/ricomonster";

  imports = [
    ./modules/hyprland.nix 
    ./modules/hyprpaper.nix
    ./modules/mako.nix 
    ./modules/mangohud.nix
    ./modules/mpv.nix 
    ./modules/pipewire.nix
    ./modules/rofi.nix 
    ./modules/waybar.nix
  ];

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland pkgs.xdg-desktop-portal-gtk ];
  };

  gtk = {
    enable = true;
    theme = { name = "adw-gtk3-dark"; package = pkgs.adw-gtk3; };
    gtk4.theme = config.gtk.theme;
  };
  dconf.settings."org/gnome/desktop/interface"."color-scheme" = "prefer-dark";

  programs.ghostty.systemd.enable = false;

  home.packages = with pkgs; [
    playerctl 
    grim 
    slurp 
    swappy 
    rofi 
    blueman 
    mako 
    libnotify
    kdePackages.dolphin 
    kdePackages.breeze-icons
    nerd-fonts.jetbrains-mono 
    nerd-fonts.noto
  ] ++ [
      apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-mono
    ];
}
