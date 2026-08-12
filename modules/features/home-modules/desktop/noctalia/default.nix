{ inputs, pkgs, ... }:
{
  home.file.".config/noctalia/config.toml".source = ./config.toml;
}
