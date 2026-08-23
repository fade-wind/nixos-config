{ configs, pkgs, ... }:

{
  environment.etc."starship-root.toml".text = ''
    "$schema" = 'https://starship.rs/config-schema.json'

    format = """
    [](orange)\
    $username\
    [](bright_black)\
    [](green)\
    $directory\
    [](bright_black)\
    $git_branch\
    $git_status\
    $container\
    $c\
    $rust\
    $golang\
    $nodejs\
    $php\
    $java\
    $kotlin\
    $haskell\
    $python\
    $nix_shell\
    $line_break\
    $character"""

    palette = 'gruvbox_material'

    [username]
    show_always = true
    style_user = "fg:fg bg:bright_black"
    style_root = "fg:fg bg:bright_black"
    format = '[ $user]($style)'

    [directory]
    style = "fg:fg bg:bright_black"
    format = "[ $path ]($style)"
    truncation_length = 3
    truncation_symbol = "…/"

    [directory.substitutions]
    "Documents" = "󰈙 "
    "Downloads" = " "
    "Music" = "󰝚 "
    "Pictures" = " "
    "Projects" = "󰲋 "

    [git_branch]
    symbol = ""
    style = "fg:fg bg:bright_black"
    format = '[](yellow)[[ $symbol $branch ](fg:fg bg:bright_black)]($style)'

    [git_status]
    style = "fg:fg bg:bright_black"
    format = '[[($all_status$ahead_behind )](fg:fg bg:bright_black)]($style)[](bright_black)'

    [container]
    disabled = false
    symbol = "󰡨"
    style = "bg:bright_black"
    format = '[](magenta)[[ $symbol \[$name\]](fg:fg bg:bright_black)]($style)[](bright_black)'

    [nodejs]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [c]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [rust]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [golang]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [php]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [java]
    symbol = " "
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [kotlin]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [haskell]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [python]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version)(\(#$virtualenv\)) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [nix_shell]
    symbol = " "
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $state)(\(#$name\)) ](fg:fg bg:bright_black)]($style)[](bright_black)'

    [docker_context]
    symbol = ""
    style = "bg:sapphire"
    format = '[[ $symbol( $context) ](fg:crust bg:sapphire)]($style)'

    [conda]
    symbol = "  "
    style = "fg:crust bg:sapphire"
    format = '[$symbol$environment ]($style)'
    ignore_base = false

    [time]
    disabled = false
    time_format = "%R"
    style = "bg:magenta"
    format = '[[  $time ](fg:fg_dark bg:magenta)]($style)'

    [line_break]
    disabled = false

    [character]
    disabled = false
    success_symbol = '[❯](bold fg:green)'
    error_symbol = '[❯](bold fg:red)'
    vimcmd_symbol = '[❮](bold fg:green)'
    vimcmd_replace_one_symbol = '[❮](bold fg:magenta)'
    vimcmd_replace_symbol = '[❮](bold fg:magenta)'
    vimcmd_visual_symbol = '[❮](bold fg:yellow)'

    [cmd_duration]
    show_milliseconds = true
    format = " in $duration "
    style = "bg:magenta"
    disabled = false
    show_notifications = true
    min_time_to_notify = 45000

    [palettes.gruvbox_material]
    # Backgrounds
    bg            = "#282828"
    bg_dark       = "#1d2021"
    bg_highlight  = "#3c3836"
    light_grey = "#c6c6c6"

    # Foregrounds
    fg            = "#d4be98"
    fg_dark       = "#a89984"
    fg_gutter     = "#665c54"

    # Core colors
    black         = "#1d2021"
    red           = "#ea6962"
    green         = "#a9b665"
    yellow        = "#d8a657"
    blue          = "#7daea3"
    magenta       = "#d3869b"
    cyan          = "#89b482"
    white         = "#d4be98"

    # Bright variants
    bright_black  = "#504945"
    bright_red    = "#ea6962"
    bright_green  = "#a9b665"
    bright_yellow = "#d8a657"
    bright_blue   = "#7daea3"
    bright_magenta= "#d3869b"
    bright_cyan   = "#89b482"
    bright_white  = "#ddc7a1"

    # Extra accents
    orange        = "#e78a4e"
    purple        = "#d3869b"
    teal          = "#7daea3"
    comment       = "#928374"
  '';

  programs.bash.interactiveShellInit = ''
    if [ "$USER" = "root" ]; then
      export STARSHIP_CONFIG=/etc/starship-root.toml
    fi
    eval "$(${pkgs.starship}/bin/starship init bash)"
  '';
}
