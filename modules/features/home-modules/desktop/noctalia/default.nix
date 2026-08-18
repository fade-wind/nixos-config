{ inputs, pkgs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
    ./greeter.nix
  ];
  programs.noctalia.enable = true;
  home.file.".config/noctalia/config.toml".source = ./config.toml;
}
