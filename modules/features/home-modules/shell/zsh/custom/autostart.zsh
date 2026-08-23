export PATH="$HOME/.config/bin:$HOME/.local/share/bin:$HOME/.local/bin:$HOME/.config/zide/bin/:$PATH"
[[ -f $HOME/.venv/bin/activate ]] && source $HOME/.venv/bin/activate

# Tmux autostart logic
if command -v tmux >/dev/null 2>&1; then
  # SSH: attach to a dedicated SSH session
  if [[ -z "$TMUX" && -n "$SSH_TTY" ]]; then
    tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
  # Neovide: attach to a dedicated Neovide session
  elif [[ -z "$TMUX" && -n "$NEOVIDE" ]]; then
    tmux attach-session -t neovide || tmux new-session -s neovide
  # Regular terminal: attach to main session (not in VS Code, Emacs, Vim, IntelliJ)
  elif [[ -z "$TMUX" && \
          -z "$VSCODE_IPC_HOOK_CLI" && \
          -z "$VSCODE_INJECTION" && \
          "$TERM_PROGRAM" != "vscode" && \
          -z "$INSIDE_EMACS" && \
          -z "$EMACS" && \
          -z "$VIM" && \
          -z "$INTELLIJ_ENVIRONMENT_READER" ]]; then
  (tmux has-session -t home 2>/dev/null && tmux attach -t home) || tmux new-session -s home 
  fi
fi


# Enables the following keybindings:
# CTRL-t = fzf select
# CTRL-r = fzf history
# ALT-c  = fzf cd
fpath=(~/.config/zsh/completions $fpath)
