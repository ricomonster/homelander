{...}: {
  xdg.configFile."MangoHud/MangoHud.conf".text = ''
    control=mangohud
    fsr_steam_sharpness=5
    nis_steam_sharpness=10
    legacy_layout=0
    horizontal
    gpu_stats
    gpu_power
    cpu_stats
    cpu_power
    vram
    ram
    fps
    frametime=0
    hud_no_margin
    table_columns=14
    frame_timing=1
    text_color=BDBDBD
    gpu_color=00E5E5
    cpu_color=00E5E5
    vram_color=00E5E5
    ram_color=00E5E5
    engine_color=00E5E5
    frametime_color=E500C6
  '';
}
