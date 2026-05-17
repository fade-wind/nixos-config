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
      theme.name = "tokyo-night";
    };

    themes = {
      "tokyo-night" = {
        theme.name = "tokyo-night";
        theme.parent = "default";
        colors = {
          AlertInfo = "#73daca";
          AlertWarn = "#e0af68";
          AlertError = "#f7768e";
          Annotation = "#414868";
          Base = "#a9b1d6";
          Guidance = "#ff9e64";
          Important = "#7aa2f7";
          Title = "#bb9af7";
        };
      };
    };
  };
}
