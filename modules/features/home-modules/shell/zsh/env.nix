{ pkgs, ... }:

{
  programs.zsh.sessionVariables = {
    MANPAGER="${pkgs.bat}/bin/bat -l man -p";
  };
}
