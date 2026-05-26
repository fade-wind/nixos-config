{ config, pkgs, ... }:

{
  home.username = "zpeppler";
  home.homeDirectory = "/home/zpeppler";
  home.stateVersion = "26.05";

  imports = [
    ../../../features/home-modules
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
}
