{ pkgs, ... }:{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "~/.config/foot/themes/noctalia";
        font = "JetBrainsMono Nerd Font:pixelsize=16";
        dpi-aware = "yes";
        pad = "4x4x0x0";
      };
    
      colors-dark = {
        alpha = "0.9";
      };

      cursor = {
        style = "beam";
        blink = "yes";
      };
    };
  };

  systemd.user.services.foot-server = {
    Unit = {
      Description = "Foot terminal daemon";
    };

    Service = {
      ExecStart = "${pkgs.foot}/bin/foot --server";
      Restart = "always";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
