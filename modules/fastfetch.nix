{
  lib,
  pkgs,
  ...
}: {
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "~/.config/ml4w/assets/ml4w.png";
        type = "auto";
        width = 12;
        padding = {
          top = 1;
          right = 4;
          left = 3;
        };
      };

      display.separator = " ";

      modules =
        [
          {
            key = "╭───────────╮";
            type = "custom";
          }
          {
            key = "│ {#34} user    {#keys}│";
            type = "title";
            format = "{user-name}";
          }
          {
            key = "│ {#34}󰇅 hname   {#keys}│";
            type = "title";
            format = "{host-name}";
          }
        ]
        ++ lib.optionals (!pkgs.stdenv.isDarwin) [
          {
            condition = {
              "!system" = "macOS";
            };
            type = "disk";
            keyIcon = "";
            key = "│{#34} {icon} os age {#keys} │";
            folders = "/";
            format = "{create-time:10} [{days} days ({years} years)]";
          }
        ]
        ++ [
          {
            key = "│ {#34}󰅐 uptime  {#keys}│";
            type = "uptime";
          }
          {
            key = "│ {#34}{icon} distro  {#keys}│";
            type = "os";
          }
          {
            key = "│ {#34} kernel  {#keys}│";
            type = "kernel";
          }
          {
            key = "│ {#34} wm      {#keys}│";
            type = "wm";
          }
          {
            key = "│ {#34}󰇄 desktop {#keys}│";
            type = "de";
          }
          {
            key = "│ {#34} term    {#keys}│";
            type = "terminal";
          }
          {
            key = "│ {#34} shell   {#keys}│";
            type = "shell";
          }
          {
            key = "│ {#34}󰍛 cpu     {#keys}│";
            type = "cpu";
            showPeCoreCount = true;
          }
          {
            key = "│ {#34}󰉉 disk    {#keys}│";
            type = "disk";
            folders = "/";
          }
          {
            key = "│ {#34} memory  {#keys}│";
            type = "memory";
          }
          {
            key = "├───────────┤";
            type = "custom";
          }
          {
            key = "│ {#34} colors  {#keys}│";
            type = "colors";
            symbol = "circle";
          }
          {
            key = "╰───────────╯";
            type = "custom";
          }
        ];
    };
  };
}
