{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "zpeppler";
  home.homeDirectory = "/home/zpeppler";
  home.stateVersion = "26.05";

  imports = [
    ../../../features/home-modules/atuin.nix
    ../../../features/home-modules/btop.nix
    ../../../features/home-modules/default.nix
    ../../../features/home-modules/eza.nix
    ../../../features/home-modules/fzf.nix
    ../../../features/home-modules/lazygit/default.nix
    ../../../features/home-modules/nixvim/default.nix
    ../../../features/home-modules/tmux/default.nix
    ../../../features/home-modules/vim.nix
    ../../../features/home-modules/xdg/default.nix
    ../../../features/home-modules/yazi/default.nix
    ../../../features/home-modules/zsh/default.nix
    inputs.nixvim.homeModules.nixvim
  ];

  home.packages = with pkgs; [
    dconf
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "ZPeppler";
          email = "peppler.zachary@gmail.com";
        };
      };
    };
  };
}

