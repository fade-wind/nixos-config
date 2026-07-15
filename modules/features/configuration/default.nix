{ inputs, ... }:
{
  imports = [
    inputs.niri.nixosModules.niri
    ./packages
    ./locale.nix
    ./nix.nix
    ./podman.nix
    ./security.nix
    ./users.nix
  ];
  programs.nix-ld.dev.enable = true;

  niri-flake.cache.enable = true;
  programs.niri.enable = true;
  systemd.user.services.niri-flake-polkit.enable = false;
}
