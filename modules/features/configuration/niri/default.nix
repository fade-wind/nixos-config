{ inputs, pkgs, ... }:

{
  imports = [
    inputs.niri.nixosModules.niri
    ./autostart.nix
    ./keybinds.nix
    ./rules.nix
    ./settings.nix
  ];

  niri-flake.cache.enable = true;
  programs.niri.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;
}
