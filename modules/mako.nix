{...}: {
  xdg.configFile."mako/config".text = ''
    output=DP-1

    # Tokyo Night colors
    background-color=#1a1b26
    text-color=#c0caf5
    border-color=#7aa2f7
    border-radius=8
    border-size=2

    # Layout
    width=380
    height=100
    margin=10
    padding=15
    anchor=top-right

    # Font
    font=JetBrainsMono Nerd Font 11

    # Timeout
    default-timeout=5000
    ignore-timeout=1

    # Urgency styles
    [urgency=low]
    background-color=#1a1b26
    border-color=#414868

    [urgency=normal]
    background-color=#1a1b26
    border-color=#7aa2f7

    [urgency=high]
    background-color=#1a1b26
    border-color=#f7768e
    text-color=#f7768e
  '';
}
