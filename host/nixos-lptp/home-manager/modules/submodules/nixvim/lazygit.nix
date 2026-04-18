{
  plugins.lazygit = { 
    enable = true;
    settings = {
      floating_window_winblend = 0;
      floating_window_scaling_factor = 0.9;
      floating_window_use_plenary = 0;
      floating_window_border_chars = [ "╭"  "─"  "╮"  "│"  "╯"  "─"  "╰"  "│" ];
      use_neovim_remote = 1; 
      use_custom_config_file_path = 0;
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>lg";
      action = "<cmd>LazyGit<cr><cmd>hi LazyGitFloat guibg=NONE guifg=NONE<cr><cmd>setlocal winhl=NormalFloat:LazyGitFloat<cr>"; 
      options = {
        silent = true;
        noremap = true;
        desc = "LazyGit";
      };
    }
  ];
}
