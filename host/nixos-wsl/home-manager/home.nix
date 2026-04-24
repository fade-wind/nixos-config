{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    atuin = "atuin";
    eza = "eza";
    fzf = "fzf";
    sesh =  "sesh-work";
    television = "television";
    tmux = "tmux";
    vim = "vim";
    zsh = "zsh";
  };
in

{
  home.username = "zpeppler";
  home.homeDirectory = "/home/zpeppler";
  home.stateVersion = "26.05";

  imports = [
    ./modules/zsh.nix
    ../../../common-modules/btop.nix
    ../../../common-modules/nixvim.nix
    ../../../common-modules/yazi.nix
  ];

  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
    nodejs
    gcc
    uv

    wl-clipboard

    # Terminal
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
    zoxide

    dconf
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };
  
  programs = {
    atuin.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        lla = "ls -la";
        ll = "ls -l";
        nrs = "sudo nixos-rebuild switch --flake $HOME/nixos-dotfiles#nixos-wsl";
      };
      initExtra = ''
        export STARSHIP_CONFIG="/etc/starship-root.toml"
        eval "$(starship init bash)"
      '';
    };

    git = {
      enable = true;
      includes = [
        {
          condition = "gitdir:~/git-work/";
          path = "~/.gitconfig-work";
        }
        {
          condition = "gitdir:~/nixos-dotfiles/";
          path = "~/.gitconfig-nixos";
        }
      ];
    };

    vim = {
      enable = true;
      extraConfig = ''
        source ~/.config/vim/vimrc
      '';
    };
  };


  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
    
    dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
