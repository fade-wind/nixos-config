{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia = {
    enable = true;
    settings = {
      bar.default = {
        border = "surface";
        capsule = true;
        center = [
          "audio_visualizer"
          "clock"
        ];
        end = [
          "tray"
          "notifications"
          "clipboard"
          "network"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "control-center"
          "session"
        ];
        margin_edge = 4.0;
        margin_ends = 4.0;
        start = [
          "launcher"
          "workspaces"
          "active_window"
        ];
      };

      desktop_widgets = {
        schema_version = 1;
        widget_order = [
          "desktop-widget-0000000000000001"
          "desktop-widget-0000000000000002"
          "desktop-widget-0000000000000003"
          "desktop-widget-0000000000000004"
          "desktop-widget-0000000000000005"
        ];

        grid = {
          cell_size = 32;
          major_interval = 4;
          visible = true;
        };

        widget = {
          desktop-widget-0000000000000001 = {
            cx = 1775.64501953125;
            cy = 572.0;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.2839454412460327;
            type = "sysmon";

            settings = {
              stat = "cpu_usage";
              stat2 = "";
            };
          };

          desktop-widget-0000000000000002 = {
            cx = 1776.0;
            cy = 410.08001708984375;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.2799999713897705;
            type = "sysmon";

            settings = {
              color = "secondary";
              stat = "ram_pct";
            };
          };

          desktop-widget-0000000000000003 = {
            cx = 1776.13525390625;
            cy = 246.506103515625;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.2784979343414307;
            type = "sysmon";

            settings = {
              color = "primary";
              color2 = "tertiary";
              stat = "net_rx";
              stat2 = "net_tx";
            };
          };

          desktop-widget-0000000000000004 = {
            cx = 191.81394958496094;
            cy = 142.08000183105469;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.7799999713897705;
            type = "weather";
          };

          desktop-widget-0000000000000005 = {
            cx = 192.00001525878906;
            cy = 320.85769653320312;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.3813954591751099;
            type = "media_player";
          };
        };
      };

      dock = {
        active_monitor_only = true;
        auto_hide = true;
        enabled = true;
        pinned = [
          "Vesktop"
          "Steam"
          "Neovide"
        ];
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "suspend"
        ];
        pre_action_fade_seconds = 0.0;

        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };

          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
          };

          suspend = {
            action = "suspend";
            enabled = true;
            lock_before_suspend = true;
            timeout = 900;
          };
        };
      };

      location.auto_locate = true;

      shell = {
        avatar_path = "${config.home.homeDirectory}/assets/profile-pic/blu.jpg";
        font_family = "JetBrainsMono NF";
        launch_apps_as_systemd_services = true;
        niri_overview_type_to_launch_enabled = true;
        polkit_agent = true;
        settings_show_advanced = true;
        telemetry_enabled = false;
        time_format = "{:%-I:%M %p}";
        screenshot.freeze_screen = true;
      };

      theme = {
        source = "wallpaper";
        wallpaper_scheme = "vibrant";

        templates = {
          builtin_ids = [
            "btop"
            "foot"
            "kitty"
            "qt"
          ];
          community_ids = [
            "discord"
          ];
        };
      };

      wallpaper = {
        directory = "${config.home.homeDirectory}/assets/wallpapers";
        fill_mode = "center";

        default.path = "${config.home.homeDirectory}/assets/wallpapers/Amaurot_Wallpaper.jpg";
        last.path = "${config.home.homeDirectory}/assets/wallpapers/Amaurot_Wallpaper.jpg";
      };

      weather = {
        auto_locate = true;
        unit = "imperial";
      };

      widget = {
        active_window.title_scroll = "on_hover";
        clock.format = "{:%-I:%M %p}";
        launcher.glyph = "apps-filled";
        media.hide_when_no_media = true;
        network.show_label = false;
        workspaces.empty_color = "tertiary";
      };
    };
  };
}

