{ config, ... }:

{
  programs.television.channels = {
    channels = {
      metadata = {
        name = "channels";
        description = "Select a television channel";
        requirements = ["tv" "bat"];
      };
      source.command = ["tv list-channels"];
      preview = {
        command = "bat -pn --color always TELEVISION_CONFIG:-${config.home.homeDirectory}/.config/television/cable/{}.toml";
        shell = "zsh";
      };
      keybindings.enter = "actions:channel-enter";
      actions.channel-enter = {
        description = "Enter a television channel";
        command = "tv {}";
        mode = "execute";
      };
    };
    dirs = {
      metadata = {
        name = "dirs";
        description = "A channel to select from directories";
        requirements = ["fd"];
      };
      source.command = ["fd -t d" "fd -t d --hidden"];
      preview.command = "ls -la --color=always '{}'";
      keybindings.shortcut = "f2";
      actions.cd = {
        description = "Open a shell in the selected directory";
        command = "cd '{}' && $SHELL";
        mode = "execute";
      };
      actions.goto_parent_dir = {
        description = "Re-opens tv in the parent directory";
        command = "tv dirs ..";
        mode = "execute";
      };
    };
    files = {
      metadata = {
        name = "files";
        description = "A channel to select files and directories";
        requirements = ["fd" "bat"];
      };
      source.command = ["fd -t f" "fd -t f -H"];
      preview = {
        command = "bat -n --color=always '{}'";
        env = { BAT_THEME = "ansi"; };
      };
      keybindings = {
        shortcut = "f1";
        f12 = "actions:edit";
        ctrl-up = "actions:goto_parent_dir";
      };
      actions.edit = {
        description = "Opens the selected entries with the default editor (falls back to vim)";
        command = "nvim '{}'";
        shell = "zsh";
        mode = "execute";
      };
      actions.goto_parent_dir = {
        description = "Re-opens tv in the parent directory";
        command = "tv files ..";
        mode = "execute";
      };
    };
    git-branch = {
      metadata = {
        name = "git-branch";
        description = "A channel to select from git branches";
        requirements = ["git"];
      };
      source = {
        command = "git --no-pager branch --all --format=\"%(refname:short)\"";
        output = "{split: :0}";
      };
      preview.command = "git show -p --stat --pretty=fuller --color=always '{0}'";
      keybindings = {
        enter = "actions:checkout";
        ctrl-d = "actions:delete";
        ctrl-m = "actions:merge";
        ctrl-r = "actions:rebase";
      };
      actions.checkout = {
        description = "Checkout the selected branch";
        command = "git checkout '{0}'";
        mode = "execute";
      };
      actions.delete = {
        description = "Delete the selected branch";
        command = "git branch -d '{0}'";
        mode = "execute";
      };
      actions.merge = {
        description = "Merge the selected branch into current branch";
        command = "git merge '{0}'";
        mode = "execute";
      };
      actions.rebase = {
        description = "Rebase current branch onto the selected branch";
        command = "git rebase '{0}'";
        mode = "execute";
      };
    };
    git-repos = {
      metadata = {
        name = "git-repos";
        requirements = ["fd" "git"];
        description = ''
        A channel to select from git repositories on your local machine.

        This channel uses `fd` to find directories that contain a `.git` subdirectory, and then allows you to preview the git log of the selected repository.
        '';
      };
      source = {
        command = "fd -g .git -HL -t d -d 10 --prune ~ -E 'Library' -E 'Application Support' --exec dirname '{}'";
        display = "{split:/:-1}";
      };
      preview.command = "cd '{}'; git log -n 200 --pretty=medium --all --graph --color";
      keybindings = {
        enter = "actions:cd";
        ctrl-e = "actions:edit";
      };
      actions.cd = {
        description = "Open a new shell in the selected repository";
        command = "cd '{}' && $SHELL";
        mode = "execute";
      };
      actions.edit = {
        description = "Open the repository in editor";
        command = "nvim '{}'";
        shell = "bash";
        mode = "execute";
      };
    };
    git-stash = {
      metadata = {
        name = "git-stash";
        description = "Browse and manage git stash entries";
        requirements = ["git"];
      };
      source = {
        command = "git stash list --color=always";
        ansi = true;
        output = "{strip_ansi|split:\\::0}";
        no_sort = true;
        frecency = false;
      };
      preview.command = "git stash show -p --color=always '{strip_ansi|split:\\::0}'";
      ui.layout = "portrait";
      keybindings = {
        enter = "actions:apply";
        ctrl-p = "actions:pop";
        ctrl-d = "actions:drop";
      };
      actions.apply = {
        description = "Apply the selected stash";
        command = "git stash apply '{strip_ansi|split:\\::0}'";
        mode = "execute";
      };
      actions.pop = {
        description = "Pop the selected stash (apply and remove)";
        command = "git stash pop '{strip_ansi|split:\\::0}'";
        mode = "execute";
      };
      actions.drop = {
        description = "Drop the selected stash";
        command = "git stash drop '{strip_ansi|split:\\::0}'";
        mode = "execute";
      };
    };
    k8s-pods = {
      metadata = {
        name = "k8s-pods";
        description = "List and preview Pods in a Kubernetes Cluster.\n\nThe first source lists only from the current namespace, while the second lists from all.\n\nKeybindings\n\nPress `ctrl-e` to execute shell inside the selected Pod.\nPress `ctrl-d` to delete the selected Pod.\nPress `ctrl-l` to print and follow the logs of the selected Pod.\n";
        requirements = [ "kubectl"];
      };
      source = {
        command = [ "  kubectl get pods -o go-template --template '{{range .items}}{{.metadata.namespace}} {{.metadata.name}}{{\"\\n\"}}{{end}}'\n  " "  kubectl get pods -o go-template --template '{{range .items}}{{.metadata.namespace}} {{.metadata.name}}{{\"\\n\"}}{{end}}' --all-namespaces\n  "];
        output = "{1}";
      };
      preview.command = "kubectl describe -n {0} pods/{1}";
      ui.layout = "portrait";
      keybindings = {
        ctrl-d = "actions:delete";
        ctrl-e = "actions:exec";
        ctrl-l = "actions:logs";
      };
      ui.preview_panel.size = 60;
      actions.exec = {
        description = "Execute shell inside the selected Pod";
        command = "kubectl exec -i -t -n {0} pods/{1} -- /bin/sh";
        mode = "execute";
      };
      actions.delete = {
        description = "Delete the selected Pod";
        command = "kubectl delete -n {0} pods/{1}";
        mode = "execute";
      };
      actions.logs = {
        description = "Follow logs of the selected Pod";
        command = "kubectl logs -f -n {0} pods/{1}";
        mode = "execute";
      };
    };
    sesh = {
      metadata = {
        name = "sesh";
        description = "Session manager integrating tmux sessions, zoxide directories, and config paths";
        requirements = [ "sesh" "fd"];
      };
      source = {
        command = [ "sesh list --icons" "sesh list -t --icons" "sesh list -c --icons" "sesh list -z --icons" "fd -H -d 2 -t d -E .Trash . ~"];
        ansi = true;
        output = "{strip_ansi|split: :1..|join: }";
      };
      preview.command = "sesh preview '{strip_ansi|split: :1..|join: }'";
      keybindings = { 
        enter = "actions:connect";
        ctrl-d = [ "actions:kill_session" "reload_source"];
      };
      actions.connect = {
        description = "Connect to selected session";
        command = "sesh connect '{strip_ansi|split: :1..|join: }'";
        mode = "execute";
      };
      actions.kill_session = {
        description = "Kill selected tmux session (press Ctrl+r to reload)";
        command = "tmux kill-session -t '{strip_ansi|split: :1..|join: }'";
        mode = "fork";
      };
    };
    tmux-windows = {
      metadata = {
        name = "tmux-windows";
        description = "List and switch between tmux windows";
        requirements = [ "tmux"];
      };
      source = {
        command = "tmux list-windows -a -F '#{session_name}:#{window_index}\t#{window_name}\t#{pane_current_command}'";
        display = "{split:\t:0} - {split:\t:1} - {split:\t:2}";
        output = "{split:\t:0}";
      };
      preview.command = "tmux capture-pane -t '{split:\t:0}' -p 2>/dev/null || echo 'No preview available'";
      actions.select = {
        description = "Switch to the selected window";
        command = "tmux select-window -t '{split:\t:0}'";
        mode = "execute";
      };
      actions.kill = {
        description = "Kill the selected window";
        command = "tmux kill-window -t '{split:\t:0}'";
        mode = "fork";
      };
    };
    zoxide = {
      metadata = {
        name = "zoxide";
        description = "Browse zoxide directory history";
        requirements = ["zoxide"];
      };
      source = {
        command = "zoxide query -l";
        no_sort = true;
        frecency = false;
      };
      preview.command = "ls -la --color=always '{}'";
      keybindings = {
        enter = "actions:cd";
        ctrl-d = "actions:remove";
      };
      actions.cd = {
        description = "Change to the selected directory";
        command = "cd '{}' && $SHELL";
        mode = "execute";
      };
      actions.remove = {
        description = "Remove the selected directory from zoxide";
        command = "zoxide remove '{}'";
        mode = "fork";
      };
    };
  };
}
