
{ config, lib, pkgs, inputs, ... }:

{
  imports =[ 
    ./hardware-configuration.nix
    ./root-modules/starship-root.nix
    inputs.noctalia.nixosModules.default
    inputs.nur.modules.nixos.default
    inputs.nixos-plymouth.nixosModules.default
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
  # Nix Settings 
  # ---------------------------------------------

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      inputs.nix-cachyos-kernel.overlays.pinned
    ];
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "zpeppler"
      ];
    };
  };

  # ---------------------------------------------
  # Boot Settings 
  # ---------------------------------------------

  boot = {
    plymouth = {
      enable = true;
    };

    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts;
    consoleLogLevel = 3;
    initrd = {
      verbose = false;
      kernelModules = [
        "i915"
      ];
    };

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
      "video=eDP-1:1920x1080@60"
      "loglevel=3"
      "rd.udev.log_level=3"

      "i915.enable_guc=3"
      "i915.force_probe=46a3"
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
    ];

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

    tmp = {
      useTmpfs = true;
      tmpfsSize = "4G";
      cleanOnBoot = true;
    };
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
      windowManager.qtile.enable = true;
      videoDrivers = [ "modesetting" ];
    };

    dbus.enable=true;

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

    displayManager = {
      ly = {
        enable = true;
        x11Support = true;
      };
    };

    libinput.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    noctalia-shell = {
      enable = true;
    };

    power-profiles-daemon.enable = false;
    tuned.enable = true;
    upower.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };

  # ---------------------------------------------
  # Security
  # ---------------------------------------------

  security = {
    polkit.enable = true;
    rtkit.enable = true;

    sudo = {
      wheelNeedsPassword = false; 
      extraConfig = ''
        Defaults pwfeedback
      '';
    };
  };

  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ]; 
    wants = [ "graphical-session.target" ]; 
    after = [ "graphical-session.target" ]; 
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # ---------------------------------------------
  # Locale
  # ---------------------------------------------

  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # ---------------------------------------------
  # Programs
  # ---------------------------------------------

  programs = {
    niri.enable = true;
    zsh.enable = true;
    firefox.enable = true;
  };

  # ---------------------------------------------
  # Users
  # ---------------------------------------------

  users.users.zpeppler= {
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
    packages = with pkgs; [
      tree
    ];
  };

  # ---------------------------------------------
  # System Pacakges
  # ---------------------------------------------

  environment.systemPackages = with pkgs; [
     vim
     wget
     git
     alacritty
     gcc
     curl
     zip
     unzip

     podman-compose
     brave

     cockpit
     cockpit-podman
     cockpit-machines
     virt-viewer

     bibata-cursors
     polkit_gnome
     gnome-disk-utility
     xwayland-satellite
     qt6Packages.qt6ct

     efibootmgr
     gnome-keyring
     xdg-terminal-exec

     tmux
     neovim
     wl-clipboard
     lua5_1
     luarocks
     tree-sitter
     unzip
     fd
     ripgrep
     fzf
     imagemagick
     bat
  ];

  # ---------------------------------------------
  # Fonts
  # ---------------------------------------------

  fonts.packages = with pkgs; [
   nerd-fonts.jetbrains-mono
  ];

  # ---------------------------------------------
  # System version
  # ---------------------------------------------
 
  system.stateVersion = "26.05"; 

}
