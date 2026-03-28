{
  description = "NixOS Laptop on Lenovo T580";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-plymouth.url = "github:BeatLink/nixos-plymouth";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    nur.url = "github:nix-community/NUR";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
  };

  outputs = inputs@{ self, nixpkgs, ... }: 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos-lptp = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs system; };
      modules = [
        ./host/nixos-lptp/configuration.nix
        inputs.home-manager.nixosModules.home-manager
      ];

    };
  };
}
