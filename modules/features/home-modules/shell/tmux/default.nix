{ inputs, pkgs, ... }:
{
  home.file.".config/tmux/custom".source = ./custom;
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    mouse = true;
    prefix = "C-Space";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";

    extraConfig = ''
      set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
      set -g set-clipboard on
      set -g status-interval 3
      set -g display-time 2000
      set -g pane-base-index 1
      set -g renumber-windows on
      bind r source-file $HOME/.config/tmux/tmux.conf \; display-message " 󰑓 Config reloaded"
      unbind %
      bind \\ split-window -h -f -c "#{pane_current_path}"
      unbind \"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      bind Tab last-window
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection
      unbind s
      bind-key s run-shell "sesh connect \"$(
        sesh list --icons | fzf-tmux -p 80%,70% \
          --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
          --header '  C-a all C-t tmux C-g configs C-x zoxide C-d tmux kill C-f find' \
          --bind 'tab:down,btab:up' \
          --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
          --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
          --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
          --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
          --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
          --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
          --preview-window 'right:55%' \
          --preview 'sesh preview {}'
      )\""
      unbind w
      bind-key w run-shell "sesh window \"$(sesh window | fzf-tmux -p 60%,50% --prompt '🪟  ')\""
      bind-key g display-popup -E -w 80% -h 80% -d '#{pane_current_path}' -T 'LazyGit' lazygit
      source $HOME/.config/tmux/custom/statusbar.conf
      run "$HOME/.config/tmux/custom/remote.tmux"
    '';
    plugins = with pkgs; [
      tmuxPlugins.tmux-floax
      tmuxPlugins.yank
      tmuxPlugins.vim-tmux-navigator
      inputs.tmux-nerd-font-window-name.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}

