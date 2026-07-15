{
  config,
  pkgs,
  inputs,
  vars,
  lib,
  ...
}:
let
  inherit (config.lib.niri.actions) spawn;
  inherit (config.lib.niri.actions) spawn-sh;
in
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Shift+Slash".action = show-hotkey-overlay;

    "Mod+T" = {
      hotkey-overlay-title = "Open Terminal: foot";
      action = spawn "footclient";
    };
    "Mod+Y" = {
      hotkey-overlay-title = "Open Yazi";
      action = spawn "footclient" "-e" "yazi";
    };
    "Mod+N" = {
      hotkey-overlay-title = "Open Neovide";
      action = spawn "app2unit" "--" "neovide";
    };
    "Mod+E" = {
      hotkey-overlay-title = "Open Emacs";
      action = spawn-sh "emacsclient -c";
    };
    "Mod+B" = {
      hotkey-overlay-title = "Open Qutebrowser";
      action = spawn "app2unit" "--" "qutebrowser";
    };
    "Mod+Shift+R" = {
      hotkey-overlay-title = "Refresh Noctalia-Shell";
      action = spawn-sh "noctalia-shell kill && noctalia-shell";
    };
    "Mod+Shift+B" = {
      hotkey-overlay-title = "Open Brave Browser";
      action = spawn "app2unit" "--" "brave";
    };
    "Mod+Space" = {
      hotkey-overlay-title = "Open Noctalia Launcher";
      action = spawn-sh "noctalia msg panel-toggle launcher";
    };
    "Mod+Shift+Space" = {
      hotkey-overlay-title = "Open Noctalia Control Center";
      action = spawn-sh "noctalia msg panel-toggle control-center";
    };
    "Mod+Ctrl+Space" = {
      hotkey-overlay-title = "Open Noctalia Settings";
      action = spawn-sh "noctalia msg settings-toggle";
    };
    "Mod+Alt+L" = {
      hotkey-overlay-title = "Lock the Screen";
      action = spawn-sh "noctalia msg session lock";
    };
  };
}
