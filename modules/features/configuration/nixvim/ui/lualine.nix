let
  mode = ''
    "mode",
	  fmt = function(str)
		  return " " .. str
	  end,
  '';

  filename = ''
    "filename",
	  file_status = true,
	  path = 1,
  '';

  hide_in_width = ''
    function()
	    return vim.fn.winwidth(0) > 100
    end
  '';

  diagnostics = ''
	  "diagnostics",
	  sources = { "nvim_diagnostic" },
	  sections = { "error", "warn" },
	  symbols = { error = " ", warn = " ", info = " ", hint = " " },
	  colored = false,
	  update_in_insert = false,
	  always_visible = false,
	  cond =
  '';

  diff = ''
    "diff",
	  colored = false,
	  symbols = { added = " ", modified = " ", removed = " " },
	  cond =
  '';
in
{
  plugins.lualine = {
    enable = true;
    settings = {
	    options = {
		    icons_enabled = true;
		    theme = "tokyonight";
		    section_separators = { left = ""; right = ""; };
		    component_separators = { left = ""; right = ""; };
		    disabled_filetypes = {
			    statusline = [ "dashboard" "neo-tree" ];
		    };
		    always_divide_middle = true;
		    globalstatus = true;
	    };
	    sections = {
		    lualine_a = [ 
          {
            __unkeyed-1.__raw = mode;
          }
        ];
		    lualine_b = [ "branch" ];
		    lualine_c = [ 
          {
            __unkeyed-1.__raw = filename; 
          }
        ];
		    lualine_x = [
          { 
            __unkeyed-1.__raw = diagnostics + hide_in_width;
          }
          {
			      __unkeyed-2.__raw = diff + hide_in_width;
          }
          { 
            __unkeyed-3 = "encoding"; 
            cond.__raw = hide_in_width; 
          }
			    { 
            __unkeyed-4 = "filetype"; 
            cond.__raw = hide_in_width; 
          }
		    ];
		    lualine_y = [ "location" ];
		    lualine_z = [ "progress" ];
	    };
	    inactive_sections = {
		    lualine_c = [ 
          { 
            __unkeyed-1 = "filename"; 
            path = 1; 
          }
        ];
		    lualine_x = [ 
          { 
            __unkeyed-1 = "location"; 
            padding = 0; 
            } 
        ];
	    };
	    extensions = [ "fugitive" "fzf" ];
    };
  };
}
