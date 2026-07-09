{
  description = "NixOS with Niri WM and Noctalia Shell";
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
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
    nixos-plymouth.url = "github:BeatLink/nixos-plymouth";
    nur.url = "github:nix-community/NUR";
    tmux-nerd-font-window-name.url = "github:joshmedeski/tmux-nerd-font-window-name";
    # Custom flakes from me
    myNixvim.url = "github:zpeppler/nixvim";
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  outputs =
    inputs:
    let
      vars = import ./vars.nix;
    in
    {
      nixosConfigurations.${vars.hostname} = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs vars; };
        modules = [
          inputs.disko.nixosModules.disko
          inputs.preservation.nixosModules.default
          ./modules/hosts/nixos-lptp/configuration.nix
          ./modules/features/configuration/preservation.nix
          ./modules/hosts/nixos-lptp/disko.nix
          inputs.nix-ld.nixosModules.nix-ld
          inputs.home-manager.nixosModules.home-manager
        ];
      };
    };
}
