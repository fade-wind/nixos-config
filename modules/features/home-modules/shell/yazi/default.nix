{
  configs,
  pkgs,
  lib,
  ...
}:
{
  programs.yazi = {
    enable = true;
    plugins = {
      inherit (pkgs.yaziPlugins)
        chmod
        git
        full-border
        githead
        mount
        ;
    };
    initLua = ./init.lua;
    keymap = lib.importTOML ./keymap.toml;
    settings = {
      yazi = lib.importTOML ./settings.toml;
    };
    flavors = {
      gruvbox-material = ./flavors/gruvbox-material;
    };
    theme.flavor.dark = "gruvbox-material";
  };
}
