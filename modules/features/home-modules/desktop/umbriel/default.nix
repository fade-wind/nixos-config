{ inputs, config, lib, ... }:
{
  imports = [ inputs.umbriel.homeModules.default ];
  programs.umbriel = {
    enable = true;
  };
  home.file.".config/umbriel/config.toml".source = 
    config.lib.file.mkOutOfStoreSymlink
    "/home/fadewind/nixos-config/modules/features/home-modules/desktop/umbriel/config.toml";
}