{
  preservation = {
    enable = true;
    preserveAt."/persistent" = {
      users.zpeppler = {
       directories = [
         "Projects"
         ".ssh"
         ".local/state/nvim"
         ".local/share/atuin"
         ".local/share/nvim"
         ".local/share/zoxide"
         ".tmux/plugins"
         ".venv"
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
