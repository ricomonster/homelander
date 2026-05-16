{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = null;
    configType = "lua";
  };

  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
    force = true;
  };
}
