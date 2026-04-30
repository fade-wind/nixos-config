{
  plugins.bufferline = {
    enable = true;
    settings = {
      highlights = {
        buffer_selected = {
          bold = true;
        };
      };
      options = {
        themable = true;
        mode = "buffers";
        separator_style = "slant";
	      modified_icon = "●";
	      buffer_close_icon = "󰅖";
      };
    };
  };
}
