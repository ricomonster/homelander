{
  config,
  pkgs,
  ...
}: {
  # install mpv in system level
  xdg.configFile."mpv/mpv.conf".text = ''
    vo=gpu-next
    gpu-api=opengl
    hwdec=auto
    sub-font=JetBrains Mono
    sub-scale=1.2
    save-position-on-quit=yes
    demuxer-max-bytes=1GiB
  '';
}
