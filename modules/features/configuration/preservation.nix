{
  preservation = {
    enable = true;
    preserveAt."/persistent" = {
      users.zpeppler = {
        directories = [
         "Projects"
         ".ssh"
         ".local/share/atuin"
         ".local/share/zoxide"
         ".local/state/nvim"
         ".venv"
         ".kube"
        ];
      };

      files = [
        { 
          file = "/etc/machine-id"; 
          inInitrd = true; 
        }
      ];

      directories = [
        "/etc/nixos"
        "/var/lib/systemd/timers"
        "/var/lib/nixos"
        "/var/log"
        "/etc/NetworkManager/system-connections"
        "/etc/ssh"
      ];
    };
  };
}
