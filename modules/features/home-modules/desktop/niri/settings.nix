{
  programs.niri.settings = {
    prefer-no-csd = true;
    screenshot-path = null;

    outputs = {
      "eDP-1" = {
        mode = {
          width = 1920;
          height = 1080;
          referesh = 120.030;
        };
        scale = 1.0;
        transform = "normal";
        position = {
          x = 0;
          y = 0;
        };
      };
    };

    layout = {
      gaps = 9;
      center-focused-column = "on-overflow";
      always-center-single-column = true;

      preset-column-widths = [
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];

      default-column-width = {
        proportion = 0.5;
      };

      background-color = "transparent";
      struts = { };
      focus-ring.enable = true;
    };

    input = {
      keyboard = {
        xkb.layout = "us";
        numlock = true;
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      focus-follows-mouse.enable = true;
      workspace-auto-back-and-forth = true;
    };

    cursor = {
      theme = "Bibata-Modern-Ice";
      size = 24;
    };

    environment = {
      ELECTRON_OZONE_PLATFORM_HINT = "x11";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "niri";

      XCURSOR_SIZE = "24";
      XCURSOR_THEME = "Bibata-Modern-Ice";
      QT_QPA_PLATFORMTHEME = "gtk3";
      EDITR = "nvim";
    };
  };
}
