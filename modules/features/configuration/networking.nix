{ pkgs, vars, ... }:
{
  networking = {
    hostName = vars.hostname;
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openconnect
      ];
    };
    firewall.allowedTCPPorts = [
      22
      9090
    ];
  };
}
