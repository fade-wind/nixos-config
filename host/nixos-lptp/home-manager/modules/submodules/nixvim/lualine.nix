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
    path = 0,
  '';

  hideInWidth = ''
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
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond =
  '';

in {
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        icons_enabled = true;
        always_divide_middle = true;
        global_status = true;
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
            __unkeyed-1.__raw = diagnostics + hideInWidth;
          }
          {
            __unkeyed-2.__raw = diff + hideInWidth;
          }
          {
            __unkeyed-3 = "encoding";
            cond.__raw = hideInWidth;
          }
          {
            __unkeyed-4 = "filetype";
            cond.__raw = hideInWidth;
          }
        ];
        lualine_y = [ "location" ];
        lualine_z = [ "progress" ];
      };
      inactive_sections = {
        lualine_c = [
          {
            __unkeyed-1 = "filepath";
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
    };
  };
}
