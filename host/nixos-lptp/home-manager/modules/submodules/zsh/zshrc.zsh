# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

#  Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# Custom functions
[ -f "$HOME/.config/zsh/functions.zsh" ] && source "$HOME/.config/zsh/functions.zsh"

# foot terminal functions
[ -f "$HOME/.config/zsh/foot.zsh" ] && source "$HOME/.config/zsh/foot.zsh"

# Updated NIXOS config
alias nrs="sudo nixos-rebuild switch --flake $HOME/Projects/nixos-dotfiles#nixos-lptp"
alias nrb="sudo nixos-rebuild boot --flake $HOME/Projects/nixos-dotfiles#nixos-lptp"
