{
  plugins = {
    which-key = {
      enable = true;
      settings = {
        preset = "helix";
      };
    };
    toggleterm.enable = true;
    lazygit.enable = true;
  };

  keymaps = [
    {
	    mode = "n";
	    key = "<leader>lg";
	    action = "<cmd>LazyGit<cr><cmd>hi LazyGitFloat guibg=NONE guifg=NONE<cr><cmd>setlocal winhl=NormalFloat:LazyGitFloat<cr>";
	    options = { desc = "LazyGit"; };
    }
    { 
      mode = "t"; 
      key = "<ESC>"; 
      action = "<C-\\><C-n>";
    } 
    { 
      mode = "n"; 
      key = "<leader>T"; 
      action = "<CMD>ToggleTerm<CR>"; 
      options = { desc = "Toggle Terminal"; };
    }
  ];
  
  imports = [
    ./bufferline.nix
    ./dashboard.nix
    ./edgy.nix
    ./lualine.nix
    ./neotree.nix
  ];
}
