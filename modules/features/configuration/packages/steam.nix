{
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override {
        extraArgs = "-cef-disable-gpu-compositing";
      };
    })
  ];
  programs.steam = {
      enable = true;
      protontricks.enable = true;
  };
}
