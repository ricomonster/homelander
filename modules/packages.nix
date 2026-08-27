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
    # apple-fonts.packages.${pkgs.system}.sf-mono
  ];

  xdg.desktopEntries.postman = {
    name = "Postman";
    comment = "Build, test, and document your APIs faster";
    exec = "/opt/postman/Postman --enable-features=UseOzonePlatform --ozone-platform=wayland %U";
    icon = "postman";
    categories = ["Development" "Utility"];
    type = "Application";
    startupNotify = true;
    settings = {
      StartupWMClass = "postman";
      MimeType = "x-scheme-handler/postman";
      Path = "/opt/postman";
    };
  };
}
