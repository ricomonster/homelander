{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    mouse = true;
    baseIndex = 1;
    historyLimit = 1000000;
    keyMode = "vi";
    terminal = "screen-256color";
    sensibleOnTop = false;
    prefix = "C-b";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_terminal_icon 
          set -g @tokyo-night-tmux_active_terminal_icon 
          set -g @tokyo-night-tmux_window_tidy_icons 0
          set -g @tokyo-night-tmux_show_hostname 1
          set -g @tokyo-night-tmux_window_id_style digital
          set -g @tokyo-night-tmux_pane_id_style hsquare
          set -g @tokyo-night-tmux_zoom_id_style dsquare
          set -g @tokyo-night-tmux_show_path 0
          set -g @tokyo-night-tmux_session_name 0
        '';
      }
    ];

    extraConfig = ''
      # Reload config
      unbind r
      bind r source-file ~/.tmux.conf

      # Pane navigation (vim motions)
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Splits and windows
      bind c new-window -c "$PWD"
      bind \\ split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Options
      set-option -g terminal-overrides ",xterm*:Tc"
      set -g pane-base-index 1
      set -g detach-on-destroy off
      set -g renumber-windows on
      set -g set-clipboard on
      set -g cursor-style underline
      set-option -g status-position top

      # Override colors
      set -g pane-border-style "fg=#1A1B26"
      set -g pane-active-border-style "fg=#1A1B26"
    '';
  };
}
