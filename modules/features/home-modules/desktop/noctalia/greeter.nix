{ pkgs, ...}:
{
  programs.noctalia-greeter = { 
    enable = true;
    settings = {
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 24;
        path = "${pkgs.bibata-cursors}/share/icons";
      };
      session.default = "Niri";
    };
  };
}