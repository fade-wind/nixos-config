{
  plugins.bufferline = {
    enable = true;
    highlights = {
      buffer_selected = {
        bold = true;
      };
      options = {
        themable = true;
        indicator = {
          icon = "▋";
          style = "icon"; 
        };
        mode = "buffers";
        separator_style = "thin";
	      modified_icon = "●";
	      buffer_close_icon = "󰅖";
      };
    };
  };
}
