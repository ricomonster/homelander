{
  lib,
  pkgs,
  ...
}:
{
  programs.fastfetch = {
    enable = true;

    settings = {
      display = {
        key.width = 10;
        size.binaryPrefix = "jedec";
        separator = "";
      };

      logo = {
        source = if pkgs.stdenv.hostPlatform.isDarwin then "macOS2_small" else "arch_small";
        type = "builtin";
      };

      modules = [
        "break"
        {
          type = "os";
          key = "os";
          keyColor = "yellow";
          format = "{name}";
        }
        {
          type = "kernel";
          key = "ker";
          keyColor = "green";
        }
        {
          type = "packages";
          key = "pkgs";
          keyColor = "cyan";
        }
        {
          type = "shell";
          key = "sh";
          keyColor = "blue";
          format = "{pretty-name}";
        }
        {
          type = "wm";
          key = "wm";
          keyColor = "red";
          format = "{pretty-name}";
        }
        {
          type = "uptime";
          key = "up";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = "cpu";
          keyColor = "red";
          format = "{name}";
        }
        {
          type = "memory";
          key = "ram";
          keyColor = "yellow";
          format = "{used} / {total}";
        }
        {
          type = "disk";
          key = "disk";
          keyColor = "cyan";
          folders = [ "/" ];
          format = "{size-used} / {size-total}";
        }
        "break"
        {
          type = "custom";
          format = "{#33}󰮯 {#32}󰊠 {#34}󰊠 {#31}󰊠 {#36}󰊠 {#35}󰊠 {#37}󰊠 {#97}󰊠";
        }
      ];
    };
  };
}
