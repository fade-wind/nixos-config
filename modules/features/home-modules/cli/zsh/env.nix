{ pkgs, ... }:

{
  programs.zsh.sessionVariables = {
    STARSHIP_CONFIG = "/etc/starship-root.toml";
    MANPAGER="${pkgs.bat}/bin/bat -l man -p";
  };
}
