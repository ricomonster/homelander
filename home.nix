{ pkgs, ... }: {
  imports = [
    ./modules/btop.nix 
    ./modules/fastfetch.nix
    ./modules/ghostty.nix 
    ./modules/git.nix
    ./modules/herdr.nix 
    ./modules/nvim.nix
    ./modules/starship.nix
    ./modules/tmux.nix 
    ./modules/zsh.nix
  ];

  home.stateVersion = "25.11";
  home.sessionVariables.LC_NUMERIC = "en_US.UTF-8";

  home.packages = with pkgs; [
    bc
    jq
    lazygit
    less
    yarn
    eza
    bun
    go
    tree-sitter

    herdr

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    font-awesome
    material-design-icons
    dejavu_fonts
    liberation_ttf
  ];

  programs.home-manager.enable = true;
}
