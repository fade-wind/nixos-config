{
  programs.niri.settings = {
    window-rules = [
      {
        matches = [ { app-id = "neovide"; } ];
        open-maximized = true;
      }
      {
        matches = [ { } ];
        geometry-corner-radius = {
          top-left = 9.0;
          top-right = 9.0;
          bottom-left = 9.0;
          bottom-right = 9.0;
        };
        clip-to-geometry = true;
        draw-border-with-background = false;
      }
    ];

    layer-rules = [
      {
        matches = [ { namespace = "^noctalia-(main|notifications|dock)$"; } ];
      }
      {
        matches = [ { namespace = "^noctalia-wallpaper"; } ];
        place-within-backdrop = true;
      }
    ];
  };
}
