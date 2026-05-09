{
  config,
  pkgs,
  ...
}: {
  xdg.configFile."btop/themes/tokyonight_night.theme".source = ./btop/themes/tokyonight_night.theme;

  xdg.configFile."btop/btop.conf".text = ''
    color_theme = "tokyo-night"
    theme_background = False
    truecolor = True
    vim_keys = True
    rounded_corners = True
    graph_symbol = "braille"
  '';
}
