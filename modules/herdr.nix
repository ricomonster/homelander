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
    key = "prefix+up"
    type = "plugin_action"
    command = "cloudmanic.herdr-plus.projects"
    description = "herdr-plus: projects"

    [[keys.command]]
    key = "prefix+down"
    type = "plugin_action"
    command = "cloudmanic.herdr-plus.quick-actions"
    description = "herdr-plus: quick actions"
  '';
}
