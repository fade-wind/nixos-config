{
  programs.qutebrowser = {
    enable = true;

    quickmarks = {
      git = "https://git.fade-lab.com/";
      idm = "https://idm.fade-lab.com/";
      grafana = "https://grafana.fade-lab.com";
    };

    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
      ddg = "https://duckduckgo.com/?q={}";
      gh = "https://github.com/search?q={}";
      yt = "https://www.youtube.com/results?search_query={}";
      nix = "https://search.nixos.org/packages?channel=unstable&query={}";
      ks = "https://kubesearch.dev#{}";
    };

    settings = {
      "colors.webpage.preferred_color_scheme" = "dark";
      "colors.webpage.darkmode.enabled" = true;
      # Completion menu
      "colors.completion.fg" = "#d4be98";
      "colors.completion.category.fg" = "#d8a657";
      "colors.completion.category.bg" = "#3c3836";
      "colors.completion.item.selected.fg" = "#282828";
      "colors.completion.item.selected.bg" = "#d8a657";
      "colors.completion.match.fg" = "#d8a657";

      # Status bar
      "colors.statusbar.normal.fg" = "#d4be98";
      "colors.statusbar.normal.bg" = "#282828";
      "colors.statusbar.insert.fg" = "#282828";
      "colors.statusbar.insert.bg" = "#a9b665";
      "colors.statusbar.command.fg" = "#d4be98";
      "colors.statusbar.command.bg" = "#282828";
      "colors.statusbar.url.fg" = "#7daea3";
      "colors.statusbar.url.success.http.fg" = "#a9b665";
      "colors.statusbar.url.success.https.fg" = "#a9b665";
      "colors.statusbar.url.error.fg" = "#ea6962";

      # Tabs
      "colors.tabs.bar.bg" = "#282828";
      "colors.tabs.even.bg" = "#3c3836";
      "colors.tabs.even.fg" = "#a89984";
      "colors.tabs.odd.bg" = "#3c3836";
      "colors.tabs.odd.fg" = "#a89984";
      "colors.tabs.selected.even.bg" = "#d8a657";
      "colors.tabs.selected.even.fg" = "#282828";
      "colors.tabs.selected.odd.bg" = "#d8a657";
      "colors.tabs.selected.odd.fg" = "#282828";

      # Hints
      "colors.hints.fg" = "#282828";
      "colors.hints.bg" = "#d8a657";
      "colors.hints.match.fg" = "#7daea3";

      # Downloads
      "colors.downloads.bar.bg" = "#282828";
      "colors.downloads.start.fg" = "#d8a657";
      "colors.downloads.stop.fg" = "#a9b665";
      "colors.downloads.error.fg" = "#ea6962";

      # Prompts
      "colors.prompts.bg" = "#282828";
      "colors.prompts.fg" = "#d4be98";
      "colors.prompts.selected.bg" = "#3c3836";
      "colors.prompts.selected.fg" = "#d8a657";

      # Messages
      "colors.messages.info.bg" = "#282828";
      "colors.messages.info.fg" = "#7daea3";
      "colors.messages.warning.bg" = "#282828";
      "colors.messages.warning.fg" = "#d8a657";
      "colors.messages.error.bg" = "#282828";
      "colors.messages.error.fg" = "#ea6962";
    };
  };
}
