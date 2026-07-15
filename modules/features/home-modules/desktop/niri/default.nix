{ inputs, pkgs, ... }:

{
  imports = [
    ./autostart.nix
    ./keybinds.nix
    ./rules.nix
    ./settings.nix
  ];
}
