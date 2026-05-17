{ config, pkgs, ... }: {

  imports = [
    ./aliases.nix
    ./env.nix
  ];

  home.file.".config/zsh/completions".source = ./completions;
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = { 
      enable = true;
      styles = {
        path = "none";
        path_prefix = "none";
      };
    };
    enableCompletion = true;
    setOptions = [
      "NO_BEEP"
      "NUMERIC_GLOB_SORT"
    ];

    siteFunctions = {
      zoxide_cd_and_list = ''
        # Change directory with zoxide
        z "$@" || return
          # Get current git branch if present
        if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
          branch="$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD)"
          git_info=" \033[1;35m $branch\033[0m"
        else
          git_info=""
        fi
        # Print a pretty header
        echo -e "\n\033[1;36m📁 Now in:\033[0m  \033[1;33m$(pwd)\033[0m$git_info\n"
        # Run the eza alias for ls
        eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -l --git -h
      '';
    };
    initContent = builtins.readFile ./custom/autostart.zsh;

  };
}
