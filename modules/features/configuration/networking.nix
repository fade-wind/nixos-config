{ pkgs, vars, ... }:
{
  networking = {
    hostName = vars.hostname;
    networkmanager = {
      enable = true;
      insertNameservers = [
        "192.168.1.15"
        "1.1.1.1"
      ];
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
