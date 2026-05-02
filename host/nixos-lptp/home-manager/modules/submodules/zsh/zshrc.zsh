# Custom zsh
source "$HOME/.config/zsh/custom.zsh"

#  Aliases
source "$HOME/.config/zsh/aliases.zsh"

# Custom functions
source "$HOME/.config/zsh/functions.zsh"

# Updated NIXOS config
alias nrs="sudo nixos-rebuild switch --flake $HOME/Projects/nixos-dotfiles#$(hostname -f)"
alias nrb="sudo nixos-rebuild boot --flake $HOME/Projects/nixos-dotfiles#$(hostname -f)"
