{
  config,
  pkgs,
  ...
}: {
  # rofi is being managed by home-manager
  xdg.configFile."rofi" = {
    source = ./rofi;
    recursive = true;
  };
}
