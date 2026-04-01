{ configs, pkgs, lib, ... }: 
{
  programs.yazi = {
    enable = true;
    plugins = {
      inherit (pkgs.yaziPlugins) chmod git full-border githead yatline yatline-githead mount;
    };
    initLua = ./submodules/yazi/init.lua;
    keymap = lib.importTOML ./submodules/yazi/keymap.toml;
    theme = lib.importTOML ./submodules/yazi/theme.toml;
    settings = {
      yazi = lib.importTOML ./submodules/yazi/settings.toml;
    };
  };
}
