{
  config,
  pkgs,
  apple-fonts,
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
    grim
    slurp
    swappy

    # dev stuff
    eza
    tmuxifier
    herdr

    # hyprland/wayland stuff
    rofi

    # apps
    blueman
    mako
    libnotify
    kdePackages.dolphin
    kdePackages.breeze-icons

    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    nerd-fonts.noto
    # _0xproto
    font-awesome
    material-design-icons
    dejavu_fonts
    liberation_ttf
    apple-fonts.packages.${pkgs.stdenv.hostPlatform.system}.sf-mono
  ];
}
