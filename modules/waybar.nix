{
  config,
  pkgs,
  ...
}: let
  commonModules = {
    "custom/cpu" = {
      exec = "${config.xdg.configHome}/waybar/scripts/cpu.sh";
      interval = 1;
      return-type = "json";
    };

    "custom/memory" = {
      exec = "${config.xdg.configHome}/waybar/scripts/memory.sh";
      interval = 10;
      return-type = "json";
    };

    "custom/power" = {
      format = "[ 󰤆 ]";
      tooltip = true;
      tooltip-format = "Power Menu";
      on-click = "${config.xdg.configHome}/waybar/scripts/powermenu.sh";
    };

    "custom/arch" = {
      format = "[ 󰣇 ]";
      tooltip = true;
      tooltip-format = "btw";
      on-click = "${config.xdg.configHome}/waybar/scripts/powermenu.sh";
    };

    "custom/volume" = {
      exec = "${config.xdg.configHome}/waybar/scripts/volume.sh";
      return-type = "json";
      interval = 1;
      on-click = "wpctl set-mute  @DEFAULT_AUDIO_SINK@ toggle";
      on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
      on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
    };

    # ── Workspaces (custom scripts) ──────────────────────────────────
    "custom/workspace-1" = {
      exec = "${config.xdg.configHome}/waybar/scripts/workspaces/workspace-1.sh";
      interval = 1;
      on-click = "hyprctl dispatch workspace 1";
      tooltip = "Switch to workspace 1";
    };

    "custom/workspace-2" = {
      exec = "${config.xdg.configHome}/waybar/scripts/workspaces/workspace-2.sh";
      interval = 1;
      on-click = "hyprctl dispatch workspace 2";
      tooltip = "Switch to workspace 2";
    };

    "custom/workspace-3" = {
      exec = "${config.xdg.configHome}/waybar/scripts/workspaces/workspace-3.sh";
      interval = 1;
      on-click = "hyprctl dispatch workspace 3";
      tooltip = "Switch to workspace 3";
    };

    "custom/workspace-4" = {
      exec = "${config.xdg.configHome}/waybar/scripts/workspaces/workspace-4.sh";
      interval = 1;
      on-click = "hyprctl dispatch workspace 4";
      tooltip = "Switch to workspace 4";
    };

    clock = {
      tooltip-format = "{calendar}";
      format-alt = "  {:%a, %d %b %Y}";
      format = "[   {:%I:%M %p} ]";
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
      max-length = 50;
    };
  };
