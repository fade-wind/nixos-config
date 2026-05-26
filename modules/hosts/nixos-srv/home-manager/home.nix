{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "zpeppler";
  home.homeDirectory = "/home/zpeppler";
  home.stateVersion = "26.05";

  imports = [
    ../../../features/home-modules
  ];

  home.packages = with pkgs; [
    dconf
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "ZPeppler";
          email = "peppler.zachary@gmail.com";
        };
      };
    };
  };
}

