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

    [[keys.command]]
    key = "ctrl+h"
    type = "plugin_action"
    command = "vim-herdr-navigation.left"
    description = "navigate left (vim/herdr)"

    [[keys.command]]
    key = "ctrl+j"
    type = "plugin_action"
    command = "vim-herdr-navigation.down"
    description = "navigate down (vim/herdr)"

    [[keys.command]]
    key = "ctrl+k"
    type = "plugin_action"
    command = "vim-herdr-navigation.up"
    description = "navigate up (vim/herdr)"

    [[keys.command]]
    key = "ctrl+l"
    type = "plugin_action"
    command = "vim-herdr-navigation.right"
    description = "navigate right (vim/herdr)"

    [[keys.command]]
    key = "prefix+f"
    type = "plugin_action"
    command = "nicolegros.herdr-launcher.open"
    description = "project launcher"
  '';

  xdg.configFile."herdr/scripts/setup-workspace.sh" = {
    text = ''
      #!/bin/sh
      # ~/.config/herdr/scripts/setup-workspace.sh

      LAYOUT="$HERDR_LAUNCHER_DIR/config.yaml"
      CONFIG_DIR=$(herdr plugin config-dir herdr-spreader 2>/dev/null)

      if [ -f "$LAYOUT" ] && [ -n "$CONFIG_DIR" ]; then
        mkdir -p "$CONFIG_DIR"
        cp "$LAYOUT" "$CONFIG_DIR/config.yaml"

        herdr plugin action invoke herdr-spreader.apply
        status=$?

        # clear copied layout
        rm -f "$CONFIG_DIR/config.yaml" "$CONFIG_DIR/config.yml"

        exit $status
      fi
    '';
    executable = true;
  };
}
