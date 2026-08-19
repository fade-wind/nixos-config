{ vars, ... }:
{
  programs.zsh.shellAliases = {
    ls = "eza";
    ll = "eza -l"; 
    la = "eza -a"; 
    lla = "eza -a -l -h";
    tree = "eza --tree";
    grep = "rg --color=auto";
    diff = "diff --color=auto";
    df = "df -h";
    cl = "zoxide_cd_and_list";
    cd = "z";
    ff = "fzf --preview 'bat --style=numbers --color=always {}'";
    nrs = "sudo nixos-rebuild switch --flake $HOME/Projects/nixos-config#${vars.hostname}";
    nrb = "sudo nixos-rebuild boot --flake $HOME/Projects/nixos-config#${vars.hostname}";
    gh-add = "eval $(ssh-agent -s) && ssh-add $HOME/.ssh/github";
    gh-push = "gh-add && git push";
    gh-pull = "gh-add && git pull";
  };
}
