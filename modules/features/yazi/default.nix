{ configs, pkgs, lib, ... }: 
{
  programs.yazi = {
    enable = true;
    plugins = {
      inherit (pkgs.yaziPlugins) chmod git full-border githead mount;
    };
    initLua = ./init.lua;
    keymap = lib.importTOML ./keymap.toml;
    theme = lib.importTOML ./theme.toml;
    settings = {
      yazi = lib.importTOML ./settings.toml;
    };
  };
}
