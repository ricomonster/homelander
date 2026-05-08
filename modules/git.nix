{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ricomonster";
        email = "2063313+ricomonster@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      extraConfig = {
        pull.rebase = false;
        push.autoSetupRemote = true;
        core.editor = "nvim";
      };
    };

    ignores = [
      ".DS_Store"
      "*.swp"
      "node_modules"
      ".env"
      ".direnv"
    ];
  };
}
