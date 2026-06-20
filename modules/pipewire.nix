{...}: {
  xdg.configFile."pipewire/pipewire.conf.d/ldac.conf".text = ''
    context.properties = {
      bluez5.codecs = [ ldac aac sbc sbc_xq ]
      bluez5.hfphsp-backend = native
      bluez5.enable-msbc = true
      bluez5.enable-hw-volume = true
      bluez5.a2dp.ldac.quality = hq
      bluez5.auto-connect = [ a2dp_sink ]
    }
  '';

  xdg.configFile."pipewire/pipewire.conf.d/buffer.conf".text = ''
    context.properties = {
      default.clock.rate = 48000
      default.clock.quantum = 1024
      default.clock.min-quantum = 512
      default.clock.max-quantum = 8192
    }
  '';
}
