{...}: {
  xdg.configFile."herdr/config.toml".text = ''
    [ui.toast]
    delivery = "terminal"

    [ui]
    show_agent_labels_on_pane_borders = false
    pane_borders = false
    pane_gaps = true

    [theme]
    name = "tokyo-night"
    auto_switch = false

    [session]
    resume_agents_on_restore = false

    [keys]
    settings = "prefix+comma"
    goto = "prefix+s"
    split_vertical = "prefix+\\"
  '';
}
