{ pkgs, ... }:

{
  xdg = {
    terminal-exec = {
      settings = {
        default = [ "kitty.desktop" ];
      };
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-termfilechooser
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
      config.common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
      };
      config.umbriel.default = "umbriel";
    };

    configFile."xdg-desktop-portal-termfilechooser/config" = {
      force = true;
      executable = true; 
      text = ''
        [filechooser]
        cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
        default_dir=$HOME/Downloads
        env=TERMCMD='kitty --title filechooser'
        env=PATH="$PATH:/run/current-system/sw/bin"
        open_mode=suggested
        save_mode=last
      '';
    };
  };
}

