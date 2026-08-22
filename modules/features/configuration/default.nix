{ inputs, pkgs, ... }:
{
  imports = [
    ./packages
    ./nixvim
    ./locale.nix
    ./greeter.nix
    ./nix.nix
    ./podman.nix
    ./security.nix
    ./users.nix
    inputs.umbriel.nixosModules.default
  ];
  programs.nix-ld.dev.enable = true;

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
  };

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
  programs.niri = {
    enable = true;
  };
  programs.umbriel = {
    enable = true;
  };
}
