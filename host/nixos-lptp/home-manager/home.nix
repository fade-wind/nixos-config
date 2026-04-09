{ config, pkgs, inputs, ... }: 

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    assets = "assets";
    atuin = "atuin";
    eza = "eza";
    fzf = "fzf";
    kitty = "kitty";
    niri = "niri";
    noctalia = "noctalia";
    nvim = "nvim";
    qutebrowser = "qutebrowser";
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
    ./modules/btop.nix
    ./modules/foot.nix
    ./modules/xdg.nix
    ./modules/vesktop.nix
    ./modules/yazi.nix
    ./modules/zsh.nix
    inputs.noctalia.homeModules.default
  ];
  
  home.packages = with pkgs; [
    neovim
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi

    # Apps
    kitty
    qutebrowser
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
    BROWSER = "qutebrowser";
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
        nrs = "sudo nixos-rebuild switch --flake $HOME/nixos-dotfiles#nixos-lptp";
      };
      initExtra = ''
        export PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
        export STARSHIP_CONFIG="/etc/starship-root.toml"
      '';
    };

    emacs = {
      enable = true;
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "ZPeppler";
          email = "peppler.zachary@gmail.com";
        };
      };
    };

    vim = {
      enable = true;
      extraConfig = ''
        source ~/.config/vim/vimrc
      '';
    };
  };

  services.emacs = {
    enable = true;
    startWithUserSession = true;
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
