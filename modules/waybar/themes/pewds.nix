{scripts}: let
  commonModules = {
    "custom/cpu" = {
      exec = "${scripts}/cpu.sh";
      interval = 5;
      return-type = "json";
      restart-interval = 5;
      format = "{}";
      on-click = "ghostty -e btop &";
    };

    "custom/memory" = {
      exec = "${scripts}/memory.sh";
      interval = 10;
      return-type = "json";
      restart-interval = 5;
      on-click = "ghostty  -e btop &";
    };

    "custom/power" = {
      format = "[ 󰤆 ]";
      tooltip = true;
      tooltip-format = "Power Menu";
      on-click = "${scripts}/powermenu.sh";
    };

    "custom/arch" = {
      format = "[ 󰣇 ]";
      tooltip = true;
      tooltip-format = "btw";
      on-click = "${scripts}/powermenu.sh";
    };

    "custom/volume" = {
      exec = "${scripts}/volume.sh";
      return-type = "json";
      interval = 1;
      on-click = "wpctl set-mute  @DEFAULT_AUDIO_SINK@ toggle";
      on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
      on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    };

    "custom/vpn" = {
      exec = "${scripts}/nordvpn-status.sh";
      on-click = "${scripts}/nordvpn-toggle.sh";
      interval = 5;
      format = "{}";
      markup = "pango";
      tooltip = true;
      tooltip-format = "VPN Status / Toggle";
    };

    "custom/workspace-1" = {
      exec = "${scripts}/workspaces/workspace-1.sh";
      interval = 2;
      on-click = "hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = \"1\" }))'";
      tooltip = "Switch to workspace 1";
    };

    "custom/workspace-2" = {
      exec = "${scripts}/workspaces/workspace-2.sh";
      interval = 1;
      on-click = "hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = \"2\" }))'";
      tooltip = "Switch to workspace 2";
    };

    "custom/workspace-3" = {
      exec = "${scripts}/workspaces/workspace-3.sh";
      interval = 1;
      on-click = "hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = \"3\" }))'";
      tooltip = "Switch to workspace 3";
    };

    "custom/workspace-4" = {
      exec = "${scripts}/workspaces/workspace-4.sh";
      interval = 1;
      on-click = "hyprctl eval 'hl.dispatch(hl.dsp.focus({ workspace = \"4\" }))'";
      tooltip = "Switch to workspace 4";
    };

    clock = {
      tooltip-format = "{calendar}";
      format-alt = "  {:%a, %d %b %Y}";
      format = "[   {:%A %B %d %I:%M %p} ]";
    };

    network = {
      format-wifi = "{icon}";
      format-icons = ["[ 󰤯 ]" "[ 󰤟 ]" "[ 󰤢 ]" "[ 󰤥 ]" "[ 󰤨 ]"];
      format-ethernet = "󰀂";
      format-alt = "󱛇";
      format-disconnected = "󰖪";
      tooltip-format-wifi = "{icon} {essid}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
      tooltip-format-ethernet = "󰀂  {ifname}\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
      tooltip-format-disconnected = "Disconnected";
      on-click = "nm-connection-editor";
      interval = 5;
      nospacing = 1;
    };

    "hyprland/window" = {
      format = "{initialTitle}";
      max-length = 50;
    };

    "bluetooth" = {
      format = "{icon}";
      format-icons = {
        enabled = "[  ]";
        disabled = "[ 󰂲 ]";
      };
      tooltip-format = "Bluetooth is {status}";
      interval = 5;
    };
  };
in {
  settings = [
    (commonModules
      // {
        output = "DP-2";
        layer = "top";
        position = "top";
        margin-top = 5;
        modules-left = ["custom/arch" "custom/cpu" "custom/memory"];
        modules-right = ["custom/volume" "network" "clock"];
      })
    (commonModules
      // {
        output = "DP-1";
        layer = "top";
        position = "top";
        margin-top = 5;
        modules-left = ["custom/arch" "hyprland/window"];
        modules-center = [
          "custom/workspace-1"
          "custom/workspace-2"
          "custom/vpn"
          "custom/workspace-3"
          "custom/workspace-4"
        ];
        modules-right = [
          "custom/cpu"
          "custom/memory"
          "custom/volume"
          "bluetooth"
          "network"
          "clock"
        ];
      })
  ];
  style = builtins.readFile ./pewds.css;
}
