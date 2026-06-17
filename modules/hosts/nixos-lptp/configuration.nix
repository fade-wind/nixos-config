{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../features/configuration
    ../../features/configuration/fonts.nix
    ../../features/home-modules/shell/starship.nix
    inputs.nixos-plymouth.nixosModules.default
    inputs.nur.modules.nixos.default
    inputs.noctalia-greeter.nixosModules.default
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
  # Boot Settings
  # ---------------------------------------------

  boot = {
    plymouth = {
      enable = true;
    };

    loader = {
      grub = rec {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 3;
        extraEntriesBeforeNixOS = true;
      };
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  # ---------------------------------------------
  # Network Settings
  # ---------------------------------------------

  networking = {
    hostName = "nixos-lptp";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [
      22
      9090
    ];
    firewall.allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
    firewall.allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      }
    ];
  };

  # ---------------------------------------------
  # Hardware Settings
  # ---------------------------------------------

  hardware = {
    bluetooth.enable = true;
    cpu.intel.updateMicrocode = true;

    enableRedistributableFirmware = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # ---------------------------------------------
  # Services
  # ---------------------------------------------

  services = {
    xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      videoDrivers = [ "modesetting" ];
    };

    dbus.enable = true;

    emacs.enable = true;

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

    pcscd = {
      enable = true;
      plugins = [ pkgs.ccid ];
    };

    libinput.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    openssh.enable = true;

    power-profiles-daemon.enable = false;
    tuned.enable = true;
    upower.enable = true;
    seatd.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  # ---------------------------------------------
  # Programs
  # ---------------------------------------------
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override {
        extraArgs = "-cef-disable-gpu-compositing";
      };
    })
  ];

  programs = {
    zsh.enable = true;
    noctalia-greeter.enable = true;

    steam = {
      enable = true;
      protontricks.enable = true;
    };

  };

  # ---------------------------------------------
  # Users
  # ---------------------------------------------

  users.mutableUsers = false;
  users.users.zpeppler = {
    hashedPasswordFile = "/persistent/passwd";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "audio"
      "networkmanager"
      "podman"
      "video"
      "storage"
    ];
  };

  # ---------------------------------------------
  # System Pacakges
  # ---------------------------------------------

  environment.systemPackages = with pkgs; [
    brave

    cockpit-machines
    virt-viewer

    bibata-cursors
    # polkit_gnome
    gnome-disk-utility
    xwayland-satellite
    qt6Packages.qt6ct
    app2unit

    efibootmgr
    xdg-terminal-exec

    yubioath-flutter
    yubikey-manager
  ];

  systemd.services.systemd-machine-id-commit.enable = false;

  # ---------------------------------------------
  # System version
  # ---------------------------------------------

  system.stateVersion = "26.05";

}

