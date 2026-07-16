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
        capsule_padding = 8.0;
        capsule_thickness = 0.86;
        center = [
          "audio_visualizer"
          "clock"
          "notes"
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
          "desktop-widget-0000000000000006"
        ];

        grid = {
          cell_size = 32;
          major_interval = 4;
          visible = true;
        };

        widget = {
          desktop-widget-0000000000000001 = {
            box_height = 163.98719787597656;
            box_width = 257.11016845703125;
            cx = 1774.66455078125;
            cy = 479.8135986328125;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.2839454412460327;
            type = "sysmon";

            settings = {
              display = "graph";
              gauge_layout = "horizontal";
              stat = "cpu_usage";
              stat2 = "cpu_temp";
            };
          };

          desktop-widget-0000000000000002 = {
            box_height = 163.63998413085938;
            box_width = 256.39999389648438;
            cx = 1775.0196533203125;
            cy = 316.0;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.2799999713897705;
            type = "sysmon";

            settings = {
              color = "secondary";
              display = "graph";
              gauge_layout = "horizontal";
              stat = "ram_pct";
              stat2 = "swap_pct";
            };
          };

          desktop-widget-0000000000000003 = {
            box_height = 163.5078125;
            box_width = 256.129638671875;
            cx = 1775.15478515625;
            cy = 152.25250244140625;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.2784979343414309;
            ype = "sysmon";

            settings = {
              display = "graph";
              network_speed_compact = false;
              stat = "net_rx";
              stat2 = "net_tx";
            };
          };

          desktop-widget-0000000000000004 = {
            box_height = 164.16000366210938;
            box_width = 356.39999389648438;
            cx = 191.81394958496094;
            cy = 142.08000183105469;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.7799999713897705;
            type = "weather";
          };

          desktop-widget-0000000000000005 = {
            box_height = 256.0;
            box_width = 352.0;
            cx = 189.61395263671875;
            cy = 362.00640869140625;
            output = "eDP-1";
            rotation = 0.0;
            scale = 1.3813954591751101;
            type = "media_player";

            settings.layout = "vertical";
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
        reserve_space = false;
        show_dots = true;
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
      lockscreen_widgets = {
        enabled = true;
        schema_version = 2;
        widget_order = [
          "lockscreen-login-box@eDP-1"
          "lockscreen-widget-0000000000000001"
          "lockscreen-widget-0000000000000002"
        ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget = {
          "lockscreen-login-box@eDP-1" = {
            box_height = 0.0;
            box_width = 0.0;
            cx = 960.0;
            cy = 957.0;
            output = "eDP-1";
            rotation = 0.0;
            type = "login_box";
          };

          lockscreen-widget-0000000000000001 = {
            box_height = 160.0;
            box_width = 448.0;
            cx = 240.0;
            cy = 92.0;
            output = "eDP-1";
            rotation = 0.0;
            type = "clock";

            settings = {
              background = false;
              clock_style = "digital";
              color = "on_surface";
              font_family = "JetBrainsMono Nerd Font";
              format = "{:%-I:%M %p}";
            };
          };

          lockscreen-widget-0000000000000002 = {
            box_height = 192.0;
            box_width = 432.0;
            cx = 240.0;
            cy = 284.0;
            output = "eDP-1";
            rotation = 0.0;
            type = "weather";

            settings = {
              background = false;
              shadow = true;
            };
          };
        };
      };

      osd = {
        position = "top_right";
      };

      plugin_settings = {
        "noctalia/notes" = {
          notes_dir = "${config.home.homeDirectory}/Documents/Notes";
          panel_open_near_click = true;
          panel_placement = "floating";
        };
      };

      plugins.enabled = [ "noctalia/notes" ];

      shell = {
        avatar_path = "${config.home.homeDirectory}/.config/assets/profile-pic/blu.jpg";
        external_ip_enabled = true;
        font_family = "JetBrainsMono NF";
        greeter_sync.auto_sync = true;
        launch_apps_as_systemd_services = true;
        niri_overview_type_to_launch_enabled = true;
        polkit_agent = true;
        settings_show_advanced = true;
        telemetry_enabled = false;
        time_format = "{:%-I:%M %p}";
        screenshot.freeze_screen = true;

        panel = {
          clipboard_placement = "attached";
          launcher_placement = "attached";
          open_near_click_clipboard = true;
          open_near_click_launcer = true;
          open_near_click_wallpaper = true;
        };
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
        directory = "${config.home.homeDirectory}/.config/assets/wallpapers";
        fill_mode = "center";

        default.path = "${config.home.homeDirectory}/.config/assets/wallpapers/Amaurot_Wallpaper.jpg";
        last.path = "${config.home.homeDirectory}/.config/assets/wallpapers/Amaurot_Wallpaper.jpg";
      };

      weather = {
        auto_locate = true;
        unit = "imperial";
      };

      widget = {
        active_window.title_scroll = "on_hover";
        clock.format = "{:%-I:%M %p}";
        launcher.custom_image = "/run/current-system/sw/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        media.hide_when_no_media = true;
        network.show_label = false;
        workspaces.empty_color = "tertiary";
      };
    };
  };
}
