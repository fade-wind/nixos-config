{
  plugins.edgy = {
    enable = true;
    settings = {
      animate.enabled = false;
      bottom = [
        {
          ft = "toggleterm";
          size = {
            height = 0.3;
          };
          filter.__raw = ''
            function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end
          '';
        }
      ];
      left = [
        {
          title = "Neo-Tree";
          ft = "neo-tree";
          size = {
            width = 30;
          };
        }
      ];
    };
  };
}

