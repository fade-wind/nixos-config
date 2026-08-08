{ inputs, pkgs, ... }:
{
  imports = [
    inputs.niri.nixosModules.niri
    ./packages
    ./locale.nix
    ./kanidm.nix
    ./nix.nix
    ./podman.nix
    ./security.nix
    ./users.nix
  ];
  programs.nix-ld.dev.enable = true;

  niri-flake.cache.enable = true;
  programs.niri.enable = true;
  programs.niri.package =
    (inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable).overrideAttrs
      (_: {
        doCheck = false;
      });
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
  };
  systemd.user.services.niri-flake-polkit.enable = false;
}
