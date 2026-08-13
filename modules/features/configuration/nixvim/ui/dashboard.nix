{
  plugins.dashboard = {
    enable = true;
    settings = {
      theme = "doom";
      config = {
        header = [
          "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
          "░    ░░░░░   ░░░░░░░░░░░░░░░░░░░░░░░   ░░░░░░░░░   ░░░░░░░░░░░░░░░░░░"
          "▒  ▒   ▒▒▒   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒   ▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
          "▒   ▒   ▒▒   ▒▒▒▒   ▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒▒▒    ▒   ▒   ▒"
          "▓   ▓▓   ▓   ▓▓  ▓▓▓   ▓▓▓   ▓▓   ▓▓▓▓▓   ▓▓▓   ▓▓▓▓   ▓▓   ▓▓  ▓▓   "
          "▓   ▓▓▓  ▓   ▓         ▓▓   ▓▓▓▓   ▓▓▓▓▓   ▓   ▓▓▓▓▓   ▓▓   ▓▓  ▓▓   "
          "▓   ▓▓▓▓  ▓  ▓  ▓▓▓▓▓▓▓▓▓▓   ▓▓   ▓▓▓▓▓▓▓     ▓▓▓▓▓▓   ▓▓   ▓▓  ▓▓   "
          "█   ██████   ███     ███████   ███████████   ███████   █    ██  ██   "
          "█████████████████████████████████████████████████████████████████████"
        ];
        center = [
          { action = "FzfLua files"; desc = " Find File"; icon = " "; key = "f"; }
			    { action = "ene | startinsert"; desc = " New File"; icon = " "; key = "n"; }
			    { action = "FzfLua live_grep"; desc = " Find Text"; icon = " "; key = "g"; }
          {
            action.__raw = ''
              function()
                require("persistence").select()
              end
            '';
            desc = " Restore Session";
				    icon = " ";
				    key = "s";
          }
          {
            action.__raw = ''
              function()
                vim.api.nvim_input("<CMD>qa<CR>")
              end
            '';
				    desc = " Quit";
				    icon = " ";
				    key = "q";
          }
        ];
      };
    };
  };
}
