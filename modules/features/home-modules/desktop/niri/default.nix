{
  programs.niri = {
    enable = true;
    settings = {
      input = {
        keyboard.numlock = true;
        touchpad.tap = true;
        touchpad.natural-scroll = true;
        focus-follows-mouse.max-scroll-amount = "0%";
      };
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      debug.honor-xdg-activation-with-invalid-serial = true;

      # Cursor
      cursor = {
        xcursor-theme = "Bibata-Modern-Ice";
        xcursor-size = 22;
        hide-when-typing = true;
      };

      # Environment
      environment = {
        XDG_CURRENT_DESKTOP  = "niri";
        XDG_SESSION_TYPE  = "wayland";
        XDG_SESSION_DESKTOP  = "niri";
        QTA_QPA_PLATFORM  = "wayland";
        QTA_QPA_PLATFORMTHEME  = "qt6ct";
        QTA_WAYLAND_DISABLE_WINDOW_DECORATION  = "1";
        QTA_AUTO_SCREEN_SCALE_FACTOR  = "1";
        GDK_BACKEND  = "wayland,x11";
        SDL_VIDEODRIVER  = "wayland";
        CLUTTER_BACKEND  = "wayland";
      };
      
      # Startup

      hotkey-overlay.skip-at-startup = true;
      spawn-at-startup = [
        { argv = ["noctlia"]; }
        { argv = [ "wl-paste --type image --watch cliphist store" ]; }
        { argv = [ "wl-paste --type text --watch cliphist store" ]; }
      ];
    };
  };
}

