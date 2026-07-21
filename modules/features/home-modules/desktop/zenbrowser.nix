{ inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    profiles.default.search = {
      force = true;
      default = "ddg";
      engines = {
        github = {
          name = "GitHub Search";
          urls = [
            {
              template = "https://github.com/search?q={searchTerms}";
            }
          ];
          definedAliases = [ "@gh" ];
        };
        kubesearch = {
          name = "KubeSearch";
          urls = [
            {
              template = "https://kubesearch.dev#{searchTerms}";
            }
          ];
          definedAliases = [ "@ks" ];
        };
      };
    };
  };
}
