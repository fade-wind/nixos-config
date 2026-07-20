{ vars, pkgs, ... }:
{
  users.mutableUsers = false;
  users.users.${vars.username} = {
    hashedPasswordFile = "/pres-system/passwd";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "flatpak"
      "wheel"
      "audio"
      "networkmanager"
      "podman"
      "video"
      "storage"
    ];
  };
}
