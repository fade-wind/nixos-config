{ inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./autostart.nix
    ./keybinds.nix
    # ./noctalia.nix
    ./rules.nix
    ./settings.nix
  ];
}
