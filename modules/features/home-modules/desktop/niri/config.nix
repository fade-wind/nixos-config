{
  lib,
  pkgs,
  vars,
  ...
}:
let
  term = "${pkgs.${vars.default.terminal}}/bin/${vars.default.terminal}";
in
{
  xdg.configFile."niri/config.kdl".source = pkgs.writeText "niri-config.kdl" ''
    input {
        keyboard {
            xkb {
                layout "us"
                model ""
                rules ""
                variant ""
            }
            repeat-delay 600
            repeat-rate 25
            track-layout "global"
            numlock
        }
        touchpad {
            tap
            natural-scroll
        }
        focus-follows-mouse
        workspace-auto-back-and-forth
    }
    output "eDP-1" {
        scale 1.000000
        transform "normal"
        position x=0 y=0
        mode "1920x1080@120.030000"
    }
    screenshot-path null
    prefer-no-csd
    layout {
        gaps 9
        struts {
            left 0
            right 0
            top 0
            bottom 0
        }
        background-color "transparent"
        default-column-width { proportion 0.500000; }
        preset-column-widths {
            proportion 0.500000
            proportion 0.666670
            proportion 1.000000
        }
        center-focused-column "on-overflow"
        always-center-single-column
    }
    cursor {
        xcursor-theme "Bibata-Modern-Ice"
        xcursor-size 24
    }
    hotkey-overlay { skip-at-startup; }
    environment {
        "EDITOR" "nvim"
        "ELECTRON_OZONE_PLATFORM_HINT" "x11"
        "QT_QPA_PLATFORM" "wayland"
        "QT_QPA_PLATFORMTHEME" "gtk3"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION" "1"
        "XCURSOR_SIZE" "24"
        "XCURSOR_THEME" "Bibata-Modern-Ice"
        "XDG_CURRENT_DESKTOP" "niri"
        "XDG_SESSION_TYPE" "wayland"
    }
    binds {
        Ctrl+Alt+Delete { quit; }
        Ctrl+Print { spawn-sh "noctalia msg screenshot-fullscreen"; }
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Alt+L hotkey-overlay-title="Lock the Screen" { spawn-sh "noctalia msg session lock"; }
        Mod+B hotkey-overlay-title="Open zen-beta" { spawn "zen-beta"; }
        Mod+BracketLeft { consume-or-expel-window-left; }
        Mod+BracketRight { consume-or-expel-window-right; }
        Mod+C { center-column; }
        Mod+Comma { consume-window-into-column; }
        Mod+Ctrl+C { center-visible-columns; }
        Mod+Ctrl+Down { move-window-down; }
        Mod+Ctrl+End { move-column-to-last; }
        Mod+Ctrl+F { expand-column-to-available-width; }
        Mod+Ctrl+H { move-column-left; }
        Mod+Ctrl+Home { move-column-to-first; }
        Mod+Ctrl+I { move-column-to-workspace-up; }
        Mod+Ctrl+J { move-window-down; }
        Mod+Ctrl+K { move-window-up; }
        Mod+Ctrl+L { move-column-right; }
        Mod+Ctrl+Left { move-column-left; }
        "Mod+Ctrl+Page_Down" { move-column-to-workspace-down; }
        "Mod+Ctrl+Page_Up" { move-column-to-workspace-up; }
        Mod+Ctrl+R { reset-window-height; }
        Mod+Ctrl+Right { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
        Mod+Ctrl+Shift+WheelScrollUp { move-column-left; }
        Mod+Ctrl+Space hotkey-overlay-title="Open Noctalia Settings" { spawn-sh "noctalia msg settings-toggle"; }
        Mod+Ctrl+U { move-column-to-workspace-down; }
        Mod+Ctrl+Up { move-window-up; }
        Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
        Mod+Ctrl+WheelScrollLeft { move-column-left; }
        Mod+Ctrl+WheelScrollRight { move-column-right; }
        Mod+Ctrl+WheelScrollUp cooldown-ms=150 { move-column-to-workspace-up; }
        Mod+Down { focus-window-down; }
        Mod+E hotkey-overlay-title="Open Emacs" { spawn-sh "emacsclient -c"; }
        Mod+End { focus-column-last; }
        Mod+Equal { set-column-width "+10%"; }
        Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
        Mod+F { maximize-column; }
        Mod+H { focus-column-left; }
        Mod+Home { focus-column-first; }
        Mod+I { focus-workspace-up; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }
        Mod+Left { focus-column-left; }
        Mod+Minus { set-column-width "-10%"; }
        Mod+N hotkey-overlay-title="Open Neovide" { spawn "app2unit" "--" "neovide"; }
        Mod+O repeat=false { toggle-overview; }
        "Mod+Page_Down" { focus-workspace-down; }
        "Mod+Page_Up" { focus-workspace-up; }
        Mod+Period { expel-window-from-column; }
        Mod+Q repeat=false { close-window; }
        Mod+R { switch-preset-column-width; }
        Mod+Right { focus-column-right; }
        Mod+Shift+Ctrl+Down { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+H { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+J { move-column-to-monitor-down; }
        Mod+Shift+Ctrl+K { move-column-to-monitor-up; }
        Mod+Shift+Ctrl+L { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+Left { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
        Mod+Shift+Ctrl+Up { move-column-to-monitor-up; }
        Mod+Shift+Down { focus-monitor-down; }
        Mod+Shift+E { quit; }
        Mod+Shift+Equal { set-window-height "+10%"; }
        Mod+Shift+F { fullscreen-window; }
        Mod+Shift+H { focus-monitor-left; }
        Mod+Shift+I { move-workspace-up; }
        Mod+Shift+J { focus-monitor-down; }
        Mod+Shift+K { focus-monitor-up; }
        Mod+Shift+L { focus-monitor-right; }
        Mod+Shift+Left { focus-monitor-left; }
        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+P { power-off-monitors; }
        "Mod+Shift+Page_Down" { move-workspace-down; }
        "Mod+Shift+Page_Up" { move-workspace-up; }
        Mod+Shift+R hotkey-overlay-title="Refresh Noctalia-Shell" { spawn-sh "noctalia msg config-reload"; }
        Mod+Shift+Right { focus-monitor-right; }
        Mod+Shift+Slash { show-hotkey-overlay; }
        Mod+Shift+Space hotkey-overlay-title="Open Noctalia Control Center" { spawn-sh "noctalia msg panel-toggle control-center"; }
        Mod+Shift+U { move-workspace-down; }
        Mod+Shift+Up { focus-monitor-up; }
        Mod+Shift+V { switch-focus-between-floating-and-tiling; }
        Mod+Shift+WheelScrollDown { focus-column-right; }
        Mod+Shift+WheelScrollUp { focus-column-left; }
        Mod+Space hotkey-overlay-title="Open Noctalia Launcher" { spawn-sh "noctalia msg panel-toggle launcher"; }
        Mod+T hotkey-overlay-title="Open Terminal: kitty" { spawn "${term}"; }
        Mod+Tab { focus-workspace-previous; }
        Mod+U { focus-workspace-down; }
        Mod+Up { focus-window-up; }
        Mod+V { toggle-window-floating; }
        Mod+W { toggle-column-tabbed-display; }
        Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
        Mod+WheelScrollLeft { focus-column-left; }
        Mod+WheelScrollRight { focus-column-right; }
        Mod+WheelScrollUp cooldown-ms=150 { focus-workspace-up; }
        Mod+Y hotkey-overlay-title="Open Yazi" { spawn "${term}" "-e" "yazi"; }
        Print { spawn-sh "noctalia msg screenshot-region"; }
        XF86AudioLowerVolume allow-when-locked=true { spawn-sh "noctalia msg volume-down"; }
        XF86AudioMicMute allow-when-locked=true { spawn-sh "noctalia msg mic-mute"; }
        XF86AudioMute allow-when-locked=true { spawn-sh "noctalia msg volume-mute"; }
        XF86AudioNext allow-when-locked=true { spawn-sh "playerctl next"; }
        XF86AudioPlay allow-when-locked=true { spawn-sh "playerctl play-pause"; }
        XF86AudioPrev allow-when-locked=true { spawn-sh "playerctl previous"; }
        XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "noctalia msg volume-up"; }
        XF86AudioStop allow-when-locked=true { spawn-sh "playerctl stop"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn-sh "noctalia msg brightness-down"; }
        XF86MonBrightnessUp allow-when-locked=true { spawn-sh "noctalia msg brightness-up"; }
    }
    spawn-at-startup "xwayland-satellite"
    spawn-at-startup "noctalia"
    spawn-at-startup "wl-paste" "--type" "image" "--watch" "cliphist" "store"
    spawn-at-startup "wl-paste" "--type" "text" "--watch" "cliphist" "store"
    window-rule {
        match app-id="neovide"
        open-maximized true
    }
    window-rule {
        match
        draw-border-with-background false
        geometry-corner-radius 9.000000 9.000000 9.000000 9.000000
        clip-to-geometry true
    }
    layer-rule { match namespace="^noctalia-(main|notifications|dock)$"; }
    layer-rule {
        match namespace="^noctalia-wallpaper"
        place-within-backdrop true
    }
    include optional=true "noctlia.kdl"
  '';
}
