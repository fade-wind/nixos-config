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
    mango = "mango";
    niri = "niri";
    qutebrowser = "qutebrowser";
    sesh = "sesh-home";
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
    ./modules/foot.nix
    ./modules/kanshi.nix
    ./modules/noctalia.nix
    ./modules/vesktop.nix
    ./modules/xdg.nix
    ./modules/zsh.nix
    ../../../common-modules/btop.nix
    ../../../common-modules/nixvim.nix
    ../../../common-modules/yazi.nix
    inputs.noctalia.homeModules.default
  ];
  
  home.packages = with pkgs; [
    nil
    nixpkgs-fmt
    nodejs
    gcc

    # Apps
    kitty
    qutebrowser
    wl-clipboard
    neovide
    nirimod

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
    lazygit

    dconf
    libxcb
    libxcb-wm
  ];

  home.sessionVariables = {
    BROWSER = "qutebrowser";
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
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

    vscode = {
      enable = true;
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
