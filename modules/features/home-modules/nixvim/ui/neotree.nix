let
  copy_path = ''
    function(state)
      local node = state.tree:get_node()
      local path = node:get_id()
      vim.fn.setreg("+", path, "c")
    end
  '';
in
{
  plugins.neo-tree = {
    enable = true;
    settings = {
      sources = [
		    "filesystem"
		    "buffers"
		    "git_status"
	    ];
      source_selector = {
        winbar = true;
        tabs_layout = "active";
        content_layout = "center";
        separator = {
          left = "/";
          right = "\\";
          override = "active";
        };
      };
	    close_if_last_window = true;
	    open_files_do_not_replace_types = [
		    "terminal"
		    "Trouble"
		    "trouble"
		    "qf"
		    "Outline"
	    ];
	    filesystem = {
		    bind_to_cwd = true;
		    use_libuv_file_watcher = true;
	    };
	    window = {
		    width = 25;
		    mappings = {
		      "l" = "open";
		      "h" = "close_node";
		      "<space>" = "none";
          "Y" = {
            command.__raw = copy_path; 
          };
		      "P" = { 
            command = "toggle_preview";
            config = { use_float = false; }; 
          };
		    };
	    };
	    default_component_configs = {
		    indent = {
			    with_expanders = true;
			    expander_collapsed = "";
			    expander_expanded = "";
			    expander_highlight = "NeoTreeExpander";
		    };
		    git_status = {
			    symbols = {
				    unstaged = "󰄱";
				    staged = "󰱒";
			    };
		    };
	    };
    };
  };
  
  keymaps = [
    { 
      mode = ["n" "v" ];
      key = "<leader>e"; 
      action = "<CMD>Neotree filesystem toggle left<CR>";
      options = { desc = "Neo-tree toggle"; };
    }
  ];
}
