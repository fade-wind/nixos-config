{
  username = "fadewind";
  hostname = "nixos-lptp";
  stateVersion = "26.11";
  system = "x86_64-linux";

  git = {
    name = "Fadewind";
    email = "jamz.p14@gmail.com";
  };

  default = {
    browser = "qutebrowser";
    terminal = "kitty";
  };
}
