{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      isDefault = true;

      settings = {
        "browser.startup.homepage" = "https://www.google.com";
        "browser.search.region" = "US";
        "browser.search.isUS" = true;

        # Dark mode preference
        "layout.css.prefers-color-scheme.content-override" = 0;

        "extensions.autoDisableScopes" = 0;
      };

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
      ];
    };
  };
}
