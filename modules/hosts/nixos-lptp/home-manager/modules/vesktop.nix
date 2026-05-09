{ config, lib, pkgs, ... }:

{
  programs.discord = {
    enable = false;
    settings = {
      arRPC = "on";
      withOpenASAR = true;
    };
  };

  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = true;
      arRPC = "on";
      checkUpdates = true;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = true;
      tray = true;
      hardwareAcceleration = true;
      discordBranch = "stable";

      plugins = {
        BetterSessions.enable = true;
        BetterSettings.enable = true;
        ClearURLs.enable = true;
        FixImagesQuality.enable = true;
        FixYoutubeEmbeds.enable = true;
        FriendsSince.enable = true;
        GifPaste.enable = true;
        ImageZoom.enable = true;
        KeepCurrentChannel.enable = true;
        MessageLatency.enable = true;
        YoutubeAdBlock.enable = true;
        Unindent.enable = true;
        NotTypingAnimation.enable = true;
        SilentTyping.enable = true;
      };
    };
  };
}
