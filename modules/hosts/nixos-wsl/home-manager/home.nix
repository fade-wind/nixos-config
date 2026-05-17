{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Projects/nixos-dotfiles/modules/config";
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
    ../../../features/programs/btop.nix
    ../../../features/programs/yazi/default.nix
    ../../../features/programs/zsh/default.nix
    ../../../features/home-modules/atuin.nix
    ../../../features/home-modules/default.nix
    ../../../features/home-modules/fzf.nix
    ../../../features/home-modules/television/default.nix
    ../../../features/home-modules/xdg/default.nix
  ];

  home.packages = with pkgs; [
    dconf
  ];
  
  programs = {
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
  };


  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
    })
    configs;
}
