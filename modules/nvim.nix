{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = false;
    withRuby = false;
    extraPackages = [pkgs.nixfmt];
  };

  xdg.configFile."nvim".source = ./nvim;
}
