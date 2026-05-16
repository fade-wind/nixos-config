{ config, pkgs, ... }: {

  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zshrc";

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];
    
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    setOptions = [
      "NOBEEP"
      "NUMERIC_GLOB_SORT"
    ];

    initContent = builtins.readFile ./zshrc.zsh;

  };
}
