{ pkgs, ...  }:
{
  environment.pathsToLink = [ "/share/zsh" ];
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gcc
    gnumake
    libtool
    curl
    zip
    unzip
    coreutils
    clang
    cmake
    sshfs
    uv
    cifs-utils

    podman-compose
    cockpit
    cockpit-podman

    gnome-keyring

    kubectl
    tmux
    sesh
    television
    wl-clipboard
    lua5_1
    luarocks
    tree-sitter
    unzip
    fd
    ripgrep
    fzf
    imagemagick
    bat
    jq
    yq
    nodejs
  ];
}
