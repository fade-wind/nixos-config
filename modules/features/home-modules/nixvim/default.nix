{
  programs.nixvim = {
    enable = true;
    imports = [
      ./editor
      ./settings
      ./lsp
      ./ui
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

