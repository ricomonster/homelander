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
      interval = 1;
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

    "custom/volume" = {
      exec = "${config.xdg.configHome}/waybar/scripts/volume.sh";
      return-type = "json";
      interval = 1;
      on-click = "wpctl set-mute  @DEFAULT_AUDIO_SINK@ toggle";
      on-scroll-up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
      on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
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
          modules-right = ["network" "clock"];
        })
      (commonModules
        // {
          # Main
          output = "DP-2";
          layer = "top";
          position = "top";
          margin-top = 5;
          modules-left = ["custom/arch"];
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

      /* === Base Waybar Styling ================================================= */

      * {
        border: 4px;
        border-radius: 4px;
        min-height: 0;
        font-family: "JetBrainsMono Nerd Font";
        font-feature-settings: "zero";
        font-size: 13px;
      }

      #waybar {
        background-color: #3b4252;
        border-radius: 2px;
        opacity: 0.95;
      }

      window#waybar {
        background: #282c34;
        transition-property: background-color;
        transition-duration: 0.5s;
        color: #9cdef2;
        border: 3px solid #61afef;
        border-left: 3px solid #56b6c2;
        border-right: 3px solid #56b6c2;
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
        background-color: #2e3440;
        color: #56b6c2;
      }

      #workspaces button.active {
        color: #fab387;
        background-color: #56b6c2;
      }

      #workspaces button:hover {
        color: #2e3440;
        background-color: #56b6c2;
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
        background-color: #292d35;
        border: 2px solid #61afef;
        border-radius: 2px;
      }


      /* === Audio ============================================================== */

      #pulseaudio.muted {
        background-color: #f38ba8;
        color: #1e1e2e;
      }


      /* === Bluetooth =========================================================== */

      #bluetooth.disabled {
        color: #fab387;
      }

      #custom-bluetooth {
        color: #56b6c2;
        transition: color 0.2s ease-in-out;
      }


      /* === Network ============================================================= */

      #network.disconnected {
        background-color: #e06c75;
        color: #1e1e2e;
      }


      /* === Clock =============================================================== */

      #clock {
        font-weight: bold;
        font-size: 12px;
        color: #fab387;
      }


      /* === Asus Profile ======================================================== */

      #custom-asus-profile {
        font-weight: bold;
        font-size: 12px;
        color: #e5c07b;
      }


      /* === VPN ================================================================= */

      #custom-vpn {
        font-weight: bold;
        font-size: 12px;
      }


      /* === CPU ============================================================= */

      #custom-cpu,
      #custom-memory {
        border-radius: 2px;
        font-weight: normal;
      }

      /* 🔴 Critical */
      #custom-cpu .battery-critical {
        background-color: #bf616a;
        color: white;
        padding: 2px 6px;
        border-radius: 6px;
        font-weight: bold;
      }

      /* 🟠 Warning */
      #custom-cpu .battery-warning {
        background-color: #fab387;
        color: #2e3440;
        padding: 2px 6px;
        border-radius: 6px;
      }

      /* 🟢 Normal */
      #custom-cpu .battery-normal {
        color: #ffffff;
      }


      /* === Brightness ========================================================== */

      #backlight {
        background-color: #3b4252;
      }


      /* === Tray ================================================================ */

      #tray {
        padding: 4px 8px;
        background-color: #1e1e2e;
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
        color: #fab387;
        transition: all 0.2s ease-in-out;
      }



      /* === Hover Effects ======================================================= */
      /* Unified look for all interactive modules                                */

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
        background-color: #4c566a;
        border: 2px solid #56b6c2;
        color: #56b6c2;
        transition: all 0.2s ease-in-out;
      }


      /* === Tooltips ============================================================ */

      tooltip {
        color: #56b6c2;
        background-color: #3b4252;
        border: 1px solid #56b6c2;
        font-weight: bold;
      }

      tooltip label {
        color: #78bec7;
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
}
