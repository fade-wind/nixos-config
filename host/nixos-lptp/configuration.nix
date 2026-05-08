
{ config, lib, pkgs, inputs, ... }:

{
  imports =[ 
    ./hardware-configuration.nix
    ../../common-modules/root-modules/starship-root.nix
    inputs.nixos-plymouth.nixosModules.default
    inputs.noctalia.nixosModules.default
    inputs.nur.modules.nixos.default
    inputs.monique.nixosModules.default
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
      videoDrivers = [ "modesetting" ];
    };

    dbus.enable=true;

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

    greetd.enable = true;
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
    monique.enable = true;
    niri.enable = true;
    zsh.enable = true;
    
    regreet = {
      enable = true;
      settings = {
        GTK = {
          application_prefer_dark_theme = true;
          cursor_theme_name = "Bibata-Modern-Ice";
        };
        background = {
          path = "/etc/regreet/Amaurot_Wallpaper.jpg";
          fit = "Cover";
        };
      };
      cursorTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };
      font.name = "JetBrainsMono Nerd Font";
      font.size = 16;
    };
  };

  environment.etc."regreet/Amaurot_Wallpaper.jpg".source = ../../config/assets/wallpapers/Amaurot_Wallpaper.jpg;

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
    gnumake
    libtool
    curl
    zip
    unzip
    coreutils
    clang
    cmake
    sshfs
    uv

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
    app2unit

    efibootmgr
    gnome-keyring
    xdg-terminal-exec

    kubectl
    tmux
    sesh
    television
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
    jq
    yq
    nodejs
  ];

  # ---------------------------------------------
  # Fonts
  # ---------------------------------------------

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only 
  ];

  # ---------------------------------------------
  # System version
  # ---------------------------------------------
 
  system.stateVersion = "26.05"; 

}
