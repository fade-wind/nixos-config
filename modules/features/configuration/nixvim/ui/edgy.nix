{
  programs.nixvim.plugins.edgy = {
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
          title = "Neo-Tree Filesystem";
          ft = "neo-tree";
          filter.__raw = ''
            function(buf)
              return vim.b[buf].neo_tree_source == "filesystem"
            end
          '';
          pinned = true;
          open = "Neotree position=left filesystem";
        }
        {
          title = "Neo-Tree Git";
          ft = "neo-tree";
          filter.__raw = ''
            function(buf)
              return vim.b[buf].neo_tree_source == "git_status"
            end
          '';
          pinned = true;
          open = "Neotree position=right git_status";
        }
        {
          title = "Neo-Tree Buffers";
          ft = "neo-tree";
          filter.__raw = ''
            function(buf)
              return vim.b[buf].neo_tree_source == "buffers"
            end
          '';
          pinned = true;
          open = "Neotree position=top buffers";
        }
      ];
    };
  };
}
