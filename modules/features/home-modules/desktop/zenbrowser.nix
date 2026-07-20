{ inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.base
  ];

  programs.zen-broswer = {
    enable = true;
    setAsDefaultBrowser = true;
  };
}
