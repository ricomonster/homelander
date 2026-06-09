{...}: {
  xdg.configFile."pipewire/pipewire.conf.d/ldac.conf".text = ''
    context.properties = {
      bluez5.codecs = [ ldac aac sbc sbc_xq ]
      bluez5.hfphsp-backend = native
      bluez5.enable-msbc = true
      bluez5.enable-hw-volume = true
    }
  '';
}
