{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    historyWidget.command = "";
    tmux.enableShellIntegration = true;

    defaultOptions = [
      "--highlight-line"
      "--info=inline-right"
      "--ansi"
      "--bind=right:accept,left:abort"
      "--layout=reverse"
      "--border"
      "--preview 'bat --style=numbers --color=always {}'"
    ];
    colors = {
      bg = "#282828";
      "bg+" = "#3c3836";
      fg = "#d4be98";
      "fg+" = "#ddc7a1";
      hl = "#ea6962";
      "hl+" = "#ea6962";
      info = "#a9b665";
      prompt = "#d8a657";
      pointer = "#d8a657";
      marker = "#a9b665";
      spinner = "#a9b665";
      header = "#a9b665";
      border = "#665c54";
      scrollbar = "#665c54";
      separator = "#665c54";
      gutter = "#282828";
      query = "#d4be98:regular";
    };
  };
}
