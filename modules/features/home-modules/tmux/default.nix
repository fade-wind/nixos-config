{ pkgs, ... }:
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
      bind-key s display-popup -E -w 80% -h 70% -d '#{pane_current_path}' -T 'Session' tv sesh
      unbind w
      bind-key w display-popup -E -w 80% -h 70% -d '#{pane_current_path}' -T 'Windows' tv tmux-windows 
      bind-key g display-popup -E -w 80% -h 80% -d '#{pane_current_path}' -T 'LazyGit' lazygit
      source $HOME/.config/tmux/custom/statusbar.conf
      run "$HOME/.config/tmux/custom/remote.tmux"
    '';
    plugins = with pkgs;[
      tmuxPlugins.tmux-floax
      tmuxPlugins.yank
    ];
  };
}
