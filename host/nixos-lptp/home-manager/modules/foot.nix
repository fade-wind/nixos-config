{ pkgs, ... }:{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=8.5";
        dpi-aware = "yes";
        pad = "2x2";
      };

      colors-dark = {
        foreground = "c0caf5";
        background = "24283b";
        selection-foreground = "c0caf5";
        selection-background = "2e3c64";
        urls = "73daca";

        regular0 = "1d202f";
        regular1 = "f7768e";
        regular2 = "9ece6a";
        regular3 = "e0af68";
        regular4 = "7aa2f7";
        regular5 = "bb9af7";
        regular6 = "7dcfff";
        regular7 = "a9b1d6";

        bright0 = "414868";
        bright1 = "f7768e";
        bright2 = "9ece6a";
        bright3 = "e0af68";
        bright4 = "7aa2f7";
        bright5 = "bb9af7";
        bright6 = "7dcfff";
        bright7 = "c0caf5";
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
