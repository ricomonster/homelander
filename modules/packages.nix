{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    eza
    fastfetch
    starship
    tmuxifier
  ];
}
