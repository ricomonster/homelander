{scripts}: {
  settings = [
    {
      layer = "top";
      position = "top";
      height = 35;
      spacing = 6;
      "margin-top" = 0;
      "margin-bottom" = 0;
      "modules-left" = [
        "custom/logo"
        "hyprland/window"
      ];
      "modules-center" = [
        "cpu"
        "memory"
        "hyprland/workspaces"
        "clock"
        "custom/separatordot"
        "pulseaudio"
        "custom/vpn"
      ];
      "modules-right" = [
        "custom/notification"
        "network"
        "bluetooth"
      ];
      "custom/logo" = {
        format = "   ";
        tooltip = false;
      };
      "hyprland/window" = {
        format = "{initialTitle}";
        "max-length" = 15;
      };
      "cpu" = {
        interval = 2;
        format = " {usage}%";
        tooltip = true;
        "on-click" = "ghostty -e btop &";
      };
      "memory" = {
        format = "󰘚 {percentage}%";
        interval = 5;
        "tooltip-format" = " RAM               󰓡 SWAP\n\n󰳆 Used:  {used:0.1f} GB      󰳆 Used:  {swapUsed:0.1f} GB\n󰗖 Free:  {avail:0.1f} GB     󰗖 Free:  {swapAvail:0.1f} GB\n󰦎 Total: {total:0.1f} GB     󰦎 Total: {swapTotal:0.1f} GB";
        "on-click" = "ghostty -e btop &";
      };
      "tray" = {
        "icon-size" = 18;
        spacing = 12;
      };
      "clock" = {
        format = "{:%a %B %d %I:%M:%S %p}";
        "format-alt" = "{:%a, %d %B %Y}";
        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
        interval = 1;
      };
      "custom/separatordot" = {
        format = "•";
        tooltip = false;
      };
      "backlight" = {
        format = "󰃠";
        tooltip = false;
      };
      "battery" = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity} %";
        "format-charging" = "󰂄 {capacity} %";
        "format-plugged" = "󰂄 {capacity} %";
        "format-full" = "󰁹 {capacity} %";
        "format-icons" = [
          "󰂎"
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
      };
      "pulseaudio" = {
        format = "  {volume}%";
        "format-muted" = "󰖁";
        "on-click" = "pavucontrol";
        "tooltip-format" = "Volume: {volume}%";
      };
      "network" = {
        interval = 10;
        "format-wifi" = "{icon}";
        "format-ethernet" = "󰈀";
        "format-disconnected" = "󰖪";
        "format-disabled" = "󰖪";
        "tooltip-format-wifi" = "WiFi: {essid} ({signalStrength}%)\nIP: {ipaddr}";
        "tooltip-format-ethernet" = "Ethernet: {ifname}\nIP: {ipaddr}";
        "tooltip-format-disconnected" = "Disconnected";
        "format-icons" = [
          "󰤯"
          "󰤟"
          "󰤢"
          "󰤥"
          "󰤨"
        ];
        "on-click" = "nmgui";
      };
      "bluetooth" = {
        "format-on" = "󰂯";
        "format-off" = "󰂲";
        "format-disabled" = "󰂲";
        "format-connected" = "󰂱";
        "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{status}";
        "tooltip-format-connected" = "Connected to: {device_alias}\nBattery: {device_battery_percentage}%";
        "on-click" = "blueman-manager";
      };
      "custom/notification" = {
        tooltip = true;
        format = "<span size='12pt'>{icon}</span>";
        "format-icons" = {
          notification = "󱅫";
          none = "󰂜";
          "dnd-notification" = "󰂠";
          "dnd-none" = "󰪓";
          "inhibited-notification" = "󰂛";
          "inhibited-none" = "󰪑";
          "dnd-inhibited-notification" = "󰂛";
          "dnd-inhibited-none" = "󰪑";
        };
        "return-type" = "json";
        "exec-if" = "which swaync-client";
        "exec" = "swaync-client -swb";
        "on-click" = "swaync-client -t -sw";
        "on-click-right" = "swaync-client -d -sw";
        escape = true;
      };

      "custom/vpn" = {
        exec = "${scripts}/nordvpn-status-v2.sh";
        on-click = "${scripts}/nordvpn-toggle.sh";
        interval = 5;
        return-type = "json";
        format = "{}";
        tooltip = true;
      };
    }
  ];
  style = builtins.readFile ./default.css;
}
