{
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpak.repo";
      }
    ];
    packages = [
      "app.zen_browser.zen"
      "com.github.tchx84.Flatseal"
    ];
  };
}
