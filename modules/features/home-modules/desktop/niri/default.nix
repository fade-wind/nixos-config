{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri-nix.homeModules.default
    # ./autostart.nix
    # ./keybinds.nix
    # ./noctalia.nix
    # ./rules.nix
    # ./settings.nix
  ];
  wayland.windowManager.niri = {
    enable = true;
    pack
}
