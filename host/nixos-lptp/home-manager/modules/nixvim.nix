{ pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    # defaultEditor = true;
    
    imports = [
      ./submodules/nixvim/bufferline.nix
      ./submodules/nixvim/indent-blankline.nix
      ./submodules/nixvim/keymaps.nix
      ./submodules/nixvim/lazygit.nix
      ./submodules/nixvim/lualine.nix
      ./submodules/nixvim/noice.nix
      ./submodules/nixvim/settings.nix
      ./submodules/nixvim/yazi.nix
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };
      
      nui.enable = true;

      nvim-autopairs.enable = true;
      which-key = {
        enable = true;
        settings = {
          presets = "helix";
        };
      };
      vim-sleuth.enable = true;
      web-devicons.enable = true;
      fzf-lua = {
        enable = true;
      };
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = { 
        style = "storm";
        transparent = true;
      };
    };
  };
}
