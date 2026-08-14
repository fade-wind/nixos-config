{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.nixosModules.nixvim
    ./editor
    ./settings
    ./lsp
    ./ui
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox-material = {
      enable = true;
    };
    colorscheme = "gruvbox-material";
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
