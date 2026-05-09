
{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../../features/starship.nix
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
  # Network Settings 
  # ---------------------------------------------

  networking.hostName = "nixos-wsl";
  
  # ---------------------------------------------
  # Services 
  # ---------------------------------------------

  services = {
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

    openssh.enable = true;
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
    zsh.enable = true;
  };

  # ---------------------------------------------
  # Users
  # ---------------------------------------------

  users.users.zpeppler= {
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
  # System Pacakges
  # ---------------------------------------------

  environment.systemPackages = with pkgs; [
     vim
     wget
     git
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
     cifs-utils

     podman-compose

     cockpit
     cockpit-podman
     
     gnome-keyring

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
