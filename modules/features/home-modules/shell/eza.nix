{
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    git = true;
    icons = "auto";
    colors = "always";
    extraOptions = [
      "--header"
      "--color-scale=all"
      "--color-scale-modeg=gradient"
      "--group-directories-first"
      "--short-nix"
    ];

    theme = {
      colourful = true;

      filekinds = {
        normal = {
          foreground = "#d4be98";
        };
        directory = {
          foreground = "#a9b665";
        };
        symlink = {
          foreground = "#7daea3";
        };
        pipe = {
          foreground = "#665c54";
        };
        block_device = {
          foreground = "#d8a657";
        };
        char_device = {
          foreground = "#d8a657";
        };
        socket = {
          foreground = "#665c54";
        };
        special = {
          foreground = "#d3869b";
        };
        executable = {
          foreground = "#a9b665";
        };
        mount_point = {
          foreground = "#89b482";
        };
      };

      perms = {
        user_read = {
          foreground = "#7daea3";
        };
        user_write = {
          foreground = "#d3869b";
        };
        user_execute_file = {
          foreground = "#a9b665";
        };
        user_execute_other = {
          foreground = "#a9b665";
        };
        group_read = {
          foreground = "#7daea3";
        };
        group_write = {
          foreground = "#e78a4e";
        };
        group_execute = {
          foreground = "#a9b665";
        };
        other_read = {
          foreground = "#7daea3";
        };
        other_write = {
          foreground = "#ea6962";
        };
        other_execute = {
          foreground = "#a9b665";
        };
        special_user_file = {
          foreground = "#ea6962";
        };
        special_other = {
          foreground = "#ea6962";
        };
        attribute = {
          foreground = "#928374";
        };
      };

      size = {
        major = {
          foreground = "#7daea3";
        };
        minor = {
          foreground = "#d3869b";
        };
        number_byte = {
          foreground = "#d4be98";
        };
        number_kilo = {
          foreground = "#89b482";
        };
        number_mega = {
          foreground = "#7daea3";
        };
        number_giga = {
          foreground = "#e78a4e";
        };
        number_huge = {
          foreground = "#ea6962";
        };
        unit_byte = {
          foreground = "#d4be98";
        };
        unit_kilo = {
          foreground = "#89b482";
        };
        unit_mega = {
          foreground = "#7daea3";
        };
        unit_giga = {
          foreground = "#e78a4e";
        };
        unit_huge = {
          foreground = "#ea6962";
        };
      };

      users = {
        user_you = {
          foreground = "#a9b665";
        };
        user_root = {
          foreground = "#d3869b";
        };
        user_other = {
          foreground = "#7daea3";
        };
        group_yours = {
          foreground = "#89b482";
        };
        group_root = {
          foreground = "#d3869b";
        };
        group_other = {
          foreground = "#d4be98";
        };
      };

      links = {
        normal = {
          foreground = "#89b482";
        };
        multi_link_file = {
          foreground = "#7daea3";
        };
      };

      git = {
        new = {
          foreground = "#a9b665";
        };
        modified = {
          foreground = "#d8a657";
        };
        deleted = {
          foreground = "#ea6962";
        };
        renamed = {
          foreground = "#7daea3";
        };
        typechange = {
          foreground = "#7daea3";
        };
        ignored = {
          foreground = "#665c54";
        };
        conflicted = {
          foreground = "#e78a4e";
        };
      };

      git_repo = {
        branch_main = {
          foreground = "#928374";
        };
        branch_other = {
          foreground = "#89b482";
        };
        git_clean = {
          foreground = "#504945";
        };
        git_dirty = {
          foreground = "#d8a657";
        };
      };

      security_context = {
        colon = {
          foreground = "#665c54";
        };
        user = {
          foreground = "#928374";
        };
        role = {
          foreground = "#7daea3";
        };
        typ = {
          foreground = "#a9b665";
        };
        range = {
          foreground = "#d3869b";
        };
      };

      file_type = {
        image = {
          foreground = "#89b482";
        };
        video = {
          foreground = "#7daea3";
        };
        music = {
          foreground = "#a9b665";
        };
        lossless = {
          foreground = "#89b482";
        };
        crypto = {
          foreground = "#ea6962";
        };
        document = {
          foreground = "#d4be98";
        };
        compressed = {
          foreground = "#e78a4e";
        };
        temp = {
          foreground = "#928374";
        };
        compiled = {
          foreground = "#928374";
        };
        build = {
          foreground = "#7daea3";
        };
        source = {
          foreground = "#d3869b";
        };
      };

      punctuation = {
        foreground = "#504945";
      };
      date = {
        foreground = "#d8a657";
      };
      inode = {
        foreground = "#928374";
      };
      blocks = {
        foreground = "#928374";
      };
      header = {
        foreground = "#d4be98";
      };
      octal = {
        foreground = "#e78a4e";
      };
      flags = {
        foreground = "#d3869b";
      };
      symlink_path = {
        foreground = "#89b482";
      };
      control_char = {
        foreground = "#e78a4e";
      };
      broken_symlink = {
        foreground = "#ea6962";
      };
      broken_path_overlay = {
        foreground = "#ea6962";
      };
    };
  };
}
