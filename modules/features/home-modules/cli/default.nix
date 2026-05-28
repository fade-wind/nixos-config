{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./atuin.nix
    ./btop.nix
    ./eza.nix
    ./fzf.nix
    ./lazygit
    ./tmux
    ./vim.nix
    ./yazi
    ./zsh
    inputs.nixvim.homeModules.nixvim
  ];
  home.packages = with pkgs; [
    nodejs
    cargo
    gcc
    cifs-utils
    wl-clipboard
    btop
    eza
    fastfetch
    ffmpeg
    fzf
    imagemagick
    jp
    matugen
    poppler
    ripgrep
    starship
    yazi
    lazygit
    dconf
    uv
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        lla = "ls -la";
        ll = "ls -l";
        nrs = "sudo nixos-rebuild switch --flake $HOME/Projects/nixos-dotfiles#nixos-wsl";
      };
      initExtra = ''
        export STARSHIP_CONFIG="/etc/starship-root.toml"
        eval "$(starship init bash)"
      '';
    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "${config.home.homeDirectory}/Projects/nixos-dotfiles";
    };

    sesh = {
      enable = true;
      enableTmuxIntegration = false;
      settings = {
        blacklist = [ "scratch" ];
        cache = false;
        wildcard = [
          {
            pattern = "${config.home.homeDirectory}/Projects/*";
            startup_command = "nvim";
          }
          {
            pattern = "${config.home.homeDirectory}/Documents/*";
            startup_command = "nvim";
          }
        ];
      };
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

}

