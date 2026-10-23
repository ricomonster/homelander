{ ... }: {
  # install mpv in system level
  xdg.configFile."mpv/mpv.conf".text = ''
    vo=gpu-next
    hwdec=auto
    force-window=immediate

    ao=coreaudio
    audio-channels=stereo

    sub-font=JetBrainsMono Nerd Font
    sub-scale=1.2

    save-position-on-quit=yes
    write-filename-in-watch-later-config=yes
    save-watch-history=yes
    watch-later-directory=~~state/watch_later
  '';
}
