{
  programs.yazi = {
    enable = true;
    settings = {
      ratio = [ 1 4 3 ];
      sort_by = "alphabetical";
      sort_sensitive = false;
      sort_reverse = true;
      sort_dir_first = true;
      linemode = "none";
      show_hidden = false;
      show_symlink = true;
      title_format = "Yazi: {cwd}";
    };
  };
}
