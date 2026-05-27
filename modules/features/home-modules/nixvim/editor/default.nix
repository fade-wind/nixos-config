{
  imports = [
    ./utility.nix
  ];
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        signature = {
          enabled = true;
          window = {
            border = "rounded";
          };
        };
        completion = {
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
            window = {
              border = "rounded";
            };
          };
          menu = {
            border = "rounded";
            auto_show = true;
            draw = {
              treesitter = [ "lsp" ];
            };
          };
        };
        keymap = {
          preset = "super-tab";
          #  ["<C-k>"] = false;
          #  ["<C-s>"] = [ "show_signature" "hide_signature" "fallback" ];
        };
      };
    };
    fzf-lua = {
      enable = true;
    };
    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "▏";
        };
        scope = {
          show_start = false;
          show_end = false;
          show_exact_scope = false;
        };
        exclude = {
          filetypes = [
            "dashboard"
          ];
        };
      };
    };
    neoscroll = {
      enable = true;
      settings = {
        hide_cursor = true;
        stop_eof = true;
        easing = "quadratic";
      };
    };
    noice = {
      enable = true;
      settings = {
        presets = {
          bottom_search = false;
          command_palette = true;
          long_message_to_split = true;
        };
      };
    };
    nui.enable = true;
    nvim-autopairs.enable = true;
  };

  extraConfigLua = ''
    require("fzf-lua").register_ui_select()
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<CMD>FzfLua files<CR>";
      options = {
        desc = "Find Files";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<CMD>FzfLua helptags<CR>";
      options = {
        desc = "Find Helptags";
      };
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = "<CMD>FzfLua keymaps<CR>";
      options = {
        desc = "Find keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<CMD>FzfLua builtin<CR>";
      options = {
        desc = "Find Builtin FZF";
      };
    }
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<CMD>FzfLua buffers<CR>";
      options = {
        desc = "Find existing buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<CMD>FzfLua live_grep<CR>";
      options = {
        desc = "Live grep current buffer";
      };
    }
  ];
}

