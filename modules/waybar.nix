{
  config,
  theme,
  ...
}: let
  scripts = "${config.xdg.configHome}/waybar/scripts";
  themeCfg = import ./waybar/themes/${theme}.nix {inherit scripts;};
in {
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    settings = themeCfg.settings;
    style = themeCfg.style;
  };

  xdg.configFile."waybar/style.css".force = true;
  xdg.configFile."waybar/config".force = true;

  xdg.configFile."waybar/scripts" = {
    source = ./waybar/scripts;
    recursive = true;
    force = true;
  };
}
