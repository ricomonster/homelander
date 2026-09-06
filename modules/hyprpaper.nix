{...}: {
  # install hyprpaper on system level
  xdg.configFile."wallpapers" = {
    source = ./../wallpapers;
    recursive = true;
  };

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    splash = false

    wallpaper {
      monitor = DP-1
      path = ~/.config/wallpapers/ZYbnuDd.jpeg
    }

    wallpaper {
      # monitor = DP-2
      monitor = HDMI-A-1
      path = ~/.config/wallpapers/ZYbnuDd.jpeg
    }
  '';
}
