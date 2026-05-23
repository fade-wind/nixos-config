{
  programs.nixvim = {
    enable = true;
    imports = [
      ./settings.nix
      ./keymaps.nix
      ./editor.nix
      ./neovide.nix
      ./lsp/default.nix
      ./ui/default.nix
      ./utility.nix
    ];
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "storm";
      };
    };
    colorscheme = "tokyonight";
    plugins = {
      web-devicons.enable = true;
      plenary.enable = true;
      vim-tmux-navigator.enable = true;
      vim-fugitive.enable = true;
    };
  };
}
