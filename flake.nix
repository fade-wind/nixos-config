{
  description = "NixOS with Niri WM, Noctalia-Shell, and custom CachyOS kernel";
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

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nirimod.url = "github:srinivasr/nirimod";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixos-plymouth.url = "github:BeatLink/nixos-plymouth";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    nur.url = "github:nix-community/NUR";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs@{ self, nixpkgs, nixos-wsl, nirimod, ... }: 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos-lptp = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs system; };
      modules = [
        ./host/nixos-lptp/configuration.nix
        inputs.nix-ld.nixosModules.nix-ld
        inputs.home-manager.nixosModules.home-manager
        { programs.nix-ld.dev.enable = true; }
      ];
    };
    nixosConfigurations.nixos-wsl = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs system; };
      modules = [
        ./host/nixos-wsl/configuration.nix
        inputs.nix-ld.nixosModules.nix-ld
        inputs.home-manager.nixosModules.home-manager
        nixos-wsl.nixosModules.default {
          system.stateVersion = "26.05";
          wsl.enable = true;
        }
        { programs.nix-ld.dev.enable = true; }
      ];
    };
  };
}
