{
  config = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    luaLoader.enable = true;
    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;

    opts = {
      # Performance and Timing
      updatetime = 100;
      lazyredraw = false;
      synmaxcol = 240;
      timeoutlen = 500;
      
      # UI & Appearance
      ## Enable relative line numbers
      number = true;
      relativenumber = true;
      cursorline = true;
      signcolumn = "yes";
      laststatus = 3;
      showmode = false;
      showmatch = true;
      matchtime = 1;
      termguicolors = true;
      winborder = "rounded";
      
      # Windows & Splits
      splitbelow = true;
      splitright = true;

      # Search
      ignorecase = true;
      smartcase = true;
      incsearch = true;
      hlsearch = true;

      # Files and Buffers
      swapfile = false;
      backup = false;
      writebackup = false;
      undofile = true;
      autoread = true;
      fileencoding = "utf-8";
      modeline = true;
      modelines = 100;
     
      # Indents and Formatting
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      autoindent = true;
      breakindent = true;
      preserveindent = true;
      linebreak = true;
      wrap = true;
      
      # Completion and Popup
      pumheight = 10;
      infercase = true;
      completeopt = "menuone,noinsert,noselect";

      # Command Line and Message
      cmdheight = 0;
      history = 100;
      report = 9001;

      # Editor Behavior
      virtualedit = "block";
      startofline = true;
      title = true;

      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";

      scrolloff = 8;
      mouse = "a";

      encoding = "utf-8";
      
      modifiable = true;
    };
  }; 
}
