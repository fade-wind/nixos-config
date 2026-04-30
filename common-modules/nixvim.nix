{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    # defaultEditor = true;

    imports = [
      ./submodules/nixvim/config/auto_cmds.nix
      ./submodules/nixvim/config/keymaps.nix
      ./submodules/nixvim/config/settings.nix
      ./submodules/nixvim/plugins/editor/indent-blankline.nix
      ./submodules/nixvim/plugins/editor/noice.nix
      ./submodules/nixvim/plugins/editor/which-key.nix
      ./submodules/nixvim/plugins/ui/bufferline.nix
      ./submodules/nixvim/plugins/ui/lualine.nix
      ./submodules/nixvim/plugins/ui/yazi.nix
      ./submodules/nixvim/plugins/lazygit.nix
      ./submodules/nixvim/plugins/tree-sitter.nix
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
          formatters_by_ft = {
            nix = [ "nixfmt" ];
          };
        };
      };

      nui.enable = true;

      nvim-autopairs.enable = true;
      renderer-markdown.enable = true;
      vim-sleuth.enable = true;
      web-devicons.enable = true;
      fzf-lua = {
        enable = true;
      };
      neoscoll.enable = true;
    };

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "storm";
        transparent = false;
      };
    };
  };
}
