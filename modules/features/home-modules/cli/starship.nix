{ configs, pkgs, ... }:

{
  environment.etc."starship-root.toml".text = ''
    "$schema" = 'https://starship.rs/config-schema.json'
    
    format = """
    [](cyan)\
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
    
    palette = 'tokyonight_storm'
    
    [username]
    show_always = true
    style_user = "fg:white bg:bright_black"
    style_root = "fg:white bg:bright_black"
    format = '[ $user]($style)'
    
    [directory]
    style = "fg:white bg:bright_black"
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
    style = "fg:white bg:bright_black"
    format = '[](yellow)[[ $symbol $branch ](fg:white bg:bright_black)]($style)'
    
    [git_status]
    style = "fg:white bg:bright_black"
    format = '[[($all_status$ahead_behind )](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [container]
    disabled = false
    symbol = "󰡨"
    style = "bg:bright_black"
    format = '[](magenta)[[ $symbol \[$name\]](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [nodejs]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [c]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [rust]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [golang]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [php]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [java]
    symbol = " "
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [kotlin]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [haskell]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [python]
    symbol = ""
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $version)(\(#$virtualenv\)) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
    [nix_shell]
    symbol = " "
    style = "bg:bright_black"
    format = '[](red)[[ $symbol( $state)(\(#$name\)) ](fg:white bg:bright_black)]($style)[](bright_black)'
    
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
    
    [palettes.tokyonight_storm]
    # Backgrounds
    bg            = "#24283b"
    bg_dark       = "#1f2335"
    bg_highlight  = "#292e42"
    
    # Foregrounds
    fg            = "#c0caf5"
    fg_dark       = "#a9b1d6"
    fg_gutter     = "#3b4261"
    
    # Core colors
    black         = "#1d202f"
    red           = "#f7768e"
    green         = "#9ece6a"
    yellow        = "#e0af68"
    blue          = "#7aa2f7"
    magenta       = "#bb9af7"
    cyan          = "#7dcfff"
    white         = "#c0caf5"
    
    # Bright variants
    bright_black  = "#414868"
    bright_red    = "#f7768e"
    bright_green  = "#9ece6a"
    bright_yellow = "#e0af68"
    bright_blue   = "#7aa2f7"
    bright_magenta= "#bb9af7"
    bright_cyan   = "#7dcfff"
    bright_white  = "#c0caf5"
    
    # Extra accents (useful in Starship)
    orange        = "#ff9e64"
    purple        = "#9d7cd8"
    teal          = "#1abc9c"
    comment       = "#565f89"
  '';

  programs.bash.interactiveShellInit = ''
    if [ "$USER" = "root" ]; then
      export STARSHIP_CONFIG=/etc/starship-root.toml
    fi
    eval "$(${pkgs.starship}/bin/starship init bash)"
  '';
}
