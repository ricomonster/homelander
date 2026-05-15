{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    package = null;
  };

  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
    force = true;
  };
}