in {
  programs.waybar = {
    enable = true;
    settings = [
      (commonModules
        // {
          output = "DP-1";
          layer = "top";
          position = "top";
          margin-top = 5;
          modules-left = ["custom/arch" "custom/cpu" "custom/memory"];
          modules-right = ["custom/volume" "network" "clock"];
        })
      (commonModules
        // {
          # Main
          output = "DP-2";
          layer = "top";
          position = "top";
          margin-top = 5;
          modules-left = ["custom/arch" "hyprland/window"];
          modules-center = [
            "custom/workspace-1"
            "custom/workspace-2"
            "custom/workspace-3"
            "custom/workspace-4"
          ];
          modules-right = [
            "custom/cpu"
            "custom/memory"
            "custom/volume"
            "network"
            "clock"
            "custom/power"
          ];
        })
    ];

    style = ''
      /* ──────────────────────────────────────────────────────────────────────────
        °˖* ૮(  • ᴗ ｡)っ🍸  pewdiepie/archdaemon/dionysh  shhheersh
        Waybar CSS styling
        vers. 1.0
      ────────────────────────────────────────────────────────────────────────── */
      * {
           border: 4px;
           border-radius: 4px;
           min-height: 0;
           font-family: "JetBrainsMono Nerd Font";
           font-feature-settings: "zero";
           font-size: 13px;
         }

         #waybar {
           background-color: #1a1b26;
           border-radius: 2px;
           opacity: 0.95;
         }

         window#waybar {
           background: #1a1b26;
           transition-property: background-color;
           transition-duration: 0.5s;
           color: #c0caf5;
           border: 3px solid #7aa2f7;
           border-left: 3px solid #7dcfff;
           border-right: 3px solid #7dcfff;
         }


         /* === Workspaces ========================================================== */

         #workspaces {
           background-color: transparent;
           padding-left: 40px;
         }

         #workspaces button {
           all: initial;
           min-width: 0;
           box-shadow: inherit;
           padding: 6px 6px;
           margin: 6px 3px;
           border-radius: 4px;
           background-color: #16161e;
           color: #7dcfff;
         }

         #workspaces button.active {
           color: #1a1b26;
           background-color: #7aa2f7;
         }

         #workspaces button:hover {
           color: #1a1b26;
           background-color: #7dcfff;
         }


         /* === Default Module Container Styling ==================================== */

         #custom-arch,
         #bluetooth,
         #custom-bluetooth,
         #custom-volume,
         #custom-cpu,
         #custom-memory,
         #custom-power,
         #network,
         #pulseaudio,
         #custom-vpn,
         #clock,
         #tray {
           padding: 6px 12px;
           margin: 6px 6px;
           background-color: #16161e;
           border: 2px solid #7aa2f7;
           border-radius: 2px;
         }


         /* === Audio ============================================================== */

         #pulseaudio.muted {
           background-color: #f7768e;
           color: #1a1b26;
         }


         /* === Bluetooth =========================================================== */

         #bluetooth.disabled {
           color: #ff9e64;
         }

         #custom-bluetooth {
           color: #7dcfff;
           transition: color 0.2s ease-in-out;
         }


         /* === Network ============================================================= */

         #network.disconnected {
           background-color: #f7768e;
           color: #1a1b26;
         }


         /* === Clock =============================================================== */

         #clock {
           font-weight: bold;
           font-size: 12px;
           color: #ff9e64;
         }


         /* === Asus Profile ======================================================== */

         #custom-asus-profile {
           font-weight: bold;
           font-size: 12px;
           color: #e0af68;
         }


         /* === VPN ================================================================= */

         #custom-vpn {
           font-weight: bold;
           font-size: 12px;
         }


         /* === CPU ================================================================= */

         #custom-cpu,
         #custom-memory {
           border-radius: 2px;
           font-weight: normal;
         }

         /* 🔴 Critical */
         #custom-cpu .battery-critical {
           background-color: #f7768e;
           color: #1a1b26;
           padding: 2px 6px;
           border-radius: 6px;
           font-weight: bold;
         }

         /* 🟠 Warning */
         #custom-cpu .battery-warning {
           background-color: #ff9e64;
           color: #1a1b26;
           padding: 2px 6px;
           border-radius: 6px;
         }

         /* 🟢 Normal */
         #custom-cpu .battery-normal {
           color: #9ece6a;
         }


         /* === Brightness ========================================================== */

         #backlight {
           background-color: #1a1b26;
         }


         /* === Tray ================================================================ */

         #tray {
           padding: 4px 8px;
           background-color: #16161e;
         }


         /* === Custom Workspace Labels ============================================= */

         #custom-work-left,
         #custom-work-right {
           padding: 6px 6px;
           margin: 6px 3px;
         }

         #custom-workspace-1:hover,
         #custom-workspace-2:hover,
         #custom-workspace-3:hover,
         #custom-workspace-4:hover {
           color: #ff9e64;
           transition: all 0.2s ease-in-out;
         }


         /* === Hover Effects ======================================================= */

         #custom-microphone:hover,
         #custom-volume:hover,
         #pulseaudio:hover,
         #network:hover,
         #custom-vpn:hover,
         #bluetooth:hover,
         #custom-bluetooth:hover,
         #custom-power:hover,
         #custom-asus-profile:hover,
         #custom-battery:hover,
         #battery:hover,
         #backlight:hover,
         #custom-brightness:hover,
         #clock:hover,
         #tray:hover {
           background-color: #292e42;
           border: 2px solid #7dcfff;
           color: #7dcfff;
           transition: all 0.2s ease-in-out;
         }


         /* === Tooltips ============================================================ */

         tooltip {
           color: #c0caf5;
           background-color: #1a1b26;
           border: 1px solid #7aa2f7;
           font-weight: bold;
         }

         tooltip label {
           color: #7dcfff;
         }
    '';
  };

  xdg.configFile."waybar/scripts/cpu.sh" = {
    source = ./../scripts/cpu.sh;
    executable = true;
  };

  xdg.configFile."waybar/scripts/memory.sh" = {
    source = ./../scripts/memory.sh;
    executable = true;
  };

  xdg.configFile."waybar/scripts/powermenu.sh" = {
    source = ./../scripts/powermenu.sh;
    executable = true;
  };

  xdg.configFile."waybar/scripts/volume.sh" = {
    source = ./../scripts/volume.sh;
    executable = true;
  };

  xdg.configFile."waybar/scripts/workspaces/workspace-1.sh" = {
    source = ./../scripts/workspaces/workspace-1.sh;
    executable = true;
  };

  xdg.configFile."waybar/scripts/workspaces/workspace-2.sh" = {
    source = ./../scripts/workspaces/workspace-2.sh;
    executable = true;
  };

  xdg.configFile."waybar/scripts/workspaces/workspace-3.sh" = {
    source = ./../scripts/workspaces/workspace-3.sh;
    executable = true;
  };
  xdg.configFile."waybar/scripts/workspaces/workspace-4.sh" = {
    source = ./../scripts/workspaces/workspace-4.sh;
    executable = true;
  };
}
