{
  imports = [
    ./packages
    ./locale.nix
    ./nix.nix
    ./podman.nix
    ./security.nix
    ./users.nix
  ];
  programs.nix-ld.dev.enable = true;
}

