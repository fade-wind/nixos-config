{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../features/configuration/locale.nix
    ../../features/configuration/nix.nix
    ../../features/configuration/podman.nix
    ../../features/configuration/security.nix
    ../../features/configuration/packages/default.nix
    ../../features/home-modules/starship.nix
  ];
  
  # ---------------------------------------------
  # Home Manager 
  # ---------------------------------------------

  home-manager = {
    backupFileExtension = "hm-backup";
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.zpeppler = import ./home-manager/home.nix;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos-srv"; # Define your hostname.

  networking.networkmanager.enable = true;
  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  users.mutableUsers = false;
  users.users.zpeppler = {
    hashedPasswordFile = "/persistent/passwd";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };


  programs = {
    zsh.enable = true;
  };

  services.openssh.enable = true;

  systemd.services.systemd-machine-id-commit.enable = false;

  system.stateVersion = "26.05"; # Did you read the comment?

}

