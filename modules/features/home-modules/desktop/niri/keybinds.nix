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
      hotkey-overlay.title = "Open Terminal: foot";
      action = spawn "footclient";
    };
    "Mod+Y" = {
      hotkey-overlay.title = "Open Yazi";
      action = spawn "footclient" "-e" "yazi";
    };
    "Mod+N" = {
      hotkey-overlay.title = "Open Neovide";
      action = spawn "app2unit" "--" "neovide";
    };
    "Mod+E" = {
      hotkey-overlay.title = "Open Emacs";
      action = spawn-sh "emacsclient -c";
    };
    "Mod+B" = {
      hotkey-overlay.title = "Open Qutebrowser";
      action = spawn "app2unit" "--" "qutebrowser";
    };
    "Mod+Shift+R" = {
      hotkey-overlay.title = "Refresh Noctalia-Shell";
      action = spawn-sh "noctalia-shell kill && noctalia-shell";
    };
    "Mod+Shift+B" = {
      hotkey-overlay.title = "Open Brave Browser";
      action = spawn "app2unit" "--" "brave";
    };
    "Mod+Space" = {
      hotkey-overlay.title = "Open Noctalia Launcher";
      action = spawn-sh "noctalia msg panel-toggle launcher";
    };
    "Mod+Shift+Space" = {
      hotkey-overlay.title = "Open Noctalia Control Center";
      action = spawn-sh "noctalia msg panel-toggle control-center";
    };
    "Mod+Ctrl+Space" = {
      hotkey-overlay.title = "Open Noctalia Settings";
      action = spawn-sh "noctalia msg settings-toggle";
    };
    "Mod+Alt+L" = {
      hotkey-overlay.title = "Lock the Screen";
      action = spawn-sh "noctalia msg session lock";
    };
    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action = spawn-sh "noctalia msg volume-up";
    };
    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action = spawn-sh "noctalia msg volume-down";
    };
    "XF86AudioMute" = {
      allow-when-locked = true;
      action = spawn-sh "noctalia msg volume-mute";
    };
    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action = spawn-sh "noctalia msg mic-mute";
    };
    "XF86AudioPlay" = {
      allow-when-locked = true;
      action = spawn-sh "playerctl play-pause";
    };
    "XF86AudioStop" = {
      allow-when-locked = true;
      action = spawn-sh "playerctl stop";
    };
    "XF86AudioPrev" = {
      allow-when-locked = true;
      action = spawn-sh "playerctl previous";
    };
    "XF86AudioNext" = {
      allow-when-locked = true;
      action = spawn-sh "playerctl next";
    };
    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action = spawn-sh "noctalia msg brightness-up";
    };
    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action = spawn-sh "noctalia msg brightness-down";
    };
    "Mod+O" = {
      repeat = false;
      action = toggle-overview;
    };
    "Mod+Q" = {
      repeat = false;
      action = close-window;
    };
    "Mod+Left".action = focus-column-left;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;
    "Mod+Right".action = focus-column-right;
    "Mod+H".action = focus-column-left;
    "Mod+J".action = focus-window-down;
    "Mod+K".action = focus-window-up;
    "Mod+L".action = focus-column-right;

    "Mod+Ctrl+Left".action = move-column-left;
    "Mod+Ctrl+Down".action = move-window-down;
    "Mod+Ctrl+Up".action = move-window-up;
    "Mod+Ctrl+Right".action = move-column-right;
    "Mod+Ctrl+H".action = move-column-left;
    "Mod+Ctrl+J".action = move-window-down;
    "Mod+Ctrl+K".action = move-window-up;
    "Mod+Ctrl+L".action = move-column-right;
    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;
    "Mod+Ctrl+Home".action = move-column-to-first;
    "Mod+Ctrl+End".action = move-column-to-last;
    "Mod+Shift+Left".action = focus-monitor-left;
    "Mod+Shift+Down".action = focus-monitor-down;
    "Mod+Shift+Up".action = focus-monitor-up;
    "Mod+Shift+Right".action = focus-monitor-right;
    "Mod+Shift+H".action = focus-monitor-left;
    "Mod+Shift+J".action = focus-monitor-down;
    "Mod+Shift+K".action = focus-monitor-up;
    "Mod+Shift+L".action = focus-monitor-right;
    "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
    "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
    "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
    "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;
    "Mod+Page_Down".action = focus-workspace-down;
    "Mod+Page_Up".action = focus-workspace-up;
    "Mod+U".action = focus-workspace-down;
    "Mod+I".action = focus-workspace-up;
    "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
    "Mod+Ctrl+Page_Up".action = move-column-to-workspace-up;
    "Mod+Ctrl+U".action = move-column-to-workspace-down;
    "Mod+Ctrl+I".action = move-column-to-workspace-up;
    "Mod+Shift+Page_Down".action = move-workspace-down;
    "Mod+Shift+Page_Up".action = move-workspace-up;
    "Mod+Shift+U".action = move-workspace-down;
    "Mod+Shift+I".action = move-workspace-up;
  };
}
