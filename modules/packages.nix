{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # cli tools
    bc
    jq
    playerctl
    lazygit
    less
    yarn

    # dev stuff
    eza
    tmuxifier
    # hyprland/wayland stuff
    rofi

    # apps
    blueman
    kdePackages.dolphin
    kdePackages.breeze-icons

    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    nerd-fonts.noto
    font-awesome
    material-design-icons
    dejavu_fonts
    liberation_ttf
  ];
}
