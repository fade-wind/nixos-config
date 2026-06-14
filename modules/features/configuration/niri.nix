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
    };
    config = ''
      include "./niri/cursor.kdl"
      include "./niri/environment.kdl"
      include "./niri/keybinds.kdl"
      include "./niri/layout.kdl"
      include "./niri/output.kdl"
      include "./niri/startup.kdl"
      include "./niri/windowrules.kdl"
    '';
  };
}

