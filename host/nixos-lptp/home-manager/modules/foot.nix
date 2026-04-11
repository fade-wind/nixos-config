{ pkgs, ... }:{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "~/.config/foot/themes/noctalia";
        font = "JetBrainsMono Nerd Font:size=8.5";
        dpi-aware = "yes";
        pad = "2x2";
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
