{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12.5;
    };
    extraConfig = ''
      include themes/noctalia.conf
    '';
  };
}
