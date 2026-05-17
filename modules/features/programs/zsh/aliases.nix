{
  programs.zsh.shellAliases = {
    ls = "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first";
    ll = "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -l --git -h";
    la = "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a";
    lla = "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h";
    tree = "eza --tree --icons";
    grep = "rg --color=auto";
    diff = "diff --color=auto";
    df = "df -h";
    cl = "zoxide_cd_and_list";
    cd = "z";
    ff = "fzf --preview 'bat --style=numbers --color=always {}'";
    nrs = "sudo nixos-rebuild switch --flake $HOME/Projects/nixos-dotfiles#$(hostname)";
    nrb = "sudo nixos-rebuild boot --flake $HOME/Projects/nixos-dotfiles#$(hostname)";
    gh-add = "eval $(ssh-agent -s) && ssh-add $HOME/.ssh/github";
    gh-push = "gh-add && git push";
    gh-pull = "gh-add && git pull";
  };
}
