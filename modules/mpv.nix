{...}: {
  # install mpv in system level
  xdg.configFile."mpv/mpv.conf".text = ''
    vo=gpu-next
    gpu-api=opengl
    hwdec=auto
    sub-font=JetBrainsMono Nerd Font
    sub-scale=1.2

    demuxer-max-bytes=2GiB
    demuxer-max-back-bytes=2GiB
    demuxer-readahead-secs=60
    demuxer-cache-wait=yes
    hr-seek=no
    cache-pause=yes
    prefetch-playlist=yes

    save-position-on-quit=yes
    write-filename-in-watch-later-config=yes
    save-watch-history=yes

    watch-later-directory=~~state/watch_later
  '';
}
