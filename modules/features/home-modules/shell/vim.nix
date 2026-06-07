{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      mouse = "a";
    };
    extraConfig = ''
      filetype plugin indent on
      syntax on
      set backspace=indent,eol,start
      set smartindent
      set softtabstop=2
      set termguicolors
      set laststatus=2
      let mapleader = " "
      nnoremap <leader>cd :Ex<CR>
      nnoremap <silent><C-s> :w<CR>
      nnoremap <silent><C-r> :so<CR>
      nnoremap <silent><C-q> :q<CR>
      nnoremap <leader>ff :Files<CR>
      nnoremap <leader>fo :History<CR>
      nnoremap <leader>fb :Buffer<CR>
      nnoremap <leader>fg :RG<Space>
    '';
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      fzf-vim
      lightline-vim
    ];
  };
}
