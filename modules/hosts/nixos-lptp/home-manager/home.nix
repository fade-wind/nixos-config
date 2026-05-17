{
  config,
  pkgs,
  inputs,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/Projects/nixos-dotfiles/modules/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    assets = "assets";
    kitty = "kitty";
    mango = "mango";
    niri = "niri";
    nvim = "nvim";
    qutebrowser = "qutebrowser";
  };
in

{
  home.username = "zpeppler";
  home.homeDirectory = "/home/zpeppler";
  home.stateVersion = "26.05";

  imports = [
    ../../../features/home-modules/atuin.nix
    ../../../features/home-modules/btop.nix
    ../../../features/home-modules/default.nix
    ../../../features/home-modules/eza.nix
    ../../../features/home-modules/fzf.nix
    ../../../features/home-modules/foot.nix
    ../../../features/home-modules/lazygit/default.nix
    ../../../features/home-modules/noctalia.nix
    ../../../features/home-modules/television/default.nix
    ../../../features/home-modules/tmux/default.nix
    ../../../features/home-modules/vesktop.nix
    ../../../features/home-modules/vim.nix
    ../../../features/home-modules/xdg/default.nix
    ../../../features/home-modules/xdg/desktop.nix
    ../../../features/home-modules/yazi/default.nix
    ../../../features/home-modules/zsh/default.nix
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    # Apps
    kitty
    qutebrowser
    neovide
    papirus-icon-theme
    qt6Packages.qt6ct
  ];

  home.sessionVariables = {
    BROWSER = "qutebrowser";
    QTA_QPA_PLATFORM= "wayland";
    QTA_QPA_PLATFORMTHEME = "qt6ct";
    QT_ICON_THEME = "Papirus";
    GTK_USE_PORTAL = "1";
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
  };

  programs = {
    emacs.enable = true;

    git = {
      enable = true;
      settings = {
        user = {
          name = "ZPeppler";
          email = "peppler.zachary@gmail.com";
        };
      };
    };
    
    vscode = {
      enable = true;
    };
  };

  services = {
    kdeconnect.enable = true;
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
  
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
  };

}
