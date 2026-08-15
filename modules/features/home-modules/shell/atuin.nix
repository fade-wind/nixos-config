{
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      style = "auto";
      inline_height = 0;
      enter_accept = true;
      records = true;
      ignored_commands = [
        "cd"
        "cl"
        "ls"
        "ll"
        "lla"
        "la"
        "tree"
      ];
      theme.name = "gruvbox-material";
    };

    themes = {
      "gruvbox-material" = {
        theme.name = "gruvbox-material";
        theme.parent = "default";
        colors = {
          AlertInfo = "#a9b665";
          AlertWarn = "#d8a657";
          AlertError = "#ea6962";
          Annotation = "#665c54";
          Base = "#d4be98";
          Guidance = "#e78a4e";
          Important = "#7daea3";
          Title = "#d3869b";
        };
      };
    };
  };
}
