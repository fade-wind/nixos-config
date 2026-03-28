{ config, pkgs, ... }: {

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/.zshrc";

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
    initContent = builtins.readFile ./submodules/zsh/zshrc.zsh;

  };
}
