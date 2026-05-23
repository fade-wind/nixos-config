{
  description = "NixOS with Niri WM, Noctalia-Shell, and custom CachyOS kernel";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
    monique.url = "github:ToRvaLDz/monique";
    nixos-plymouth.url = "github:BeatLink/nixos-plymouth";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixvim.url = "github:nix-community/nixvim";
    nur.url = "github:nix-community/NUR";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixos-wsl,
      disko,
      preservation,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos-lptp = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };
        modules = [
          ./modules/hosts/nixos-lptp/configuration.nix
          inputs.nix-ld.nixosModules.nix-ld
          inputs.home-manager.nixosModules.home-manager
          { programs.nix-ld.dev.enable = true; }
        ];
      };
      nixosConfigurations.nixos-wsl = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };
        modules = [
          ./modules/hosts/nixos-wsl/configuration.nix
          inputs.nix-ld.nixosModules.nix-ld
          inputs.home-manager.nixosModules.home-manager
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "26.05";
            wsl.enable = true;
          }
          { programs.nix-ld.dev.enable = true; }
        ];
      };
      nixosConfigurations.nixos-srv = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };
        modules = [
          inputs.disko.nixosModules.disko
          inputs.preservation.nixosModules.default
          ./modules/hosts/nixos-srv/configuration.nix
          ./modules/features/configuration/preservation.nix
          ./modules/hosts/nixos-srv/disko.nix
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}
