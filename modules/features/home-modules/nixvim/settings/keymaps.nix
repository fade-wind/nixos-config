{
  keymaps = [
    # Disable spacebar's default behavior
    {
      mode = [
        "n"
        "v"
      ];
      key = "<Space>";
      action = "<Nop>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<CMD>w<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<C-a>";
      action = "<CMD>noautocmd w<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<C-q>";
      action = "<CMD>q<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<Tab>";
      action = ":bnext<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = ":bprevious<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>x";
      action = ":Bdelete!<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<CMD>enew<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>v";
      action = "<C-w>v";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>s";
      action = "<C-w>s";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>lw";
      action = "<CMD>setwrap!<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        silent = true;
        noremap = true;
      };
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<CMD>nohlsearch<CR>";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>F";
      action = "<CMD>filetype detect<CR>";
      options = {
        desc = "Filetype detect";
      };
    }
    {
      mode = "n";
      key = "gl";
      action.__raw = ''
        function()
          vim.diagnostic.open_float()
        end
      '';
      options = {
        desc = "Open Diagnostic in float";
      };
    }
    {
      mode = "n";
      key = "<leader>?";
      action.__raw = ''
        function()
          require("which-key").show({ global = false})
        end
      '';
      options = {
        desc = "Buffer keymaps (which-key)";
      };
    }
  ];
}

