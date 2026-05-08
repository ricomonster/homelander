{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;

    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      yay = "yay --batchinstall --sudoloop";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
    ];

    initContent = ''
      # NVM (managed outside Nix)
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

      # Go
      export GOPATH=$(go env GOPATH)
      export GOBIN=$GOPATH/bin
      export PATH=$PATH:$GOBIN

      # Tmuxifier
      export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
      eval "$(tmuxifier init -)"

      # fastfetch with pokemon-colorscripts, fallback to neofetch
      if command -v fastfetch > /dev/null 2>&1; then
        if command -v pokemon-colorscripts > /dev/null 2>&1; then
          fastfetch --data-raw "$(pokemon-colorscripts -r)"
        else
          fastfetch
        fi
      elif command -v neofetch > /dev/null 2>&1; then
        DISPLAY="" neofetch
      fi

      # Cargo
      export PATH="$HOME/.cargo/bin:$PATH"
      export PATH="$HOME/.local/bin:$PATH"

      # Secrets (not managed by Nix, safe to commit home.nix)
      [ -f ~/.secrets ] && source ~/.secrets
    '';
  };
}
