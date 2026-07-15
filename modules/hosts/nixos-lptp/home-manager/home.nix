{
  config,
  pkgs,
  inputs,
  vars,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/Projects/nixos-config/modules/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    assets = "assets";
    kitty = "kitty";
    qutebrowser = "qutebrowser";
  };
in

{
  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";
  home.stateVersion = vars.stateVersion;

  imports = [
    ../../../features/home-modules/shell
    ../../../features/home-modules/desktop
  ];

  home.packages = with pkgs; [
    # Apps
    kitty
    qutebrowser
    neovide
    papirus-icon-theme
    qt6Packages.qt6ct
    gimp
  ];

  home.sessionVariables = {
    BROWSER = "qutebrowser";
    QTA_QPA_PLATFORM = "wayland";
    QTA_QPA_PLATFORMTHEME = "qt6ct";
    QT_ICON_THEME = "Papirus";
    GTK_USE_PORTAL = "1";
  };

  home.pointerCursor = {
    enable = true;
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
          name = vars.git.name;
          email = vars.git.email;
        };
      };
    };

    noctalia.enable = true;
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
