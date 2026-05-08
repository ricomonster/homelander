{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bc
    # dev stuff
    eza
    fastfetch
    starship
    tmuxifier
    # hyprland/wayland stuff
    rofi
    # apps
    qbittorrent

    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    nerd-fonts.noto
    font-awesome
    material-design-icons
  ];
}
