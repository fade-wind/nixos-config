{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ../../features/configuration
    ../../features/configuration/fonts.nix
    ../../features/home-modules/shell/starship.nix
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

  # ---------------------------------------------
  # Network Settings
  # ---------------------------------------------

  networking.hostName = "nixos-wsl";

  # ---------------------------------------------
  # Services
  # ---------------------------------------------

  services = {
    dbus.enable = true;

    gnome = {
      gnome-keyring.enable = true;
    };

    cockpit = {
      enable = true;
      port = 9090;
      plugins = with pkgs; [
        cockpit-podman
        cockpit-machines
      ];
      settings = {
        WebService = {
          AllowUnencrypted = true;
        };
      };
    };

    openssh.enable = true;
  };

  # ---------------------------------------------
  # Programs
  # ---------------------------------------------

  programs = {
    zsh.enable = true;
  };

  environment.systemPackages = with pkgs; [
    powershell
  ];

  # ---------------------------------------------
  # Users
  # ---------------------------------------------

  users.users.zpeppler = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "podman"
      "storage"
    ];
  };

  # ---------------------------------------------
  # WSL Settings
  # ---------------------------------------------

  wsl = {
    enable = true;
    defaultUser = "zpeppler";
    wslConf.boot.command = "mount --make-rshard /";
  };

  # ---------------------------------------------
  # System version
  # ---------------------------------------------

  system.stateVersion = "26.05";

}

