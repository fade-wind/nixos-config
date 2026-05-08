{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Projects/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    atuin = "atuin";
    eza = "eza";
    fzf = "fzf";
    nvim = "nvim";
    sesh =  "sesh";
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
    ../../../common-modules/btop.nix
    ../../../common-modules/yazi.nix
    ../../../common-modules/zsh.nix
  ];

  home.packages = with pkgs; [
    nodejs
    cargo
    gcc
    uv
    cifs-utils

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
    neovim
    lazygit
    openshift

    dconf
    cifs-utils
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
        nrs = "sudo nixos-rebuild switch --flake $HOME/Projects/nixos-dotfiles#nixos-wsl";
      };
      initExtra = ''
        export STARSHIP_CONFIG="/etc/starship-root.toml"
        eval "$(starship init bash)"
      '';
    };

    git = {
      enable = true;
      lfs.enable = true;
      package = pkgs.gitFull;
      extraConfig = {
        credential.helper = "libsecret";
      };
      includes = [
        {
          condition = "gitdir:~/Projects/";
          path = "~/.gitconfig-work";
        }
        {
          condition = "gitdir:~/Projects/nixos-dotfiles/";
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
