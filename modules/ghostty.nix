{
  config,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    package = null; # managed by pacman

    systemd.enable = false;

    enableZshIntegration = true;

    settings = {
      # Font
      font-family = "JetBrains Mono";
      font-style = "SemiBold";
      font-size = 9;
      font-thicken = true;
      font-feature = ["calt=0" "zero"];
      adjust-cell-height = "15%";

      # Cursor
      cursor-style = "underline";
      shell-integration-features = "no-cursor";
      cursor-color = "#c0caf5";

      # Window
      window-padding-x = 6;
      window-padding-y = 6;
      window-decoration = "auto";
      background-opacity = 0.98;

      # Terminal
      term = "xterm-256color";

      # Tokyo Night colors
      background = "#1a1b26";
      foreground = "#c0caf5";
      selection-background = "#283457";
      selection-foreground = "#c0caf5";

      palette = [
        "0=#15161e"
        "1=#f7768e"
        "2=#9ece6a"
        "3=#e0af68"
        "4=#7aa2f7"
        "5=#bb9af7"
        "6=#7dcfff"
        "7=#a9b1d6"
        "8=#414868"
        "9=#ff899d"
        "10=#9fe044"
        "11=#faba4a"
        "12=#8db0ff"
        "13=#c7a9ff"
        "14=#a4daff"
        "15=#c0caf5"
      ];
    };
  };
}
