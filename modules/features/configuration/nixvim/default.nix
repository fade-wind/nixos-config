{ pkgs, ... }:
{
  imports = [
    ./editor
    ./settings
    ./lsp
    ./ui
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox = {
      enable = true;
    };
    colorscheme = "gruvbox";
    plugins = {
      web-devicons.enable = true;
      tmux-navigator.enable = true;
      fugitive.enable = true;
      neotest = {
        enable = true;
        adapters.plenary.enable = true;
      };
    };
  };
}
