{
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;
    spawn-at-startup = [
      { command = [ "xwayland-satellite" ]; }
      { command = [ "noctalia" ]; }
      {
        command = [
          "wl-paste"
          "--type"
          "image"
          "--watch"
          "cliphist"
          "store"
        ];
      }
      {
        command = [
          "wl-paste"
          "--type"
          "text"
          "--watch"
          "cliphist"
          "store"
        ];
      }
    ];
  };
}
