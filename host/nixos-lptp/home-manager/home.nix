{ config, pkgs, inputs, ... }: 

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    atuin = "atuin";
    fuzzel = "fuzzel";
    eza = "eza";
    fzf = "fzf";
    kitty = "kitty";
    niri = "niri";
    nvim = "nvim";
    qtile = "qtile";
    rofi = "rofi";
    tmux = "tmux";
    vim = "vim";
    yazi = "yazi";
    zsh = "zsh";
  };
in

{
  home.username = "zpeppler";
  home.homeDirectory = "/home/zpeppler";
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "ZPeppler";
        email = "peppler.zachary@gmail.com";
      };
    };
  };
  home.stateVersion = "26.05";

  imports = [
    ./modules/btop.nix
    ./modules/xdg.nix
    ./modules/zsh.nix
    inputs.noctalia.homeModules.default
  ];

  programs.bash = {
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

  programs.vim = {
    enable = true;
    extraConfig = ''
      source ~/.config/vim/vimrc
    '';
  };

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
  
  home.packages = with pkgs; [
    neovim
    nil
    nixpkgs-fmt
    nodejs
    gcc
    rofi

    # Apps
    kitty

    # Terminal
    btop
    eza
    fastfetch
    fzf
    matugen
    ripgrep
    starship
    yazi
    zoxide

    dconf
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
}
