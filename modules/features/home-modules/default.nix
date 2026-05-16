{ config, pkgs, ... }:
{ 

  home.packages = with pkgs; [
    nodejs
    cargo
    gcc 
    cifs-utils
    wl-clipboard
    btop
    eza
    fastfetch
    ffmpeg
    fzf
    imagemagick
    jp
    matugen
    poppler
    ripgrep
    starship
    yazi
    neovim
    lazygit
    dconf
    uv
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs = {
    atuin = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    bash = {
      enable = true;
      shellAliases = {
        lla = "ls -la";
        ll = "ls -l";
        nrs = "sudo nixos-rebuild switch --flake $HOME/Projects/nixos-dotfiles#nixos-wsl";
      };
      initExtra = ''
        export STARSHIP_CONFIG="/etc/starship-root.toml"
        eval "$(starship init bash)"
      '';
    };
    
    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true; 
    };

    television = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true; 
     
    };

    vim = {
      enable = true;
      extraConfig = ''
        source ~/.config/vim/vimrc
      '';
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

}
