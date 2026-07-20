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
    grim
    slurp
    swappy

    # dev stuff
    eza
    tmuxifier
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
    monocraft
    _0xproto
    font-awesome
    material-design-icons
    dejavu_fonts
    liberation_ttf
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
