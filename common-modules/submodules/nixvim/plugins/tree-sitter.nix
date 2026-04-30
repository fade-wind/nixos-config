{ pkgs, ... }:
{
 
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    folding.enable = false;
    indent.enable = true;
    nixvimInjections = true;

     grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
       bash
       json
       lua
       markdown
       nix
       regex
       toml
       vim
       vimdoc
       yaml
     ];
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "af" = "@function.outer";
          "if" = "@funciton.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "ai" = "@conditional.outer";
          "ii" = "@conditional.inner";
          "al" = "@loop.outer";
          "il" = "@loop.inner";
          "at" = "@comment.outer";
        };
      };
    };
  };
}
