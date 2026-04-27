{
  config,
  pkgs,
  ...
}: {
  home.username = "ricomonster";
  home.homeDirectory = "/home/ricomonster";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    LC_NUMERIC = "en_US.UTF-8";
  };

  imports = [
    ./modules/fastfetch.nix
    ./modules/ghostty.nix
    ./modules/packages.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  programs.home-manager.enable = true;
}
