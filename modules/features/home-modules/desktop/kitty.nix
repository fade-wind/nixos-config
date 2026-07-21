{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    environment = {
      LANG = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12.5;
    };
    settings = {
      term = "xterm-256color";
      enable_audio_bell = false;
      confirm_os_window_close = 0;
      hide_window_decorations = true;
      scrollback_lines = 5000;
      cursor_shape = "beam";
      cursor_blink_interval = 0.5;
    };
    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "shift+insert" = "paste_from_selection";
      "ctrl+0" = "change_font_size all 0";
      "ctrl+=" = "change_font_size all +1";
      "ctrl+-" = "change_font_size all -1";
      "ctrl+l" = "clear_terminal reset active";
      "page_up" = "scroll_page_up";
      "page_down" = "scroll_page_down";
      "shift+home" = "scroll_home";
      "shift+end" = " scroll_end";
    };
    extraConfig = ''
      window_padding_width 0 4 0 4
      include themes/noctalia.conf
    '';
  };
}
